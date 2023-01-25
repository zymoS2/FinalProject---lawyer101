<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>변호사 찾기</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" defer></script>
  <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>

  <link href="/resource/css/common.css" rel="stylesheet" />
  <link href="/resource/css/list.css" rel="stylesheet" />
  <script src="/resource/js/list.js" defer></script>
</head>

<body>
  <!-- header -->
  <jsp:include page="../common/header.jsp" />
  <jsp:include page="../common/sidebar.jsp" />

  <div class="container">
    <ul class="category d-flex ps-0 border-bottom">
      <li class="me-4"><a href="/product/list?keyword=${keyword}" class="d-inline-block py-3">통합</a></li>
      <li class="me-4"><a href="/product/list?type=lawyer&keyword=${keyword}" class="d-inline-block py-3">변호사</a></li>
      <li class="me-4 active"><a href="/product/list?type=knowledgeIn&keyword=${keyword}" class="d-inline-block py-3">지식IN</a></li>
    </ul>

    <ul class="ps-0 knowledgeIn-container">
      <c:forEach var="inBoard" items="${pageInBoard.getList()}">
        <li>
          <a href="/knowledgeInDetail?num=${inBoard.inBoardNum}" class="d-inline-block py-5 border-bottom">
            <p class="text-secondary">${inBoard.categoryVo.categoryName}</p>
            <h4 class="mb-3 text-skip">${inBoard.inBoardTitle}</h4>
            <p><b class="text-custom">답변</b><span class="ps-3">지세훈</span> 변호사</p>
            <p class="text-skip">
              문의주신 사안의 경우 합의금조로 퇴직금과 급여를 받지 않겠다고 하며 상대방과 합의를 해 보는 것이 최선으로 보여집니다. 만약 상대방이 합의를 해 주지 않고 고소에 나아간 경우라면 받지 못한 임금 및 퇴직금에 대하여 노동청에 진정을 제기하는 것을 고려해 보시기 바랍니다. 이상의 점 참고하셔서 필요한 경우 구체적인 사실관계를 바탕으로 자세한 상담을 받아 보실 것을 권해드립니다.
            </p>
            <p class="text-secondary">다른 변호사 답변 <span>2</span>개</p>
            <small class="text-secondary">조회수 <b>${inBoard.inBoardCount}</b></small>
          </a>
        </li>
      </c:forEach>
    </ul>
  </div>
  <!-- footer -->
  <jsp:include page="../common/footer.jsp" />

  <script>
    $(window).scroll(function () {
        getKnowledgeInList(${pageInBoard.getPages()});
    })
  </script>
</body>

</html>