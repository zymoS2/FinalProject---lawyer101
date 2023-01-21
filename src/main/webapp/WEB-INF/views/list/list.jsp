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
</head>

<body>
  <!-- header -->
  <jsp:include page="../common/header.jsp" />
  <jsp:include page="../common/sidebar.jsp" />

  <div class="container">
    <ul class="category d-flex ps-0 border-bottom">
      <li class="me-4 active"><a href="/product/list?keyword=${keyword}" class="d-inline-block py-3">통합</a></li>
      <li class="me-4"><a href="/product/list?type=lawyer&keyword=${keyword}" class="d-inline-block py-3">변호사</a></li>
      <li class="me-4"><a href="/product/list?type=knowledgeIn&keyword=${keyword}" class="d-inline-block py-3">지식IN</a></li>
    </ul>
    <h4 class="fw-bold my-5">
      <a href="/product/list?type=lawyer&keyword=${keyword}">변호사
        <span class="text-secondary">${pageLawyer.getTotal()}
          <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
          </svg>
        </span>
     </a>
    </h4>
    <div class="marketing">
      <div class="row flex-wrap">
        <c:forEach var="lawyer" items="${pageLawyer.getList()}">
          <div class="col-lg-4 text-center mb-5">
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
        <c:if test="${pageLawyer.getPageSize() < pageLawyer.getTotal()}">
          <div class="text-center">
            <button class="btn btn-light w-100" onclick="location.href='/product/list?type=lawyer&keyword=${keyword}'">모두보기</button>
          </div>
        </c:if>
      </div>
      <hr class="featurette-divider" />
    </div>

    <div class="consulting">
      <h4 class="fw-bold mt-5">
        <a href="/product/list?type=knowledgeIn&keyword=${keyword}">지식인
          <span class="text-secondary">${pageInBoard.getTotal()}
          <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
          </svg>
        </span>
        </a>
      </h4>
      <ul class="ps-0">
        <c:forEach var="inBoard" items="${pageInBoard.getList()}">
          <li>
            <a href="/knowledgeInDetail/${inBoard.inBoardNum}" class="d-inline-block py-5 border-bottom">
              <p class="text-secondary">${inBoard.categoryVo.categoryName}</p>
              <h4 class="mb-3">${inBoard.inBoardTitle}</h4>
              <p><b class="text-custom">답변</b><span class="ps-3">지세훈</span> 변호사</p>
              <p class="text-skip">
                문의주신 사안의 경우 합의금조로 퇴직금과 급여를 받지 않겠다고 하며 상대방과 합의를 해 보는 것이 최선으로 보여집니다. 만약 상대방이 합의를 해 주지 않고 고소에 나아간 경우라면 받지 못한 임금 및 퇴직금에 대하여 노동청에 진정을 제기하는 것을 고려해 보시기 바랍니다. 이상의 점 참고하셔서 필요한 경우 구체적인 사실관계를 바탕으로 자세한 상담을 받아 보실 것을 권해드립니다.
              </p>
              <p class="text-secondary">다른 변호사 답변 <span>2</span>개</p>
              <small class="text-secondary">조회수 <b>100</b></small>
            </a>
          </li>
        </c:forEach>
      </ul>
      <c:if test="${pageInBoard.getPageSize() < pageInBoard.getTotal()}">
        <div class="text-center">
          <button class="btn btn-light w-100" onclick="location.href='/product/list?type=knowledgeIn&keyword=${keyword}'">모두보기</button>
        </div>
      </c:if>
    </div>
  </div>
  <hr class="featurette-divider" />
  <!-- footer -->
  <jsp:include page="../common/footer.jsp" />
</body>

</html>