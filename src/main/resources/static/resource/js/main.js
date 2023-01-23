$(function() {
    var headerHeight = $("header").height();
    $(window).scroll(function () {
        var st = $(this).scrollTop();

        if (st > headerHeight) {
            $("#carouselExampleCaptions").css("margin-top", "156px");
        } else {
            $("#carouselExampleCaptions").css("margin-top", "0px");
        }
    });
})