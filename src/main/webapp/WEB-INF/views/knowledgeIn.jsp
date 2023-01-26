<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <title>지식IN | 법률서비스 101</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" defer></script>
        <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
        <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
        <link href="/resource/css/common.css" rel="stylesheet" />
        <link href="/resource/css/common.css" rel="stylesheet" />
        <link rel="stylesheet" href="/resource/css/knowledgeIN.css" />
        <script src="/resource/js/knowledgeIn.js"></script>

         <script type="text/javascript">
         function setSortType(sortType){
            console.log('sortType : ' + sortType);
            document.getElementsByName('sortType')[0].value = sortType;
            document.getElementById('knowledgeInForm').setAttribute('action', '/knowledgeIn');
            document.getElementById('knowledgeInForm').submit();
         }

         function setPage(sortType, page){
            console.log('page : ' + page);
            document.getElementsByName('sortType')[0].value = sortType;
            document.getElementsByName('page')[0].value = page;
            document.getElementById('knowledgeInForm').setAttribute('action', '/knowledgeIn');
            document.getElementById('knowledgeInForm').submit();
         }
         </script>
    </head>
    <body>
       <!-- header -->
       <jsp:include page="common/header.jsp"/>

       <!-- sidebar -->
       <jsp:include page="common/sidebar.jsp"/>

        <form action="" id="knowledgeInForm"  method="get">
            <input type="hidden" name="sortType" />
            <input type="hidden" name="page" />

            <div class="counseldiv2 container">
              <h3 class="counseltableh3">지식IN</h3>
              <div class="d-flex">
                <div style="width: 65%;">
                  <ul class="counseltable py-3 ps-0 mb-0 border-top border-bottom">
                      <li class="d-inline-block me-3"><a href="javascript:setSortType('boardNum');" class="<c:if test="${sortType eq 'boardNum'}">active</c:if>">최신 질문순</a></li>
                      <li class="d-inline-block me-3"><a href="javascript:setSortType('boardCount');" class="<c:if test="${sortType eq 'boardCount'}">active</c:if>">조회수</a></li>
                  </ul>

                    <div>
                      <c:forEach var="sb" items="${pagePost.getList()}" varStatus="status">
                        <a href="/knowledgeInDetail?num=${sb.inBoardNum}" class="d-block py-5 border-bottom">
                          <p class="text-secondary"> ${sb.categoryVo.categoryName}</p>
                          <h4 class="mb-3 text-skip-2">${sb.inBoardTitle}</h4>
                          <input type="hidden" ${sb.inBoardNum}>

                          <p>
                            <c:if test="${!empty allInReply.get(status.index)}">
                                <p><b class="text-custom">답변</b><span class="ps-3">${allInReply.get(status.index).get(0).lawyerVo.lawyerName}</span> 변호사</p>
                                <p class="text-skip">${allInReply.get(status.index).get(0).replyContent}</p>
                            </c:if>
                            <p class="text-secondary">다른 변호사 답변 ${allInReply.get(status.index).size()}개</p>
                            <small class="text-secondary">조회수 <b>${sb.inBoardCount}</b></small>
                        </a>
                        </c:forEach>
                    </div>
                    
                    <c:choose>
                        <c:when test="${sortType == 'boardNum'}">
                            <div class="pagination justify-content-center align-items-center p-3">
                                <a href="" class="small mx-3" >이전 페이지</a>
                                <a href="javascript:setPage('boardNum', '1');" class="mx-3 mb-1 <c:if test="${pagePost.pageNum == '1'}">active</c:if>">1</a>
                                <a href="javascript:setPage('boardNum', '2');" class="mx-3 mb-1 <c:if test="${pagePost.pageNum == '2'}">active</c:if>">2</a>
                                <a href="javascript:setPage('boardNum', '3');" class="mx-3 mb-1 <c:if test="${pagePost.pageNum == '3'}">active</c:if>">3</a>
                                <a href="javascript:setPage('boardNum', '4');" class="mx-3 mb-1 <c:if test="${pagePost.pageNum == '4'}">active</c:if>">4</a>
                                <a href="javascript:setPage('boardNum', '5');" class="mx-3 mb-1 <c:if test="${pagePost.pageNum == '5'}">active</c:if>">5</a>
                                <a href="javascript:setPage('boardNum', '6');" class="mx-3 mb-1 <c:if test="${pagePost.pageNum == '6'}">active</c:if>">6</a>
                                <a href="javascript:setPage('boardNum', '7');" class="mx-3 mb-1 <c:if test="${pagePost.pageNum == '7'}">active</c:if>">7</a>
                                <a href="javascript:setPage('boardNum', '8');" class="mx-3 mb-1 <c:if test="${pagePost.pageNum == '8'}">active</c:if>">8</a>
                                <a href="javascript:setPage('boardNum', '9');" class="mx-3 mb-1 <c:if test="${pagePost.pageNum == '9'}">active</c:if>">9</a>
                                <a href="javascript:setPage('boardNum', '10');" class="mx-3 mb-1 <c:if test="${pagePost.pageNum == '10'}">active</c:if>">10</a>
                                <a href="" class="small mx-3">다음 페이지</a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="pagination justify-content-center align-items-center p-3">
                                <a href="" class="small mx-3" >이전 페이지</a>
                                <a href="javascript:setPage('boardCount', '1');" class="mx-3 mb-1 <c:if test="${pagePost.pageNum == '1'}">active</c:if>">1</a>
                                <a href="javascript:setPage('boardCount', '2');" class="mx-3 mb-1 <c:if test="${pagePost.pageNum == '2'}">active</c:if>">2</a>
                                <a href="javascript:setPage('boardCount', '3');" class="mx-3 mb-1 <c:if test="${pagePost.pageNum == '3'}">active</c:if>">3</a>
                                <a href="javascript:setPage('boardCount', '4');" class="mx-3 mb-1 <c:if test="${pagePost.pageNum == '4'}">active</c:if>">4</a>
                                <a href="javascript:setPage('boardCount', '5');" class="mx-3 mb-1 <c:if test="${pagePost.pageNum == '5'}">active</c:if>">5</a>
                                <a href="javascript:setPage('boardCount', '6');" class="mx-3 mb-1 <c:if test="${pagePost.pageNum == '6'}">active</c:if>">6</a>
                                <a href="javascript:setPage('boardCount', '7');" class="mx-3 mb-1 <c:if test="${pagePost.pageNum == '7'}">active</c:if>">7</a>
                                <a href="javascript:setPage('boardCount', '8');" class="mx-3 mb-1 <c:if test="${pagePost.pageNum == '8'}">active</c:if>">8</a>
                                <a href="javascript:setPage('boardCount', '9');" class="mx-3 mb-1 <c:if test="${pagePost.pageNum == '9'}">active</c:if>">9</a>
                                <a href="javascript:setPage('boardCount', '10');" class="mx-3 mb-1 <c:if test="${pagePost.pageNum == '10'}">active</c:if>">10</a>
                                <a href="" class="small mx-3">다음 페이지</a>
                            </div>
                        </c:otherwise>
                    </c:choose>

                </div>
                <div class="h-100 ps-5 border-top" style="width: 35%;">
                  <div class="border-bottom py-5">
                    <p class="">최근 답변이 활발한 변호사</p>
                    <ul class="p-0 overflow-hidden recentlyLawyerReplyList" style="height: 189px">
                        <c:forEach var="recentlyLawyerReply" items="${recentlyLawyerReplyList}" varStatus="status" begin="0" end="9">
                            <li>
                                <a href="/product/detail/${recentlyLawyerReply.lawyerVo.lawyerNum}" class="d-flex align-items-center mb-3">
                                    <div class="text-custom fw-bold" style="width: 20%;">${status.count}위</div>
                                    <div>
                                        <img src="/display?fileName=${recentlyLawyerReply.lawyerVo.lawyerImg}" onerror="this.src='/resource/img/profile.png';"
                                             alt="프로필사진" width="48" height="48" class="rounded-circle">
                                    </div>
                                    <div class="px-3 w-100">
                                        <p class="small fw-bold mb-1">${recentlyLawyerReply.lawyerVo.lawyerName} 변호사</p>
                                        <small>${recentlyLawyerReply.lawyerVo.lawyerIntroMsg} </small>
                                    </div>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                    <div>
                      <button type="button" class="btn p-0" id="moreButton">10위까지 보기
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
                          <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
                        </svg>
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <div class="writing text-white d-flex flex-column justify-content-center align-items-center bg-custom rounded-circle" style="width: 88px; height: 88px;"
                onclick="location.href='/knowledgeInPost'">

                <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                  <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
                </svg>
                <span class="text-white fw-bold">글쓰기</span>
              </div>
            </div>
        </form>

        <!-- footer -->
        <jsp:include page="common/footer.jsp" />

        <script>
            let more = false;
            $("#moreButton").click(function () {
                if (!more) {
                    $(".recentlyLawyerReplyList").animate({height:"645px"}, 200);
                    $(".bi-chevron-down").animate({rotate:"180deg"}, 100);
                    more = true;
                } else {
                    $(".recentlyLawyerReplyList").animate({height:"189px"}, 200);
                    $(".bi-chevron-down").animate({rotate:"0deg"}, 100);
                    more = false;
                }
            });
        </script>
    </body>
</html>