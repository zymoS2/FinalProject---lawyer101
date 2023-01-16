$(document).ready(function () {
  var carouselTop = $("#carouselExampleCaptions").get(0).getBoundingClientRect().top;
  $(window).scroll(function () {
    var st = $(this).scrollTop();

    if (st > carouselTop) {
      $("header").addClass("active");
      $("#carouselExampleCaptions").css("margin-top", "153px");
      $(".searchForm").stop().animate(
        {
          top: "-75",
          left: "280",
          width: "140",
        },
        0.1
      );
    } else {
      $("header").removeClass("active");
      $("#carouselExampleCaptions").css("margin-top", "0px");
      $(".searchForm").stop().animate(
        {
          top: "0",
          left: "0",
          width: "648",
        },
        0.1
      );
    }
  });
});

// $(function () {
//   $(".headerButton").click(function () {
//     $(".sidebar").show();
//   });
//   $(".sidebarButton").click(function () {
//     $(".sidebar").hide();
//   });
//   $(".sidebar-container").click(function (e) {
//     if (!$(e.target).hasClass(".sidebar-container")) {
//       $(".sidebar").hide();
//     }
//   });
// });

$(function () {
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