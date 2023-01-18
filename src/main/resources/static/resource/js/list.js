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