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
      <li class="me-4 active"><a href="/product/list?type=lawyer&keyword=${keyword}" class="d-inline-block py-3">변호사</a></li>
      <li class="me-4"><a href="/product/list?type=knowledgeIn&keyword=${keyword}" class="d-inline-block py-3">지식IN</a></li>
    </ul>
    <div class="marketing">
      <div class="lawyer-container row flex-wrap">
        <c:forEach var="lawyer" items="${pageLawyer.getList()}">
          <div class="col-lg-4 text-center my-5">
            <a href="/product/detail/${lawyer.lawyerNum}" class="profile rounded-circle d-inline-block">
              <img src="/resource/img/profile.png" alt="" width="100%" height="100%">
            </a>
            <div class="card-body">
              <h3 class="t-name">${lawyer.lawyerName} 변호사</h3>
              <p class="t-company">${lawyer.companyVo.companyName}</p>
              <p class="card-text">
                <a href="/product/detail/${lawyer.lawyerNum}">
                    ${lawyer.lawyerIntroMsg}<span class="point-bold"> ▖ </span>
                </a>
              </p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-custom"
                          onclick="location.href='/product/detail/' + ${lawyer.lawyerNum}">더보기
                  </button>
                  <button type="button" class="btn btn-sm btn-outline-custom"
                          onclick="location.href='/booking/' + ${lawyer.lawyerNum}">예약하기
                  </button>
                </div>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
      <hr class="featurette-divider" />
    </div>
  </div>
  <!-- footer -->
  <jsp:include page="../common/footer.jsp" />

  <script>
    $(window).scroll(function () {
      getLawyerList(${pageLawyer.getPages()});
    })
  </script>
</body>

</html>