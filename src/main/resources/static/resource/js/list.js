const headerHeight = $("header").height();
$(window).scroll(function () {
    const st = $(this).scrollTop();

    if (st > headerHeight) {
        $(".category").css("margin-top", "154px");
    } else {
        $(".category").css("margin-top", "0px");
    }
});

function getScrollTop() {
    return (window.pageYOffset !== undefined) ? window.pageYOffset : (document.documentElement || document.body.parentNode || document.body).scrollTop;
};

function getDocumentHeight() {
    const body = document.body;
    const html = document.documentElement;

    return Math.max(
        body.scrollHeight, body.offsetHeight,
        html.clientHeight, html.scrollHeight, html.offsetHeight
    );
};

function getFooterHeight() {
    const footer = document.querySelector('footer');
    return footer.offsetHeight;
};

let pageNum = 1;
let isLoading = false;

// 변호사 목록 페이징 요청
function getLawyerList(totalPage) {
    const keyword = $("input[type='search']").val();
    const isBottom = getScrollTop() + window.innerHeight + 40 >= getDocumentHeight() - getFooterHeight();

    if (isBottom) {

        if (pageNum == totalPage || isLoading) {
            return;
        }

        isLoading = true;
        pageNum++;
        const params = {
            pageNum: pageNum,
            keyword: keyword
        }

        $.ajax({
            url: "/product/list/loadLawyers",
            method: "GET",
            data: params,
            success: function (result) {
                $(".lawyer-container").append(result);
                isLoading = false;
            },
        })
    }
}

// 지식인 목록 페이징 요청
function getKnowledgeInList(totalPage) {
    const keyword = $("input[type='search']").val();
    const isBottom = getScrollTop() + window.innerHeight + 40 >= getDocumentHeight() - getFooterHeight();

    if (isBottom) {

        if (pageNum == totalPage || isLoading) {
            return;
        }

        isLoading = true;
        pageNum++;
        const params = {
            pageNum : pageNum,
            keyword: keyword
        }

        $.ajax({
            url: "/product/list/loadKnowledgeIns",
            method: "GET",
            data: params,
            success: function (result) {
                $(".knowledgeIn-container").append(result);
                isLoading = false;
            },
        })
    }
}