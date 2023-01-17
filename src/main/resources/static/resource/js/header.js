$(function() {
    var headerHeight = $("header").height();
    $(window).scroll(function () {
        var st = $(this).scrollTop();

        if (st > headerHeight) {
            $("header").addClass("active");
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
})
