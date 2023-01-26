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
          <a href="/knowledgeInDetail?num=${inBoard.inBoardNum}" class="d-block py-5 border-bottom">
            <p class="text-secondary">${inBoard.categoryVo.categoryName}</p>
            <h4 class="mb-3 text-skip">${inBoard.inBoardTitle}</h4>
            <c:if test="${!empty allInReply.get(status.index)}">
              <p><b class="text-custom">답변</b><span class="ps-3">${allInReply.get(status.index).get(0).lawyerVo.lawyerName}</span> 변호사</p>
              <p class="text-skip">
                  ${allInReply.get(status.index).get(0).replyContent}
              </p>
            </c:if>
            <p class="text-secondary">다른 변호사 답변 ${allInReply.get(status.index).size()}개</p>
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