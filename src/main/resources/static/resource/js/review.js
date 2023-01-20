$(function () {
    $("#submit-btn").on("click", function () {
        if (!$("input[type='checkbox']").is(":checked")) {
            alert("안내사항에 동의하지 않았습니다.");
            return;
        }
        if (validate()) {
            $("#reviewForm").submit();
        }
    });

    function validate() {
        const title = $("#reviewTitle").val();
        if (title === "" || title === null) {
            alert("제목을 작성하세요.");
            return false;
        }

        if (title.length < 10) {
            alert("제목을 10자 이상 작성하세요.");
            return false;
        }

        const content = $("#reviewContent").val();
        if (content === "" || content === null) {
            alert("내용을 작성하세요.");
            return false;
        }

        if (content.length < 200) {
            alert("내용을 200자 이상 작성하세요");
            return false;
        }

        return true;
    }

    let totalStar = 0; // 서버에 넘겨줄 최종 별점
    $('.rating-star').each(function(index) {
        $(this).data('rating', index + 1); // 각각의 별 요소에 rating data로 index 를 설정
    })

    $('.rating-star').on({
        mouseover: function(e) {
            onMouseOver(e);
        },
        mouseleave: function() {
            onMouseLeave();
        },
        click: function(e) {
            onClick(e);
        }
    })

    function onMouseOver(e) {
        const ratingVal = $(e.currentTarget).data('rating');
        if (!ratingVal) {
            return;
        } else {
            fill(ratingVal);
        }
    }

    function onMouseLeave() {
        fill(totalStar);
    }

    function onClick(e) {
        const ratingVal = $(e.currentTarget).data('rating');
        totalStar = ratingVal;
        $('#reviewRating').val(totalStar);
    }

    function fill(ratingVal) {
        $('.rating-star').each(function(index) {
            if(index < ratingVal) { // 전달받은 rating data 에서 -1 에 해당하는 index 만큼 색상 변경
                $('.rating-star').eq(index).removeClass("text-body-tertiary");
                $('.rating-star').eq(index).addClass("text-warning");
            } else {
                $('.rating-star').eq(index).addClass("text-body-tertiary");
                $('.rating-star').eq(index).removeClass("text-warning");
            }
        })
    }
});