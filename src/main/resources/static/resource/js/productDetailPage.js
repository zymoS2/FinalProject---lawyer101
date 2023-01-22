// $(function () {
//   var location = document.querySelector(".pydiv-1").offsetTop;
//   $("#headerli1").click(function () {
//     window.scrollTo({ top: location, behavior: "smooth" });
//   });
// });
$(function () {
  var location = document.querySelector(".pydiv-2").offsetTop;
  $(".headerli2").click(function () {
    window.scrollTo({ top: location, behavior: "smooth" });
  });
});
$(function () {
  var location = document.querySelector(".pydiv-3").offsetTop;
  $(".headerli3").click(function () {
    window.scrollTo({ top: location, behavior: "smooth" });
  });
});
$(function () {
  var location = document.querySelector(".pydiv-4").offsetTop;
  $(".headerli4").click(function () {
    window.scrollTo({ top: location, behavior: "smooth" });
  });
});
$(function () {
  var location = document.querySelector(".pydiv-5").offsetTop;
  $(".headerli5").click(function () {
    window.scrollTo({ top: location, behavior: "smooth" });
  });
});

$(function () {
  $(".carousel-item").first().addClass("active");

  $(".headerButton").click(function () {
    $(".sidebar-container").css("transform", "translateX(0)");
    $(".sidebar").css({ "z-index": 200});
    $(".sidebarOpacity").css({ opacity: 0.25 });
  });

  $(".sidebarButton").click(function () {
    $(".sidebar-container").css("transform", "translateX(-320px)");
    $(".sidebar").css({ "z-index": -1 });
    $(".sidebarOpacity").css({ opacity: 0 });
  });

  $(".sidebarOpacity").click(function (e) {
    if (!$(e.target).hasClass("sidebar")) {
      $(".sidebar-container").css("transform", "translateX(-320px)");
      $(".sidebar").css({ "z-index": -1 });
      $(".sidebarOpacity").css({ opacity: 0 });
    }
  });
});
