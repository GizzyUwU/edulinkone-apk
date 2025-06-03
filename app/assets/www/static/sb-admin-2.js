var headerNotificationTimeout,
  defaultRecordsPerPage = 50;
function showTrainingModule(e, t, o, a) {
  if (
    (setCurrentTrainingModule(t, o), "student" == e || "teacherwellbeing" == t)
  ) {
    a && (e = "primarystudent");
    var s = lotApp.urls.api + "admin/frontend-redirect.php";
    (s +=
      "?redirect=" +
      encodeURIComponent(
        "progress-dashboard?training=1&viewdemo=" + t + "&demoarea=" + e,
      )),
      a && (s += "&force_interface=primary"),
      (document.location.href = s);
  } else (demoArea = e), showDemoJourney(t);
}
function sendTrainingReminderEmail(e, t) {
  (t && t.hasClass("pending")) ||
    (t && t.addClass("pending"),
    authenticatedAPIRequest(
      "users/trainingreminder",
      function (o) {
        hideMessage(),
          t && t.removeClass("pending"),
          "object" == typeof o &&
          "string" == typeof o.status &&
          "success" == o.status
            ? showNotification(
                "An email was sent to the requested user" +
                  (1 == e.length ? "" : "s") +
                  " to remind them to complete training.",
                "success",
              )
            : showError(
                "An error occurred sending the training reminder, please try again.",
              );
      },
      "post",
      { user_ids: e },
    ));
}
function showNotification(e, t) {
  window.scrollTo(0, 0),
    $("#header-messages")
      .html(`<div class="main-alerts alert alert-${t}">${e}</div>`)
      .slideDown(250),
    hideHeaderNotifications();
}
function hideHeaderNotifications() {
  clearTimeout(headerNotificationTimeout),
    (headerNotificationTimeout = setTimeout(function () {
      var e = $.trim($("#header-messages").html());
      e &&
        $("#header-messages").slideUp(250, function () {
          $(this).empty();
        });
    }, 3e3));
}
function updateNotifications() {
  var e = $("#nav-item-messages");
  1 == e.length &&
    authenticatedAPIRequest(
      "users/notifications",
      function (t) {
        if ("object" == typeof t.breakdown) {
          var o = "",
            a = t,
            s = 0;
          a.total > 0
            ? (e.find(".bell").addClass("has-alerts"),
              a.breakdown.sdq_required &&
                (o +=
                  '<a href="javascript: void 0" onclick="launchSDQSurvey();" class="dropdown-item has-alerts"><img src="/youhq/api/admin/assets/img/nav-icon-sdq.png" alt="Low Moods icon"><span class="text">Launch SDQ</span><span class="dot"></span></a>'),
              a.breakdown.low_mood_alerts &&
                (o += `<a href="${lotApp.urls.api}admin/common/dashboard?view=low_mood" class="dropdown-item has-alerts"><img src="/youhq/api/admin/assets/img/nav-icon-low-moods.png" alt="Low Moods icon"><span class="text">Low Mood Alerts</span><span class="badge badge-pill">${a.breakdown.low_mood_alerts}</span></a>`),
              a.breakdown.support_requests &&
                (o += `<a href="${lotApp.urls.api}admin/common/dashboard?view=support_message" class="dropdown-item has-alerts"><img src="/youhq/api/admin/assets/img/nav-icon-messages.png" alt="Messages icon"><span class="text">Check-in Requests/Messages</span><span class="badge badge-pill">${a.breakdown.support_requests}</span></a>`),
              a.breakdown.pending_goals &&
                ((o += `<a href="${lotApp.urls.api}admin/goald/list" class="dropdown-item has-alerts"><img src="/youhq/api/admin/assets/img/nav-icon-goald.png" alt="GOALd icon"><span class="text">GOALd Alerts</span><span class="badge badge-pill">${a.breakdown.pending_goals}</span></a>`),
                (s = a.breakdown.pending_goals)))
            : (e.find(".bell").removeClass("has-alerts"),
              (o =
                '<a href="javascript:void 0;" class="dropdown-item"><i class="fas fa-check fa-sm fa-fw mr-2"></i>No new notifications</a>')),
            e.find(".dropdown-menu").html(o),
            updateGoaldTabCount(s);
        }
      },
      "get",
      {},
    );
}
function launchSDQSurvey(e, t, o) {
  var a = `${LOT_API_URL}admin/sdq-survey.php`;
  "undefined" != typeof e && (a += `?user_id=${e}&checksum=${o}&name=${t}`),
    window.open(
      a,
      "sdqSurveyWin",
      `width=${window.innerWidth},height=${window.innerHeight}`,
    );
}
function updateGoaldTabCount(e) {
  $("#pnProductNav .goald-count").html(e || "");
}
function giveFeedbackToggle() {
  $("#feedback-toggle, #feedback").toggleClass("active");
}
function updateRating(e) {
  var t = $(e).data("rating");
  $("#feedback-rating .stars .fa-star").removeClass("active");
  for (var o = 0; o < t; o++)
    $("#feedback-rating .stars .fa-star").eq(o).addClass("active");
  $("#rating-score").val(t);
}
function submitRating() {
  var e = parseInt($("#rating-score").val());
  if (0 === e)
    showMessage(
      "Error",
      "Please provide your rating by clicking on relevant the star.",
    );
  else {
    var t = $(".submit-rating");
    t.prop("disabled", !0), giveFeedbackToggle();
    var o = $("#feedback-rating form");
    authenticatedAPIRequest(
      "feedback/rating",
      function (e) {
        "success" == e.status
          ? ($(".feedback-form")[0].reset(),
            $("#feedback-rating .stars .fa-star").removeClass("active"),
            showMessage(
              "Success",
              "Thanks for your feedback and helping us grow and improve youHQ.",
            ))
          : (showMessage(
              "Error",
              "An error occurred sending your message, please try again.",
            ),
            t.prop("disabled", !1));
      },
      "post",
      $.deparam(o.serialize()),
    );
  }
}
function toggleSidebar(e) {
  var t = $("#app-sidebar");
  t.hasClass("hide-sidebar") ? showSidebar() : hideSidebar();
}
function showSidebar() {
  var e = $("#app-sidebar");
  e.removeClass("hide-sidebar"), listenForMenuClose();
}
function hideSidebar() {
  var e = $("#app-sidebar");
  e.addClass("hide-sidebar"), stopListeningForMenuClose();
}
function listenForMenuClose() {
  $("body").on("click.menuclose", function (e) {
    0 == $(e.target).closest("#app-sidebar").length &&
      0 == $(e.target).closest("#sidebarToggleTop").length &&
      toggleSidebar();
  });
}
function stopListeningForMenuClose() {
  $("body").off("click.menuclose");
}
function resizeApp() {
  $("#app-sidebar").toggleClass("hide-sidebar", $(window).width() < 992);
}
function niceDate(e, t) {
  if (!e) return "";
  var o = e.indexOf(" ") > -1 ? e.split(" ") : e.split("T"),
    a = o[0].split("-"),
    s = a[2] + "/" + a[1] + "/" + a[0];
  return (
    "undefined" != typeof t && !0 === t && (s += " " + o[1].substr(0, 5)), s
  );
}
function initTooltips(e) {
  try {
    $('[data-toggle="popover"]', e)
      .popover({ boundary: "viewport", trigger: "hover focus", delay: 500 })
      .on("inserted.bs.popover", function () {
        var e = $(this);
        e.data("popover-class") &&
          $(".popover").addClass(e.data("popover-class"));
      });
  } catch (t) {}
}
function confirmDeleteRecord(e, t) {
  if (confirm("Are you sure you wish to delete this " + t + "?")) {
    var o = $("#delete-record-form");
    o.attr("action", e).submit();
  }
}
function toggleCookie(e, t, o) {
  if (t) {
    var a = {};
    "number" == typeof o && o > 0 && (a.expires = o), Cookies.set(e, 1, a);
  } else Cookies.remove(e);
}
function showExplainerVideo() {
  showVideo(
    "explainer.mp4",
    "How it works...",
    "",
    '<label><input type="checkbox" onchange="toggleCookie(\'hideexplainervideo\',this.checked,3650);"> <strong>Do not show this video again</strong></label>',
  );
}
function hideVideoModal() {
  var e = $("#videoModal");
  $(".modal-body", e).html("");
}
function showYoutubeVideo(e, t, o) {
  var a =
    '<iframe width="560" height="315" src="https://www.youtube.com/embed/' +
    e +
    '" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>';
  _doShowVideo(a, t, o);
}
function showVideo(e, t, o, a) {
  var s =
    '<video controls autoplay><source src="' +
    LOT_YOUHQ_URL +
    "api/admin/assets/video/" +
    e +
    '" type="video/mp4">Your browser does not support videos</video>';
  _doShowVideo(s, t, o, a);
}
function _doShowVideo(e, t, o, a) {
  var s = "";
  "string" == typeof a && a && (s = a),
    (s += '<div class="video-container">' + e + "</div>");
  var i = $("#videoModal");
  $(".modal-title", i).html(t),
    $(".modal-body", i).html(s),
    $(".modal-footer .extra", i).html("string" == typeof o ? o : ""),
    i.modal("show");
}
function showModal(e) {
  $(e).modal("show");
}
function hideModal(e) {
  $(e).modal("hide");
}
function showHelp() {
  var e = function (e) {
    var t = e.data.categories,
      o = '<div id="help-article-accordion">';
    t.forEach(function (e, t) {
      "object" == typeof e.articles &&
        ((o += "<h3>" + e.title + "</h3>"),
        e.articles.forEach(function (e, a) {
          o +=
            '\t\t\t\t\t<div class="card">\t\t\t\t\t\t<div class="card-header" id="help-article-title-' +
            t +
            "-" +
            a +
            '" data-toggle="collapse" data-target="#help-article-content-' +
            t +
            "-" +
            a +
            '" aria-expanded="false" aria-controls="help-article-content-' +
            t +
            "-" +
            a +
            '">\t\t\t\t\t\t\t' +
            e.title +
            '\t\t\t\t\t\t</div>\t\t\t\t\t\t<div class="collapse" aria-labelledby="help-article-title-' +
            t +
            "-" +
            a +
            '" data-parent="#help-article-accordion" id="help-article-content-' +
            t +
            "-" +
            a +
            '">\t\t\t\t\t\t\t<div class="card-body">\t\t\t\t\t\t\t\t' +
            (e.is_youtube
              ? '<div class="video-container"><iframe src="https://www.youtube.com/embed/' +
                e.content +
                '" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>'
              : e.content) +
            "\t\t\t\t\t\t\t</div>\t\t\t\t\t\t</div>\t\t\t\t\t</div>";
        }));
    }),
      (o += "</div>");
    var a = $("#helpModal");
    $(".modal-body", a).html(o), a.modal("show");
  };
  apiRequest("help/admin", "get", e);
}
function apiRequest(e, t, o) {
  $.ajax({
    url: LOT_API_URL + "" + e,
    method: t,
    complete: function (e, t) {
      "success" == t
        ? "function" == typeof o && o(e.responseJSON)
        : alert("Error loading data, please try again.");
    },
    dataType: "json",
  });
}
function localAjaxRequest(e, t, o, a) {
  if ("object" != typeof a) a = {};
  (a.action = e),
    $.ajax({
      url: LOT_API_URL + "admin/service.php",
      method: t,
      complete: function (e, t) {
        "success" == t
          ? "function" == typeof o && o(e.responseJSON)
          : alert("Error loading data, please try again.");
      },
      data: a,
      dataType: "json",
    });
}
function showMessage(e, t, o) {
  var a = $("#genericMessageModal");
  $(".modal-title", a).html(e),
    $(".modal-body", a).html(t),
    $(".modal-footer", a).toggle("undefined" == typeof o || !o),
    $(".close", a).toggle("undefined" == typeof o || !o),
    a.modal("show"),
    (a[0].style.zIndex = 1e5),
    (a.data("bs.modal")._backdrop.style.zIndex = 99999);
}
function hideMessage() {
  var e = $("#genericMessageModal");
  e.on("shown.bs.modal", function () {
    e.modal("hide"), e.off("shown.bs.modal");
  }),
    e.modal("hide");
}
function showError(e) {
  showMessage("Error", e, !1);
}
function showReportConcernModal(e, t, o, a, s) {
  var i = $("#reportConcernModal");
  $(".success-message", i).empty().hide(),
    $(".form-container", i).show(),
    $("form", i)[0].reset(),
    $("#concern-submit-btn", i).prop("disabled", !1);
  var n = { name: e, class: t, id: o, upn: a, mis_id: s };
  concernObject.init(n), i.modal("show");
}
function hideReportConcernModal() {
  var e = $("#reportConcernModal");
  e.modal("hide");
}
function showUserGroupsModal() {
  var e = $("#user-group-users-container");
  e.empty(),
    $("#dataTable input[type=checkbox].user-id:checked").each(function () {
      e.append(
        '<input type="hidden" name="user_ids[]" value="' + $(this).val() + '">',
      );
    });
  var t = $("#userGroupsModal");
  t.modal("show");
}
function showUserGroupsRemoveModal() {
  var e = $("#user-group-remove-users-container");
  e.empty(),
    $("#dataTable input[type=checkbox].user-id:checked").each(function () {
      e.append(
        '<input type="hidden" name="user_ids[]" value="' + $(this).val() + '">',
      );
    });
  var t = $("#userGroupsRemoveModal");
  t.modal("show");
}
function getMoodIcon(e) {
  return '<span class="mood-icon mood-' + e + '"></span>';
}
function getMoodImg(e) {
  return (
    '<img src="' +
    getMoodImgSrc(e) +
    '" class="admin-student-mood" alt="' +
    e +
    '">'
  );
}
function getMoodImgSrc(e) {
  var t = "";
  if (null === e) t = "unknown.png";
  else {
    var o = Math.round(e);
    switch (o) {
      case 0:
        t = "unspecified.png";
        break;
      case 1:
        t = "1.png";
        break;
      case 2:
        t = "2.png";
        break;
      case 3:
        t = "3.png";
        break;
      case 4:
        t = "4.png";
        break;
      case 5:
        t = "5.png";
        break;
      default:
        t = "unknown.png";
        break;
    }
  }
  return "/youhq/shared/images/mood_emojis/" + t + "?v=2";
}
function toggleSettingsNav() {
  $("#nav-settings").slideToggle(250),
    $("#nav-settings-link").toggleClass("expanded");
}
function removeNotification(e) {
  $(e).each(function (e, t) {
    var o = $(t),
      a = parseInt(o.text(), 10) - 1;
    o.text(a);
  });
}
function hideAllTooltips() {
  $("body > .popover").remove();
}
function openInNewWindow(e, t) {
  var o = $("#iFrameModal");
  $("iframe", o).prop("src", "/youhq/api/admin/loading.php"),
    t && o.addClass(t),
    setTimeout(function () {
      $("iframe", o).prop("src", e), hideAllTooltips();
    }, 500),
    o.modal("show");
}
function hideiFrameModal() {
  var e = $("#iFrameModal");
  e.modal("hide"),
    e.attr("class", "modal fade"),
    $("iframe", e).prop("src", "about:blank");
}
function addCacheDateToTable(e, t, o, a) {
  if ("undefined" == typeof a) a = {};
  (a.dom =
    '<"row datatables-header-row"<"col-sm-12 col-md-4"l><"col-sm-12 col-md-4 cache-date"><"col-sm-12 col-md-4"f>>rt<"row"<"col-sm-12 col-md-5"i><"col-sm-12 col-md-7"p>>'),
    e.DataTable(a),
    updateCacheDate(e, t, o);
}
function updateCacheDate(e, t, o) {
  var a = "";
  t &&
    "object" == typeof t &&
    "undefined" != typeof t["cacheDateTime"] &&
    ("string" == typeof t["cacheDateTime"] && t["cacheDateTime"]
      ? ((a = niceDate(t["cacheDateTime"].replace("T", " "), !0)),
        (a += ' <a href="javascript:' + o + '();">[update]</a>'))
      : (a = "Just now")),
    $(".cache-date", e.closest(".dataTables_wrapper")).html(
      a ? "Last updated: " + a : "",
    );
}
function resetDataTable(e) {
  e.hide();
  var t = e.DataTable();
  t.destroy(),
    $("th.dynamic-header", e).remove(),
    $("th", e).css("width", ""),
    $("tbody td:not(.permanent)", e).remove();
}
function wysiwygify(e, t) {
  var o = e.data("placeholder") || "",
    a = { placeholder: o, tabsize: 2, height: 200, toolbar: !1 };
  "none" != e.data("controls") &&
    ((a.toolbar = [
      ["style", ["style"]],
      ["font", ["bold", "underline", "clear"]],
      ["fontname", ["fontname"]],
      ["color", ["color"]],
      ["para", ["ul", "ol", "paragraph"]],
    ]),
    "minimal" != e.data("controls") &&
      (a.toolbar.push(["table", ["table"]]),
      a.toolbar.push(["insert", ["link", "picture", "video"]]),
      a.toolbar.push(["view", ["fullscreen", "codeview", "help"]]))),
    "object" == typeof t && (a = Object.assign(a, t)),
    e.summernote("destroy"),
    e.summernote(a);
}
(function ($) {
  "use strict";
  $(function () {
    if (
      (initTooltips("body"),
      $("#timezones").length && $("#timezones").select2(),
      $(".sticky-filter").length)
    ) {
      var e = ["class-options", "year-group-options", "focus-group-options"];
      if (
        "undefined" != typeof Cookies.get("filter") &&
        "" != Cookies.get("filter")
      ) {
        var t = Cookies.get("filter").split(",");
        $("#dashboard-stats-segment option").each(function () {
          -1 !== $.inArray($(this).val(), t) &&
            d("filter", $(this).val(), $(this).text());
        }),
          $(".filter-lock.yes").addClass("active"),
          $(".filter-lock.no").removeClass("active"),
          n();
      }
      if (
        "undefined" != typeof Cookies.get("period") &&
        "" != Cookies.get("period")
      ) {
        var o = Cookies.get("period");
        $("#dashboard-stats-period").val(o),
          $("#dashboard-stats-period option").each(function () {
            $(this).val() === o && d("period", $(this).val(), $(this).text());
          });
      }
      if (
        "undefined" != typeof Cookies.get("term") &&
        "" != Cookies.get("term")
      ) {
        var a = Cookies.get("term");
        $("#dashboard-stats-term-id").val(a),
          $("#dashboard-stats-term-id option").each(function () {
            $(this).val() === a && d("term", $(this).val(), $(this).text());
          });
      }
      function n() {
        var t =
          "undefined" != typeof Cookies.get("optGroup") &&
          "" != Cookies.get("optGroup")
            ? Cookies.get("optGroup")
            : "";
        if ($(".filter-pill.filter").length) {
          var o = $(".filter-pill.filter").data("filterval");
          "school" !== o
            ? $.each(e, function (e, o) {
                o !== t && $("." + o + " option").attr("disabled", !0);
              })
            : $.each(e, function (e, t) {
                $("." + t + " option").attr("disabled", !1);
              });
        } else
          $.each(e, function (e, t) {
            $("." + t + " option").attr("disabled", !1);
          });
      }
      function r(e) {
        e.closest(".filter-pill").remove(), n(), c();
      }
      function d(e, t, o) {
        var a =
          '<div class="filter-pill ' +
          e +
          " " +
          t +
          ' " data-filterval="' +
          t +
          '">';
        (a += '<span class="removeFilter">x</span>'),
          (a += o),
          (a += "</div>"),
          "period" === e &&
            ($(".filter-pill.period").remove(),
            $(".filter-pill.term").remove()),
          "term" === e && $(".filter-pill.term").remove(),
          "filter" === e && "school" == t
            ? $(".filter-pill.filter").remove()
            : ("filter" === e) & ("school" !== t) &&
              $(".filter-pill.filter.school").remove(),
          "" !== t &&
            0 === $(".filter-pill." + t).length &&
            $(".filter-" + e).append(a),
          $(".removeFilter")
            .unbind("click")
            .click(function () {
              r($(this));
            });
      }
      function l() {
        Cookies.remove("filter"),
          Cookies.set("filter", getFilter(), 3650),
          Cookies.remove("period"),
          Cookies.set("period", getPeriod(), 3650),
          Cookies.remove("term"),
          Cookies.set("term", getTerm(), 3650);
      }
      function c() {
        $(".filter-lock.yes").hasClass("active") && l(),
          updateDashboardStats(),
          "function" == typeof updateMoodGraph && updateMoodGraph(),
          "function" == typeof updateEmotionGraph && updateEmotionGraph(),
          updateWellbeingGraph(),
          updateMoodFactors(),
          changeEngagementPeriod($("#dashboard-stats-term-id").val()),
          $("#dashboard-stats-segment").val("");
      }
      $(".filter-lock").click(function () {
        var e = $(this).hasClass("yes") ? 1 : 0;
        $(".filter-lock").removeClass("active"),
          $(this).addClass("active"),
          e
            ? ($(".padlock .closed").addClass("active"),
              $(".padlock .open").removeClass("active"),
              l())
            : ($(".padlock .open").addClass("active"),
              $(".padlock .closed").removeClass("active"),
              Cookies.remove("filter"));
      }),
        $("#dashboard-stats-segment").change(function () {
          var e = $("#dashboard-stats-segment").val(),
            t = $("#dashboard-stats-segment option:selected").text(),
            o = $(":selected", this),
            a = o.closest("optgroup").attr("class");
          Cookies.set("optGroup", a, 3650), d("filter", e, t), n(), c();
        }),
        $("#dashboard-stats-period").change(function () {
          var e = $("#dashboard-stats-period").val(),
            t = $("#dashboard-stats-period option:selected").text();
          d("period", e, t), c();
        }),
        $("#dashboard-stats-term-id").change(function () {
          var e = $("#dashboard-stats-term-id").val(),
            t = $("#dashboard-stats-term-id option:selected").text();
          d("term", e, t), c();
        }),
        $(".removeFilter").click(function () {
          r($(this));
        }),
        c();
    }
    $(window).on("resize", function () {
      resizeApp();
    }),
      $("#sidebarToggleTop").on("click", toggleSidebar),
      $("#app-sidebar li.has-sub").on("click", function (e) {
        e.stopPropagation();
        var t = $(e.target).closest("li");
        if (!t.hasClass("has-sub")) return !0;
        var o = $(this),
          a = $("> ul", o),
          s = o.hasClass("open");
        s
          ? (o.removeClass("open"), a.slideUp(200))
          : (o.addClass("open"), a.slideDown(200));
      }),
      hideHeaderNotifications();
    try {
      $("#dataTable:not(.custom-data-table)").DataTable({
        pageLength: defaultRecordsPerPage,
      });
    } catch (i) {}
    if (
      ($("#dataTable th :input").on("click", function (e) {
        e.stopPropagation();
      }),
      $("textarea.wysiwyg").each(function () {
        var e = $(this);
        wysiwygify(e);
      }),
      $(".checkbox-container .toggle").on("click", function (e) {
        var t = $(this).closest(".checkbox-container");
        t.toggleClass("expanded"),
          !t.hasClass("expanded") &&
            t.data("closecallback") &&
            window[t.data("closecallback")](),
          e.stopPropagation();
      }),
      $(".checkbox-container").on("click", function () {
        $(this).hasClass("expanded") || $(this).addClass("expanded");
      }),
      onDocumentReadyCallbacks.length > 0)
    )
      for (var s in onDocumentReadyCallbacks) onDocumentReadyCallbacks[s]();
    $("#feedback-rating").length &&
      ($("#feedback-toggle").click(function () {
        giveFeedbackToggle();
      }),
      $("#feedback-rating .fa-star").click(function () {
        updateRating(this);
      }),
      $(".submit-rating").click(function (e) {
        e.preventDefault(), submitRating();
      })),
      $(".toggle-section .toggle-trigger").on("click", function () {
        $(this).closest(".toggle-section").toggleClass("contracted");
      });
  }),
    $(document).on("scroll", function () {
      var e = $(this).scrollTop();
      e > 100 ? $(".scroll-to-top").fadeIn() : $(".scroll-to-top").fadeOut();
    }),
    $(document).on("click", "a.scroll-to-top", function (e) {
      var t = $(this);
      $("html, body")
        .stop()
        .animate(
          { scrollTop: $(t.attr("href")).offset().top },
          1e3,
          "easeInOutExpo",
        ),
        e.preventDefault();
    }),
    updateNotifications();
})(jQuery);
var _youhqAjaxRequests = [];
function addAjaxRequest(e) {
  _youhqAjaxRequests.push({ code: e, complete: !1 });
}
function setAjaxRequestComplete(e) {
  for (var t in _youhqAjaxRequests)
    if (
      _youhqAjaxRequests[t].code == e &&
      !1 === _youhqAjaxRequests[t].complete
    ) {
      _youhqAjaxRequests[t].complete = !0;
      break;
    }
  checkAllAjaxRequestComplete() &&
    "function" == typeof onAjaxRequestsComplete &&
    onAjaxRequestsComplete();
}
function checkAllAjaxRequestComplete() {
  var e = !0;
  for (var t in _youhqAjaxRequests) _youhqAjaxRequests[t].complete || (e = !1);
  return e;
}
function logQuickCheckIn(e, t, o) {
  authenticatedAPIRequest(
    "users/quickcheckin/",
    function (e) {
      "object" == typeof e &&
      "string" == typeof e.status &&
      "success" == e.status
        ? (updateNotifications(), "function" == typeof t && t(e))
        : (showError(
            "Sorry, an error occurred when saving this check-in. Please try again.",
          ),
          "function" == typeof o && o(e));
    },
    "put",
    { student_user_id: e },
  );
}
function undoQuickCheckIn(e, t, o, a, s) {
  authenticatedAPIRequest(
    "users/undoquickcheckin/",
    function (e) {
      "object" == typeof e &&
      "string" == typeof e.status &&
      "success" == e.status
        ? (updateNotifications(), "function" == typeof a && a(e))
        : (showError(
            "Sorry, an error occurred when saving this check-in. Please try again.",
          ),
          "function" == typeof s && s(e));
    },
    "put",
    { student_user_id: e, check_in_ids: t, conversation_log_ids: o },
  );
}
(function ($) {
  $.deparam = function (e, t) {
    var o = {},
      a = { true: !0, false: !1, null: null };
    return (
      $.each(e.replace(/\+/g, " ").split("&"), function (e, s) {
        var i,
          n = s.split("="),
          r = decodeURIComponent(n[0]),
          d = o,
          l = 0,
          c = r.split("]["),
          p = c.length - 1;
        if (
          (/\[/.test(c[0]) && /\]$/.test(c[p])
            ? ((c[p] = c[p].replace(/\]$/, "")),
              (c = c.shift().split("[").concat(c)),
              (p = c.length - 1))
            : (p = 0),
          2 === n.length)
        )
          if (
            ((i = decodeURIComponent(n[1])),
            t &&
              (i =
                i && !isNaN(i)
                  ? +i
                  : "undefined" === i
                    ? void 0
                    : void 0 !== a[i]
                      ? a[i]
                      : i),
            p)
          )
            for (; l <= p; l++)
              (r = "" === c[l] ? d.length : c[l]),
                (d = d[r] =
                  l < p ? d[r] || (c[l + 1] && isNaN(c[l + 1]) ? {} : []) : i);
          else
            $.isArray(o[r])
              ? o[r].push(i)
              : void 0 !== o[r]
                ? (o[r] = [o[r], i])
                : (o[r] = i);
        else r && (o[r] = t ? void 0 : "");
      }),
      o
    );
  };
})(jQuery);
