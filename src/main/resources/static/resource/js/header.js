$(function() {
    var headerHeight = $("header").height();
    $(window).scroll(function () {
        var st = $(this).scrollTop();

        if (st > headerHeight) {
            $("header").addClass("active");
            $(".searchForm").stop().animate(
                {
                top: "-82",
                left: "261",
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
                width: "50%",
                },
                0.1
            );
        }
    });

    // 검색
    $(".searchFormButton").on("click", function () {
        const keyword = $("input[type='search']").val();
        if (keyword === null || keyword === "") {
            return;
        } else {
            $(".searchForm").submit();
        }
    });

    $("input[type='search']").on("keydown", function (e) {
        if (e.keyCode === 13) {
            e.preventDefault();
            const keyword = $(this).val();

            if (keyword === null || keyword === "") {
                return;
            } else {
                $(".searchForm").submit();
            }
        }
    });
})
