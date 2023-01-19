<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
      <meta charset="UTF-8">
       <meta http-equiv="X-UA-Compatible" content="IE=edge">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"/>
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" defer></script>

       <link href="../resource/css/headers.css" rel="stylesheet" />
       <link href="../resource/css/footer.css" rel="stylesheet" />
       <link href="../resource/css/sidebars.css" rel="stylesheet" />
       <link href="../resource/css/common.css" rel="stylesheet" />

       <link rel="stylesheet" href="../resource/css/knowledgeIN.css" />
       <title>지식IN - 상세 보기 | 법률서비스 101</title>
</head>
<body>
    <!-- header -->
        <jsp:include page="common/header.jsp" />
    <form action="" id="knowledgeInDetailForm" method="post">
       <div class="container" style="width: 1080px;">


                    <div class="pt-5 pb-3">
                      <p class="text-secondary">${showPost.categoryVo.categoryName}</p>
                      <h2 class="fw-bold mb-4">${showPost.inBoardTitle}</h2>
                      <p>
                         ${showPost.inBoardContent}
                      </p>
                      <p class="small text-secondary"><span class="d-inline-block me-2">${showPost.writerDate}</span>조회수 <span>45</span></p>
                      <button class="px-0 bg-transparent border-0">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-emoji-smile" viewBox="0 0 16 16">
                              <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                              <path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
                          </svg>
                          도움됐어요
                      </button>
                    </div>


              <hr>
              <div class="py-3">
                  <h6 class="fw-bold">변호사 답변 총 <span class="text-custom">2건</span></h6>
                  <ul class="ps-0 py-4">
                      <li>
                          <div class="d-flex align-items-center bg-body-tertiary py-4 px-3 rounded-3">
                              <a href="productDetailPage.html" style="width: 64px; height: 64px;">
                                  <img src="../resource/img/profile.png" alt="" width="100%" height="100%">
                              </a>
                              <div class="ms-3">
                                  <p class="mb-1 text-secondary small">기성용법률사무소</p>
                                  <a href="productDetailPage.html" class="mb-0 fw-bold">기성용 변호사</a>
                              </div>
                          </div>
                          <div class="p-4">
                              <p>문의주신 사안의 경우 경찰이 모든 자료를 검찰에 보내버린 상태라면 정보공개청구를 통해 열람이 어려울 것입니다. 이 경우 가까운 검찰청 민원실에 방문하셔서 열람신청을 하실 수 있을 것이니 참고하시기 바라겠습니다.</p>
                              <p class="small text-secondary">2023.01.01</p>
                          </div>
                      </li>
                      <li>
                          <div class="d-flex align-items-center bg-body-tertiary py-4 px-3 rounded-3">
                              <a href="productDetailPage.html" style="width: 64px; height: 64px;">
                                  <img src="../resource/img/profile.png" alt="" width="100%" height="100%">
                              </a>
                              <div class="ms-3">
                                  <p class="mb-1 text-secondary small">한바다 법무법인</p>
                                  <a href="productDetailPage.html" class="mb-0 fw-bold">우영우 변호사</a>
                              </div>
                          </div>
                          <div class="p-4">
                              <p>문의주신 사안의 경우 경찰이 모든 자료를 검찰에 보내버린 상태라면 정보공개청구를 통해 열람이 어려울 것입니다. 이 경우 가까운 검찰청 민원실에 방문하셔서 열람신청을 하실 수 있을 것이니 참고하시기 바라겠습니다.</p>
                              <p class="small text-secondary">2023.01.01</p>
                          </div>
                      </li>
                  </ul>
              </div>
          </div>
    </form>
 <!-- footer -->
            <jsp:include page="common/footer.jsp" />
</body>
</html>
