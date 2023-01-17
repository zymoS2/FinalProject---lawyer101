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