const WHO5_SURVEY_ID = 30;
var onYouTubeIframeAPIReady = function () {},
  lotApp = {
    urls: {
      api: LOT_SITE_URL + "api/",
      app: LOT_SITE_URL + "app/",
      shared: LOT_YOUHQ_URL + "shared/",
      fileUpload: LOT_YOUHQ_URL + "app/uploads/",
      site: "/",
      googleCalendar: LOT_YOUHQ_URL + "app/sync/",
      articleImages: LOT_YOUHQ_URL + "api/admin/assets/img/articles/",
      articleAudio: LOT_YOUHQ_URL + "api/admin/assets/audio/articles/",
      articlePDFs: LOT_YOUHQ_URL + "api/admin/assets/pdf/articles/",
      emotionIcons: LOT_YOUHQ_URL + "shared/images/emotions/",
      courseImages: LOT_YOUHQ_URL + "api/admin/assets/img/courses/",
    },
    goals: [],
    ideas: [],
    views: [],
    templates: [],
    goalCategories: [],
    lifeValues: [],
    moods: [],
    currentCategory: "",
    explainVideoEnabled: !0,
    goalsEnabled: !0,
    ideasEnabled: !0,
    journalEnabled: !0,
    lifeValuesEnabled: !1,
    goalGenieEnabled: !1,
    defaultValues: [
      "Resilience",
      "Respect",
      "Compassion",
      "Courage",
      "Creativity",
      "Endurance",
      "Faith",
      "Family",
      "Forgiveness",
      "Friendship",
      "Fun",
      "Gratitude",
      "Health",
      "Honesty",
      "Kindness",
      "Persistence",
      "Responsibility",
      "Safety",
      "Success",
      "Wealth",
      "Wisdom",
    ],
    goalsCount: 0,
    firstURL: "",
    currentArticleId: null,
    goaldEnabled: !0,
    moodSubmitted: !1,
    articleRatingEnabled: !0,
    showGenieOnLoad: !1,
    youtubeArticlePlayers: [],
    goald: 0,
    inventory: { avatar: {} },
    interface: "secondary",
    supportActive: !1,
    pointsForCorrectCourseQuestion: 0,
  };
function isTestSchool() {
  return document.location.href.indexOf("/schools/newlot/") > -1;
}
function authenticatedAPIRequest(e, t, n, o) {
  if ("undefined" == typeof o) o = {};
  $.post(
    LOT_API_URL + "admin/service.php",
    {
      action: "apirequest",
      url: e,
      method: "string" == typeof n ? n : "get",
      data: o,
    },
    t,
    "json"
  );
}
function youHQReport() {
  var e = LOT_YOUHQ_URL + "app/youhq-report.php";
  (e +=
    "?url=" +
    lotApp.urls.api +
    "reports/youhq-student&token=" +
    btoa("tore" + (Cookies.get("lottoken") || Cookies.get("token")) + "cja")),
    openWindow(
      e,
      "youHQReportWin",
      "width=1024,height=800,location=no,toolbars=no"
    );
}
function openWindow(e, t, n) {
  if (
    "undefined" != typeof webkit &&
    "undefined" != typeof webkit.messageHandlers &&
    "undefined" != typeof webkit.messageHandlers.cordova_iab
  ) {
    var o = { url: e, target: t, options: n },
      i = JSON.stringify(o);
    webkit.messageHandlers.cordova_iab.postMessage(i);
  } else window.open(e, t, n);
}
function loadYoutubeJsAPI() {
  if (0 == $("#youtube-iframe-api-js").length) {
    var e = document.createElement("script");
    (e.id = "youtube-iframe-api-js"),
      (e.src = "https://www.youtube.com/iframe_api");
    var t = document.getElementsByTagName("script")[0];
    t.parentNode.insertBefore(e, t);
  } else onYouTubeIframeAPIReady();
}
function addItemToInventory(e, t, n) {
  "undefined" == typeof lotApp.inventory[e] && (lotApp.inventory[e] = {}),
    "undefined" == typeof lotApp.inventory[e][t] &&
      (lotApp.inventory[e][t] = []),
    -1 === lotApp.inventory[e][t].indexOf(n) && lotApp.inventory[e][t].push(n);
}
function copyTextToClipboard(e, t, n) {
  var o = function () {
      "function" == typeof n && n(t);
    },
    i = function () {
      alert("Sorry, we were unable to copy the requested text");
    };
  if (navigator.clipboard)
    navigator.clipboard.writeText(e).then(
      function () {
        o();
      },
      function (e) {
        i();
      }
    );
  else {
    var r = document.createElement("textarea");
    (r.value = e),
      (r.style.position = "fixed"),
      (r.style.top = "100%"),
      (r.style.left = "0"),
      document.body.appendChild(r),
      r.focus(),
      r.select();
    try {
      document.execCommand("copy"), o();
    } catch (a) {
      i();
    }
    document.body.removeChild(r);
  }
}
function showTrainingEndScreen() {
  var e = "#training-module-complete-modal";
  $("#training-module-complete-modal-name").html(
    getCurrentTrainingModuleName()
  ),
    $(".btn-yes", e).one("click", function () {
      $(".buttons button", e).prop("disabled", !0), onTrainingComplete();
    }),
    $(".btn-no", e).one("click", function () {
      introJs().exit(),
        hideModal(e),
        setTimeout(function () {
          showDemoJourney(getCurrentTrainingModuleCode());
        }, 1e3);
    }),
    showModal(e);
}
function onTrainingComplete() {
  trackTrainingProgress(100, function () {
    document.location.href = LOT_API_URL + "admin/training/home";
  });
}
function trackTrainingProgress(e, t) {
  "function" != typeof t && (t = function () {}),
    authenticatedAPIRequest("training/progress", t, "post", {
      code: getCurrentTrainingModuleCode(),
      percent: e,
    });
}
function setCurrentTrainingModule(e, t) {
  localStorage.setItem("training_module_code", e),
    localStorage.setItem("training_module_name", t);
}
function getCurrentTrainingModuleCode() {
  return localStorage.getItem("training_module_code");
}
function getCurrentTrainingModuleName() {
  return localStorage.getItem("training_module_name");
}
!(function (e, t) {
  "object" == typeof exports && "undefined" != typeof module
    ? (module.exports = t())
    : "function" == typeof define && define.amd
    ? define(t)
    : ((e = "undefined" != typeof globalThis ? globalThis : e || self),
      (function () {
        var n = e.Cookies,
          o = (e.Cookies = t());
        o.noConflict = function () {
          return (e.Cookies = n), o;
        };
      })());
})(this, function () {
  "use strict";
  function e(e) {
    for (var t = 1; t < arguments.length; t++) {
      var n = arguments[t];
      for (var o in n) e[o] = n[o];
    }
    return e;
  }
  var t = (function t(n, o) {
    function i(t, i, r) {
      if ("undefined" != typeof document) {
        "number" == typeof (r = e({}, o, r)).expires &&
          (r.expires = new Date(Date.now() + 864e5 * r.expires)),
          r.expires && (r.expires = r.expires.toUTCString()),
          (t = encodeURIComponent(t)
            .replace(/%(2[346B]|5E|60|7C)/g, decodeURIComponent)
            .replace(/[()]/g, escape));
        var a = "";
        for (var s in r)
          r[s] &&
            ((a += "; " + s), !0 !== r[s] && (a += "=" + r[s].split(";")[0]));
        return (document.cookie = t + "=" + n.write(i, t) + a);
      }
    }
    return Object.create(
      {
        set: i,
        get: function (e) {
          if ("undefined" != typeof document && (!arguments.length || e)) {
            for (
              var t = document.cookie ? document.cookie.split("; ") : [],
                o = {},
                i = 0;
              i < t.length;
              i++
            ) {
              var r = t[i].split("="),
                a = r.slice(1).join("=");
              try {
                var s = decodeURIComponent(r[0]);
                if (((o[s] = n.read(a, s)), e === s)) break;
              } catch (e) {}
            }
            return e ? o[e] : o;
          }
        },
        remove: function (t, n) {
          i(t, "", e({}, n, { expires: -1 }));
        },
        withAttributes: function (n) {
          return t(this.converter, e({}, this.attributes, n));
        },
        withConverter: function (n) {
          return t(e({}, this.converter, n), this.attributes);
        },
      },
      {
        attributes: { value: Object.freeze(o) },
        converter: { value: Object.freeze(n) },
      }
    );
  })(
    {
      read: function (e) {
        return (
          '"' === e[0] && (e = e.slice(1, -1)),
          e.replace(/(%[\dA-F]{2})+/gi, decodeURIComponent)
        );
      },
      write: function (e) {
        return encodeURIComponent(e).replace(
          /%(2[346BF]|3[AC-F]|40|5[BDE]|60|7[BCD])/g,
          decodeURIComponent
        );
      },
    },
    { path: "/" }
  );
  return t;
});
