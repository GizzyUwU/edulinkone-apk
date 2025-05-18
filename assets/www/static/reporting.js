function getDashboardAPIParameters() {
  var e = getDashboardPeriod(),
    t = getFilter(),
    a = { period: e };
  return (
    t && (a.segment = t),
    "selected_term" == e && (a.term_id = $("#dashboard-stats-term-id").val()),
    a
  );
}
function getDashboardPeriod() {
  return $("#dashboard-stats-period").val();
}
function initDashboardFlatpickr(e, t) {
  return flatpickr(e, {
    plugins: [new weekSelect({})],
    weekNumbers: !0,
    onChange(e, a, r) {
      (r.input.value = [r.weekStartDay, r.weekEndDay]
        .map((e) => r.formatDate(e, "d/m/Y"))
        .join(" - ")),
        t(e, a, r);
    },
  });
}
function changeAdminReportPeriod(e, t, a, r) {
  if (("undefined" == typeof r && (r = !0), $(".sticky-filter").length))
    var s = $("#dashboard-stats-date-filters");
  else s = $("#" + t + "-date-filters");
  "selected_term" !== e && isNaN(e) && $(".period-filter", s).hide(),
    "selected_term" == e
      ? $(".terms", s).show()
      : "date_range" == e
        ? ($(".date-range", s).show(), r && $(".date-range input", s).focus())
        : "school_year" == e
          ? ($(".years", s).show(), a())
          : ("selected_term" !== e &&
              isNaN(e) &&
              $(".terms, .date-range", s).hide(),
            "week" == e
              ? ($(".week", s).show(), r && $(".week input", s).focus())
              : a());
}
function updateSDQPolarChart(e, t) {
  var a = "sdq-chart";
  let r = Chart.getChart(a);
  void 0 != r && r.destroy();
  var s = document.getElementById(a);
  new Chart(s, {
    type: "polarArea",
    maxWidth: 400,
    data: {
      labels: e,
      datasets: [
        {
          label: "Score",
          data: t,
          borderWidth: 1,
          backgroundColor: [
            "#ffbf71cc",
            "#72ca86cc",
            "#6597decc",
            "#666d88cc",
            "#ffe87dcc",
          ],
        },
      ],
    },
    options: {
      responsive: !0,
      maintainAspectRatio: !1,
      scales: {
        x: { display: !1 },
        y: { display: !1, beginAtZero: !0 },
        r: {
          max: 100,
          border: { dash: [12, 10] },
          grid: { color: "#bbb", lineWidth: 1 },
          ticks: {
            z: 10,
            backdropColor: "transparent",
            color: "#666",
            font: { size: 16, weight: "bold" },
          },
        },
      },
      plugins: { legend: { display: !1 } },
    },
  });
}
function showVIAStrengthDescription(e) {
  var t = $("#via-strength-desc-panel"),
    a = e.position(),
    r = t.width(),
    s = a.left,
    d = $("body").width();
  e.offset().left + r > d - 50 && (s -= 50),
    $(".content", t).html(e.html()),
    t.css({ top: a.top, left: s }).addClass("displayed");
}
function hideVIAStrengthDescription() {
  $("#via-strength-desc-panel").removeClass("displayed");
}
addDocumentReadyCallback(function () {
  $("#via-survey").on("click", ".strength", function () {
    showVIAStrengthDescription($(this));
  });
});
