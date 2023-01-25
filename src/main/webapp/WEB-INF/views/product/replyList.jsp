<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" defer></script>
    <script src="/resource/js/jquery-3.6.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>

    <link rel="stylesheet" href="/resource/css/common.css" />
    <link rel="stylesheet" href="/resource/css/reviewList.css" />

    <title>${lawyer.lawyerName} 변호사 - 지식IN 답변 | 법률서비스 101</title>
</head>
<body>
    <div class="container d-flex">
        <!-- sidebar -->
        <jsp:include page="../common/sidebar.jsp"/>

        <!-- left -->
        <div class="w-75 px-5">
            <!-- header -->
            <header class="d-flex justify-content-between align-items-center py-4 border-bottom">
                <ul class="mb-0 ps-0 d-flex align-items-center">
                <li class="me-4">
                    <button class="btn p-0 me-3 headerButton">
                        <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
                        </svg>
                    </button>
                </li>
                <li class="me-3"><button class="btn py-3 px-0 text-secondary" onclick="location.href='/product/detail/${lawyer.lawyerNum}'">변호사홈</button></li>
                <li class="me-3 active"><button class="btn py-3 px-0 text-secondary" onclick="location.href='/product/detail/${lawyer.lawyerNum}/reply'">지식IN 답변</button></li>
                <li class="me-3"><button class="btn py-3 px-0 text-secondary" onclick="location.href='/product/detail/${lawyer.lawyerNum}/review'">의뢰인후기</button></li>
                </ul>
                <a href="/booking/${lawyer.lawyerNum}" class="text-secondary fw-bold">
                상담예약
                </a>
            </header>
            <h3 class="fw-bold my-1 py-5 text-center border-top border-bottom"><span class="text-custom">지식IN 답변</span> ${pageInReply.getTotal()}건 중 <br>나와 비슷한 사례를 찾아보세요.</h3>
            <div class="border-top py-5">
                <h5 class="pb-3 border-bottom text-secondary fw-bold">답변 <span>${pageInReply.getTotal()}</span></h5>
                <ul class="ps-0 reply-list">
                    <c:forEach var="inReply" items="${pageInReply.getList()}">
                        <li class="py-5 border-bottom">
                            <a href="/knowledgeInDetail?num=${inReply.inBoardVo.inBoardNum}">
                                <p class="text-secondar small">${inReply.inBoardVo.categoryVo.categoryName}</p>
                                <h5 class="fw-bold">${inReply.inBoardVo.inBoardTitle}</h5>
                                <p class="small text-secondary mb-0">${fn:substring(inReply.replyDate, 0, 10)}</p>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
                <c:if test="${pageInReply.getTotal() > pageInReply.getPageSize()}">
                    <button class="btn btn-outline-custom w-100" id="moreButton">더 보기</button>
                </c:if>
            </div>
        </div>

        <!-- right -->
        <div class="pt-4" style="width: 30%;">
            <div class="text-white text-center py-5" style="background-color: #443736;">
                <h3 class="fw-bold mb-0"><span>${lawyer.lawyerName}</span> 변호사</h3>
                <p>${lawyer.companyVo.companyName}</p>
            </div>
            <div class="position-relative" style="height: 640px;">
                <img src="/display?fileName=${lawyer.lawyerMainImg}" alt="" width="100%" height="100%"/>
                <a href="/booking/${lawyer.lawyerNum}" class="d-inline-block position-absolute bottom-0 end-0 p-3 px-5 bg-custom text-white fw-bold m-4">
                    상담예약하기
                </a>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>

    <script>
        let pageNum = 1;
        $("#moreButton").click(function () {

            pageNum++;

            $.ajax({
                url: "/product/detail/${lawyer.lawyerNum}/loadReply",
                method: "GET",
                data: {pageNum: pageNum},
                success: function (result) {
                    $(".reply-list").append(result);

                    if (pageNum == ${pageInReply.getPages()}) {
                        $("#moreButton").hide();
                    }
                },
            })
        });

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
    </script>
</body>
</html>