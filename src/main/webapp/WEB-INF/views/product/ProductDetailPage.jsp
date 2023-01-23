<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="frm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>${lawyer.lawyerName} 변호사 | 법률서비스 101</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" defer></script>
    <script src="/resource/js/jquery-3.6.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>

    <link href="/resource/css/sidebar.css" rel="stylesheet"/>
    <link href="/resource/css/footer.css" rel="stylesheet"/>
    <link href="/resource/css/common.css" rel="stylesheet"/>

    <link rel="stylesheet" href="/resource/css/productDetailPage.css" />
    <script src="/resource/js/productDetailPage.js"></script>
  </head>
  <body>    
    <div class="container d-flex">
      <!-- sidebar -->
      <jsp:include page="../common/sidebar.jsp"/>

      <!-- left -->
      <div class="px-5" style="width: 70%">
        <!-- header -->
        <header class="d-flex justify-content-between align-items-center py-4 border-bottom pydiv-2">
          <ul class="mb-0 ps-0 d-flex align-items-center">
            <li class="me-4">
              <button class="btn p-0 me-3 headerButton">
                <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
                  <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
                </svg>
              </button>
            </li>
            <li class="me-3 active"><button class="btn py-3 px-0 text-secondary headerli2">변호사홈</button></li>
            <li class="me-3"><button class="btn py-3 px-0 text-secondary headerli3">지식IN 답변</button></li>
            <li class="me-3"><button class="btn py-3 px-0 text-secondary headerli4">의뢰인후기</button></li>
            <li class="me-3"><button class="btn py-3 px-0 text-secondary headerli5">위치</button></li>
          </ul>
          <a href="/booking/${lawyer.lawyerNum}" class="text-secondary fw-bold">
            상담예약
          </a>
        </header>

        <div class="mt-5">
          <h1 class="fw-bold">${lawyer.lawyerIntroMsg}</h1>
          <div class="d-flex justify-content-between py-4 border-bottom border-4">
            <table class="w-50 me-5">
              <tr>
                <td class="fs-5 fw-bold pb-3">${lawyer.lawyerName} 변호사
                  <a href="/product/detail/${lawyer.lawyerNum}/review" class="d-inline-block ms-3 text-body-tertiary text-decoration-underline" style="font-size: 12px;">후기 ${reviewList.size()}+개</a></td>
              </tr>
              <tr>
                <td class="small pb-2">사무실</td>
              </tr>
              <tr aria-rowspan="2">
                <td class="small pb-2 text-secondary">
                  ${lawyer.companyVo.companyAddress},<br> ${lawyer.companyVo.companyName}
                </td>
              </tr>
              <tr aria-colspan="2">
                <td class="small fw-bold">사무실 전화 ${lawyer.companyVo.companyPhone}</td>
              </tr>
            </table>
            <table class="w-50 text-secondary">
              <tr class="align-top small">
                <td class="fw-bold" style="width: 40px;">분야</td>
                <td>
                  ${categoryVo.categoryName}
                </td>
              </tr>
            </table>
          </div>
          <div class="py-3 pydiv-3">
            <h4 class="my-4 fw-bold"><span class="bg-warning"><span>${lawyer.lawyerName}</span> 변호사</span>의 법률 활동을 확인하세요.</h4>
            <div class="py-3">
              <a href="commentList.html" class="fs-5 d-inline-block fw-bold mb-4">지식IN 답변<span class="ms-2 text-body-tertiary"><span>42</span> 
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                  <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                </svg>
              </span>
              </a>
              <ul class="d-flex justify-content-between ps-0">
                <li class="me-3">
                  <a href="" class="text-body-tertiary">
                    <h6 class="text-black">아청법 자동재생도 처벌받나요?</h6>
                    <p class="small mb-2 text-skip"><b class="me-2 text-custom">답변</b>아청물에대한 시청의 고의없이 우연히 일부가 재생된것이라면 처벌받지않습니다 사건화되는경우 변호사의 도움을받아 방어를진행하세요 전화주세요 도와드리겠습니다 좀더자세한상담을 위해서 전화로 연락주시면 앞으로의 대응방향에 대해 자세히 설명드리겠습니다 다수의 아청물사건을 처리하였습니다</p>
                    <p class="small">작성일<span class="ms-2">2023.01.01</span></p>
                  </a>
                </li>
                <li class="me-3">
                  <a href="" class="text-body-tertiary">
                    <h6 class="text-black">아청법 자동재생도 처벌받나요?</h6>
                    <p class="small mb-2 text-skip"><b class="me-2 text-custom">답변</b>아청물에대한 시청의 고의없이 우연히 일부가 재생된것이라면 처벌받지않습니다 사건화되는경우 변호사의 도움을받아 방어를진행하세요 전화주세요 도와드리겠습니다 좀더자세한상담을 위해서 전화로 연락주시면 앞으로의 대응방향에 대해 자세히 설명드리겠습니다 다수의 아청물사건을 처리하였습니다</p>
                    <p class="small">작성일<span class="ms-2">2023.01.01</span></p>
                  </a>
                </li>
                <li class="me-3">
                  <a href="" class="text-body-tertiary">
                    <h6 class="text-black">지하철에서 공밀추 문의드립니다
                    </h6>
                    <p class="small mb-2 text-skip"><b class="me-2 text-custom">답변</b>지하철 출퇴근 길에 사람이 너무 많아서 밀집한 상태에서 주위 여성과 몸이 밀착 되어 있었던 탓에 불필요한 신체접촉이 발생하여 잠복근무 중인 사복 경찰관에게 적발이 되거나, 피해자로부터 신고를 당하여 성폭력처벌법 위반 공중밀집장소 추행죄 혐의로 경찰조사를 받고 형사처벌을 받게 되는 경우도 빈번하니 주의해야 합니다.
                    </p>
                    <p class="small">작성일<span class="ms-2">2023.01.01</span></p>
                  </a>
                </li>
              </ul>
            </div>
            <hr>
            <div class="py-3 pydiv-4">
              <h4 class="fs-5 d-inline-block fw-bold mb-4">의뢰인 후기</h4>
                <c:choose>
                  <c:when test="${empty reviewList}">
                    <p class="text-secondary">등록된 후기가 없습니다.</p>
                  </c:when>
                  <c:otherwise>
                  <div id="carouselExampleIndicators" class="carousel slide mb-3" data-bs-ride="carousel">
                    <div class="carousel-inner border p-5 bg-body-tertiary">
                    <c:forEach var="review" items="${reviewList}">
                      <div class="carousel-item text-center" style="height: 160px;">
                        <h4 class="fw-bold mb-4 text-truncate">${review.reviewTitle}</h4>
                        <div class="small text-secondary text-skip">${review.reviewContent}</div>
                        <div class="d-flex justify-content-center my-2">
                          <c:choose>
                            <c:when test="${review.reviewRating eq 0}">
                              <div class="text-warning">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
                                  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                                </svg>
                              </div>
                              <div class="text-warning">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
                                  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                                </svg>
                              </div>
                              <div class="text-warning">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
                                  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                                </svg>
                              </div>
                              <div class="text-custom">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
                                  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                                </svg>
                              </div>
                              <div class="text-custom">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
                                  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                                </svg>
                              </div>
                            </c:when>
                            <c:when test="${review.reviewRating eq 1}">
                              <div class="text-custom">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                </svg>
                              </div>
                              <div class="text-custom">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
                                  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                                </svg>
                              </div>
                              <div class="text-custom">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
                                  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                                </svg>
                              </div>
                              <div class="text-custom">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
                                  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                                </svg>
                              </div>
                              <div class="text-custom">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
                                  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                                </svg>
                              </div>
                            </c:when>
                            <c:when test="${review.reviewRating eq 2}">
                              <div class="text-custom">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                </svg>
                              </div>
                              <div class="text-custom">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                </svg>
                              </div>
                              <div class="text-custom">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
                                  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                                </svg>
                              </div>
                              <div class="text-custom">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
                                  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                                </svg>
                              </div>
                              <div class="text-custom">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
                                  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                                </svg>
                              </div>
                            </c:when>
                            <c:when test="${review.reviewRating eq 3}">
                              <div class="text-custom">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                </svg>
                              </div>
                              <div class="text-custom">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                </svg>
                              </div>
                              <div class="text-custom">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                </svg>
                              </div>
                              <div class="text-custom">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
                                  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                                </svg>
                              </div>
                              <div class="text-custom">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
                                  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                                </svg>
                              </div>
                            </c:when>
                            <c:when test="${review.reviewRating eq 4}">
                              <div class="text-custom">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                </svg>
                              </div>
                              <div class="text-custom">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                </svg>
                              </div>
                              <div class="text-custom">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                </svg>
                              </div>
                              <div class="text-custom">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                </svg>
                              </div>
                              <div class="text-custom">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
                                  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                                </svg>
                              </div>
                            </c:when>
                            <c:when test="${review.reviewRating eq 5}">
                              <div class="text-custom">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                </svg>
                              </div>
                              <div class="text-custom">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                </svg>
                              </div>
                              <div class="text-custom">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                </svg>
                              </div>
                              <div class="text-custom">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                </svg>
                              </div>
                              <div class="text-custom">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                                </svg>
                              </div>
                            </c:when>
                          </c:choose>
                        </div>
                        <p class="small text-secondary">의뢰인<span class="ms-1">${review.clientVo.clientName}</span>
                          <frm:parseDate var="parseDate" pattern="yyyy-MM-dd" value="${review.reviewDate}"/>
                          <frm:formatDate var="reviewDate" pattern="yyyy-MM-dd" value="${parseDate}"/>
                          <span class="ms-3">${reviewDate}</span></p>
                      </div>
                    </c:forEach>
                      <button class="carousel-control-prev" style="width: initial;" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon text-custom" aria-hidden="true">
                          <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
                          </svg>
                        </span>
                              <span class="visually-hidden">Previous</span>
                      </button>
                      <button class="carousel-control-next" style="width: initial;" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                        <span class="carousel-control-next-icon text-custom" aria-hidden="true">
                          <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                          </svg>
                        </span>
                        <span class="visually-hidden">Next</span>
                      </button>
                    </div>
                  </div>
                  </c:otherwise>
                </c:choose>
              <a href="/product/detail/${lawyer.lawyerNum}/review" class="text-secondary">후기 전체보기
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                  <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                </svg>
              </a>
            </div>
            <hr>
            <div class="py-3 pydiv-5">
              <h5 class="fs-5 d-inline-block fw-bold">위치</h5>
              <p class="fw-bold">법률사무소에 오셔서 <br>문제를 해결하세요.</p><br>
              <p class="fs-5 mb-1">${lawyer.companyVo.companyName}
                <p class="text-se">${lawyer.companyVo.companyAddress}, ${lawyer.companyVo.companyName}</p>
              </p>
              <div>
                <div id="map" class="w-100 bg-black" style="height: 400px;"></div>
              </div>
            </div>
          </div>
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

    <!-- footer -->
    <jsp:include page="../common/footer.jsp"/>
  </body>
</html>

