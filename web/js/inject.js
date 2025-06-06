const utils = {
  generateUUIDv4() {
    return ([1e7] + -1e3 + -4e3 + -8e3 + -1e11).replace(/[018]/g, (c) =>
      (
        c ^
        (crypto.getRandomValues(new Uint8Array(1))[0] & (15 >> (c / 4)))
      ).toString(16),
    );
  },

  parseDuration(durationStr) {
    const hourMatch = durationStr.match(/(\d+)\s*h/);
    const minMatch = durationStr.match(/(\d+)\s*m/);
    const hours = hourMatch ? parseInt(hourMatch[1], 10) : 0;
    const minutes = minMatch ? parseInt(minMatch[1], 10) : 0;
    return hours * 60 + minutes;
  },
};

class EduLinkAPI {
  constructor(authToken) {
    this.authToken = authToken;
    this.baseHeaders = {
      "Content-Type": "application/json;charset=utf-8",
      Accept: "application/json, text/plain, */*",
      Authorization: `Bearer ${authToken}`,
      Origin: window.location.origin,
      Referer: window.location.href,
    };
    this.cachedExams = null;
    this.cachedClubs = null;
    this.cachedClubDetails = new Map();
  }

  async makeRequest(method, params) {
    const response = await fetch(
      `https://www6.edulinkone.com/api/?method=${method}`,
      {
        method: "POST",
        headers: {
          ...this.baseHeaders,
          "X-API-Method": method,
        },
        body: JSON.stringify({
          id: "1",
          jsonrpc: "2.0",
          method: method,
          params: params,
          uuid: utils.generateUUIDv4(),
        }),
      },
    );
    return response.json();
  }

  async getExams(learnerId) {
    if (this.cachedExams) return this.cachedExams;

    const data = await this.makeRequest("EduLink.Exams", {
      learner_id: learnerId,
    });
    this.cachedExams = data?.result?.timetable || [];
    return this.cachedExams;
  }

  async getClubs(learnerId) {
    if (this.cachedClubs) return this.cachedClubs;

    const data = await this.makeRequest("EduLink.Clubs", {
      learner_id: learnerId,
      member: true,
    });
    this.cachedClubs = data?.result?.clubs?.filter((c) => c.next_session) || [];
    return this.cachedClubs;
  }

  async getClubDetails(clubId) {
    if (this.cachedClubDetails.has(clubId))
      return this.cachedClubDetails.get(clubId);

    const data = await this.makeRequest("EduLink.Club", { club_id: clubId });
    const clubDetails = data?.result?.club;
    if (clubDetails) {
      this.cachedClubDetails.set(clubId, clubDetails);
    }
    return clubDetails;
  }
}

class TimetableManager {
  constructor(timetableEl) {
    this.currentTimetable = null;
    this.timetableEl = timetableEl;
    this.lastProcessedScope = null;
  }

  createPeriod(day, options = {}) {
    const {
      periodType = "EX",
      startTime = "08:30",
      endTime = "08:34",
      isEmpty = false,
    } = options;
    const existingIds = new Set(day.periods.map((p) => parseInt(p.id)));
    const existingExternalIds = new Set(
      day.periods.map((p) => parseInt(p.external_id)),
    );

    let baseId;
    do {
      baseId = 20194 + Math.floor(Math.random() * (20288 - 20194 + 1));
    } while (existingIds.has(baseId));

    let baseExternalId;
    do {
      baseExternalId = 3954 + Math.floor(Math.random() * (4065 - 3954 + 1));
    } while (existingExternalIds.has(baseExternalId));

    const dayPrefix = day.original_name || "MonA";
    const name = `${dayPrefix}:${periodType}`;

    const newPeriod = {
      id: String(baseId),
      external_id: String(baseExternalId),
      name: name,
      start_time: startTime,
      end_time: endTime,
      empty: isEmpty,
      ids: [String(baseId)],
    };

    if (!Array.isArray(day.periods)) {
      day.periods = [];
    }
    const insertIndex = day.periods.findIndex(
      (p) => p.start_time > newPeriod.start_time,
    );
    if (insertIndex === -1) {
      day.periods.push(newPeriod);
    } else {
      day.periods.splice(insertIndex, 0, newPeriod);
    }

    return newPeriod;
  }

  createTestPeriod() {
    const timetable = this.getTimetableData();
    if (!timetable?.timetable?.weeks?.[0]?.days?.[0]) return;

    const day = timetable.timetable.weeks[0].days[0];

    const periodExists = day.periods.some(
      (p) =>
        p.name === `${day.original_name}:Guh` &&
        p.start_time === "12:50" &&
        p.end_time === "13:30",
    );

    if (!periodExists) {
      this.createPeriod(day, {
        periodType: "Guh",
        startTime: "12:50",
        endTime: "13:30",
        isEmpty: true,
      });
    }
  }

  async initialize() {
    const injector = angular.element(document.body).injector();
    const userService = injector.get("userService");

    if (!userService?.data?.user?.data?.id || this.isDemoMode(userService)) {
      return null;
    }

    const learnerId = userService.data.user.data.id;
    const authToken = userService.data.user._local.authtoken;

    return { learnerId, authToken };
  }

  isDemoMode(userService) {
    return (
      userService?.data?.user?._local?.establishment?.name ===
        "Green Abbey School" &&
      userService?.data?.user?.data?.id === "7338" &&
      userService?.data?.user?._local?.login_method === "admin" &&
      userService?.data?.user?.data?.establishmentId === "2"
    );
  }

  getTimetableData() {
    const ngEl = angular.element(this.timetableEl);
    const ctrl = ngEl.controller("timetable");
    return ctrl?._timetableService?.data?.timetables?.[0];
  }

  async processExams(api, learnerId, timetable) {
    try {
      const examTimetable = await api.getExams(learnerId);

      for (const exam of examTimetable) {
        const examStartDate = new Date(exam.datetime.replace(" ", "T"));
        const examDate = new Date(exam.datetime);
        const examDurationMinutes = utils.parseDuration(exam.duration);
        const examEndDate = new Date(
          examDate.getTime() + examDurationMinutes * 60 * 1000,
        );

        const { week, day } = this.findWeekAndDay(timetable, examStartDate);
        if (!week || !day) continue;

        if (!Array.isArray(day.lessons)) day.lessons = [];

        this.injectExamIntoDay(
          day,
          exam,
          examStartDate,
          examEndDate,
          examDurationMinutes,
        );
      }
    } catch (e) {
      console.error("❌ Failed to fetch or inject exams:", e);
    }
  }

  async processClubs(api, learnerId, timetable) {
    if (!this.cachedClubs) {
      this.cachedClubs = await api.getClubs(learnerId);
    }

    for (const club of this.cachedClubs) {
      try {
        const clubDetails = await api.getClubDetails(club.id);
        await this.injectClubSessions(timetable, clubDetails);
      } catch (e) {
        console.error("❌ Error fetching club details:", e);
      }
    }
  }

  findWeekAndDay(timetable, date) {
    const dateString = date.toDateString();

    const week = timetable.timetable.weeks.find((w) => {
      const dates = w.days.map((d) => new Date(d.date));
      const min = new Date(Math.min(...dates));
      const max = new Date(Math.max(...dates));
      max.setHours(23, 59, 59, 999);
      return date >= min && date <= max;
    });

    const day = week?.days.find(
      (d) => new Date(d.date).toDateString() === dateString,
    );

    return { week, day };
  }

  injectExamIntoDay(
    day,
    exam,
    examStartDate,
    examEndDate,
    examDurationMinutes,
  ) {
    const examStartTime = examStartDate.toTimeString().slice(0, 5);
    const examEndTime = examEndDate.toTimeString().slice(0, 5);

    day.periods.sort((a, b) => a.start_time.localeCompare(b.start_time));

    const affectedPeriods = day.periods.filter((period) => {
      const periodStart = new Date(`${day.date}T${period.start_time}`);
      const periodEnd = new Date(`${day.date}T${period.end_time}`);
      return !(examEndDate <= periodStart || examStartDate >= periodEnd);
    });

    if (affectedPeriods.length === 0) {
      console.log(`📝 Creating standalone period for exam '${exam.title}'`);
      const examPeriod = this.createPeriod(day, {
        periodType: "EX",
        startTime: examStartTime,
        endTime: examEndTime,
        isEmpty: false,
      });
      this.addExamLesson(day, examPeriod.id, exam, examDurationMinutes);
      return;
    }

    const firstPeriod = affectedPeriods[0];
    const firstPeriodStart = new Date(`${day.date}T${firstPeriod.start_time}`);
    if (examStartDate > firstPeriodStart) {
      const originalEndTime = firstPeriod.end_time;
      firstPeriod.end_time = examStartTime;
      const examStartPeriod = this.createPeriod(day, {
        periodType: "EX",
        startTime: examStartTime,
        endTime: originalEndTime,
        isEmpty: false,
      });
      this.addExamLesson(day, examStartPeriod.id, exam, examDurationMinutes);
    }

    for (let i = 0; i < affectedPeriods.length; i++) {
      const period = affectedPeriods[i];
      if (i > 0 && i < affectedPeriods.length - 1) {
        this.addExamLesson(day, period.id, exam, examDurationMinutes);
      }
    }

    const lastPeriod = affectedPeriods[affectedPeriods.length - 1];
    const lastPeriodEnd = new Date(`${day.date}T${lastPeriod.end_time}`);
    if (examEndDate < lastPeriodEnd) {
      const examEndPeriod = this.createPeriod(day, {
        periodType: "EX",
        startTime: lastPeriod.start_time,
        endTime: examEndTime,
        isEmpty: false,
      });
      this.addExamLesson(day, examEndPeriod.id, exam, examDurationMinutes);
      lastPeriod.start_time = examEndTime;
    }
  }

  addExamLesson(day, periodId, exam, examDurationMinutes) {
    const examAlreadyExists = day.lessons.some(
      (lesson) =>
        lesson.period_id === periodId &&
        (lesson.teaching_group?.id === `exam-${exam.code}` ||
          lesson.teaching_group?.id?.includes(`+exam-${exam.code}`)),
    );

    if (examAlreadyExists) return;

    if (!Array.isArray(day.lessons)) {
      day.lessons = [];
    }

    const examLesson = this.createExamLesson(
      exam,
      periodId,
      examDurationMinutes,
    );
    day.lessons.push(examLesson);
  }

  createExamLesson(exam, periodId, examDurationMinutes) {
    return {
      period_id: periodId,
      room: {
        name: exam.room || "TBA",
        id: `exam-room-${exam.code}`,
        moved: false,
      },
      teaching_group: {
        id: `exam-${exam.code}`,
        name: `Seat: ${exam.seat}`,
        subject: `📝 ${exam.title}`,
      },
      teacher: {
        id: "exam",
        title: "",
        forename: "",
        surname: "Exam",
      },
      teachers: "Exam",
      examDurationMinutes,
    };
  }

  async injectClubSessions(timetable, clubDetails) {
    for (const session of clubDetails.sessions || []) {
      const sessionDate = new Date(session.start_time.replace(" ", "T"));
      const { week, day } = this.findWeekAndDay(timetable, sessionDate);

      if (!week || !day) continue;
      if (!Array.isArray(day.lessons)) day.lessons = [];

      const matchedPeriod = this.findMatchingPeriod(day, sessionDate);
      if (!matchedPeriod) continue;

      const hasExamConflict = this.checkExamConflict(day, matchedPeriod);
      if (hasExamConflict) {
        console.log(
          `⚠️ Skipping club '${clubDetails.name}' due to exam preferred`,
        );
        continue;
      }

      this.addClubLesson(day, matchedPeriod, clubDetails);
    }
  }

  findMatchingPeriod(day, sessionDate) {
    return day.periods.find((period) => {
      const periodStart = new Date(`${day.date}T${period.start_time}`);
      const periodEnd = new Date(`${day.date}T${period.end_time}`);
      return sessionDate >= periodStart && sessionDate < periodEnd;
    });
  }

  checkExamConflict(day, period) {
    return day.lessons.some(
      (l) =>
        l.teaching_group?.id?.startsWith("exam") && l.period_id === period.id,
    );
  }

  addClubLesson(day, period, clubDetails) {
    if (day.lessons.some((l) => l.teaching_group?.id === clubDetails.id))
      return;

    const newLesson = {
      period_id: period.id,
      room: {
        name: clubDetails.location || "Unknown",
        id: `club-room-${clubDetails.id}`,
        moved: false,
      },
      teaching_group: {
        id: clubDetails.id,
        subject: clubDetails.name,
      },
      teacher: {
        id: clubDetails.leaders?.[0]?.id || "club-leader-unknown",
        title: "",
        forename: "",
        surname: clubDetails.leaders_names || "Unknown",
      },
      teachers: clubDetails.leaders_names || "Unknown",
    };

    day.lessons.push(newLesson);
  }
}

(() => {
  let timetableManager = null;
  let currentAuth = null;
  let api = null;
  let lastProcessedTime = 0;

  const processTimetable = async (timetableEl) => {
    const now = Date.now();
    if (now - lastProcessedTime < 2000) return;
    lastProcessedTime = now;

    timetableManager = new TimetableManager(timetableEl);

    if (!currentAuth || !api) {
      currentAuth = await timetableManager.initialize();
      if (!currentAuth) return;
      api = new EduLinkAPI(currentAuth.authToken);
    }

    const timetable = timetableManager.getTimetableData();
    if (!timetable || !Array.isArray(timetable.timetable.weeks)) return;
    timetableManager.createTestPeriod();
    await Promise.all([
      timetableManager.processExams(api, currentAuth.learnerId, timetable),
      timetableManager.processClubs(api, currentAuth.learnerId, timetable),
    ]).catch((e) => console.error("❌ Error processing timetable:", e));
  };

  const waitForTimetable = () => {
    let currentTimetableEl = null;

    const observer = new MutationObserver(async () => {
      const timetableEl = document.querySelector("timetable");

      if (!timetableEl) {
        if (currentTimetableEl) currentTimetableEl = null;
        return;
      }

      if (timetableEl === currentTimetableEl) return;
      const scope = angular.element(timetableEl).scope();
      if (!scope) return;

      const ctrl = angular.element(timetableEl).controller("timetable");
      if (!ctrl || !ctrl._timetableService?.data?.timetables?.[0]) return;
      currentTimetableEl = timetableEl;
      await processTimetable(timetableEl);
    });

    observer.observe(document.body, {
      childList: true,
      subtree: true,
      attributes: false,
      characterData: false,
    });
  };

  waitForTimetable();

  const watchMessages = () => {
    const cleanElement = (el) => {
      if (!el) return;

      if (el.hasAttribute("style")) {
        const styleValue = el.getAttribute("style");
        if (styleValue) {
          el.removeAttribute("style");
        }
      }
      Array.from(el.children || []).forEach(cleanElement);
    };

    const cleanCurrentMessage = () => {
      const editorElements = document.querySelectorAll(
        ".b-show-message__item .editor",
      );
      editorElements.forEach(cleanElement);
    };

    const messageObserver = new MutationObserver((mutations) => {
      for (const mutation of mutations) {
        mutation.addedNodes.forEach((node) => {
          if (!(node instanceof HTMLElement)) return;

          const editors = [
            ...(node.classList?.contains("editor") ? [node] : []),
            ...node.getElementsByClassName("editor"),
          ];

          editors.forEach((editor) => {
            if (editor.closest(".b-show-message__item")) {
              cleanElement(editor);
            }
          });
        });
      }
    });

    messageObserver.observe(document.body, {
      childList: true,
      subtree: true,
      attributes: true,
      attributeFilter: ["style"],
      characterData: false,
    });
    cleanCurrentMessage();
  };
  watchMessages();
})();
