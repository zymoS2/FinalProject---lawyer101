<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>${lawyer.lawyerName} 변호사 | 법률서비스 101</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" defer></script>

    <link href="/resource/css/sidebar.css" rel="stylesheet"/>
    <link href="/resource/css/footer.css" rel="stylesheet"/>
    <link href="/resource/css/common.css" rel="stylesheet"/>

    <link rel="stylesheet" href="/resource/css/productDetailPage.css" />
    <script src="/resource/js/jquery-3.6.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
    <script src="/resource/js/productDetailPage.js"></script>
  </head>
  <body>    
    <div class="container d-flex">


      <div class="w-75 px-5">
        <!-- header -->
        <header class="d-flex justify-content-between align-items-center py-4 border-bottom">
          <ul class="mb-0 ps-0 d-flex align-items-center">
            <li class="me-4">
              <button class="btn p-0 me-3">
                <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
                  <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
                </svg>
              </button>
            </li>
            <li class="me-3 active"><button class="btn py-3 px-0 text-secondary">변호사홈</button></li>
            <li class="me-3"><button class="btn py-3 px-0 text-secondary">지식IN 답변</button></li>
            <li class="me-3"><button class="btn py-3 px-0 text-secondary">의뢰인후기</button></li>
            <li class="me-3"><button class="btn py-3 px-0 text-secondary">위치</button></li>
          </ul>
          <a href="booking.html" class="text-secondary fw-bold">
            상담예약
          </a>
        </header>

        <!-- left -->
        <div class="mt-5">
          <h1 class="fw-bold">[말빨 전문] 답답하면 니들이 변호하던가</h1>
          <div class="d-flex justify-content-between py-4 border-bottom border-4">
            <table class="w-50 me-5">
              <tr>
                <td class="fs-5 fw-bold pb-3">${lawyer.lawyerName} 변호사<a href="reviewList.html" class="d-inline-block ms-3 text-body-tertiary text-decoration-underline" style="font-size: 12px;">후기 50+개</a></td>
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
                  이혼, 명예훼손/모욕 일반, 성폭력/강제추행 등
                  의료/식품의약
                </td>
              </tr>
            </table>
          </div>
          <div class="py-3">
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
            <div class="py-3">
              <a href="" class="fs-5 d-inline-block fw-bold mb-4">의뢰인 후기</a>
              <div id="carouselExampleIndicators" class="carousel slide mb-3" data-bs-ride="carousel">
                <div class="carousel-inner border p-5 bg-body-tertiary">
                  <div class="carousel-item active text-center" style="height: 160px;">
                    <h4 class="fw-bold mb-4">궁금한점이 있었는데 잘 해결됐습니다.</h4>
                    <div class="small text-secondary text-skip">제가 궁금한 부분이 있어 방문까지는 아니고 전화상담을 요청드렸습니다. 질문에 대한 명확한 답을 찾았고 제가 말이 조금 많은편이라 통화를 끊고보니 시간이 많이 초과했는데도 통화중 내색하지 않으시고 끝까지 제 입장에서 친절하게 답변주셨습니다. 추천드립니다</div>
                    <div class="d-flex justify-content-center my-2">
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
                    </div>
                    <p class="small text-secondary">의뢰인<span class="ms-1">홍길동</span><span class="ms-3">2023.01.01</span></p>
                  </div>
                  <div class="carousel-item text-center" style="height: 160px;">
                    <h4 class="fw-bold mb-4">정말 사건의 본질적인 부분을 명쾌하게 짚어주심!</h4>
                    <div class="small text-secondary text-skip">가장 원했던 답변을 짧은 시간내에 핵심적인 부분을 명쾌하게 짚어주시네요! 현실적인 조언, 한쪽으로 치우치지 않는 팩트를 잘 말씀해주시고 앞으로 어떻게 해야하는지에 대한 방향성까지 정말 만족하는 상담 시간이었습니다 해결을 위하여 의뢰드리려고요! 감사합니다 변호사님</div>
                    <div class="d-flex justify-content-center my-2">
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
                    </div>
                    <p class="small text-secondary">의뢰인<span class="ms-1">이순신</span><span class="ms-3">2023.01.01</span></p>
                  </div>
                  <div class="carousel-item text-center" style="height: 160px;">
                    <h4 class="fw-bold mb-4">너무 친절하시고 확실한 답변을 해주셨어요.</h4>
                    <div class="small text-secondary text-skip">오랫동안 저 자신을 의심하고 스트레스 받았던 사건인데, 말씀 듣고 나니 너무 후련하고 두려울게 없어졌습니다. 도움 많이 되었고 좋은 말씀과 해결책 감사드립니다~</div>
                    <div class="d-flex justify-content-center my-2">
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
                    </div>
                    <p class="small text-secondary">의뢰인<span class="ms-1">김유신</span><span class="ms-3">2023.01.01</span></p>
                  </div>
                </div>
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
              <a href="reviewList.html" class="text-secondary">후기 전체보기
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                  <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                </svg>
              </a>
            </div>
            <hr>
            <div class="py-3">
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
      <div class="pt-4" style="width: 498px;">
        <div class="text-white text-center py-5" style="background-color: #443736;">
          <h3 class="fw-bold mb-0"><span>${lawyer.lawyerName}</span> 변호사</h3>
          <p>${lawyer.companyVo.companyName}</p>
        </div>
        <div class="position-relative" style="height: 640px;">
          <img src="../resource//img/인물사진(상반신)1.jpg" alt="" width="100%" height="100%"/>
          <a href="booking.html" class="d-inline-block position-absolute bottom-0 end-0 p-3 px-5 bg-custom text-white fw-bold m-4">
            상담예약하기
          </a>
        </div>
      </div>
    </div>

    <!-- footer -->
    <div class="footer-container">
      <footer class="py-3 my-4">
        <ul class="nav justify-content-center border-bottom pb-3 mb-3">
          <li class="nav-item">
            <a href="#" class="nav-link px-2 text-muted">Home</a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link px-2 text-muted">Features</a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link px-2 text-muted">Pricing</a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link px-2 text-muted">FAQs</a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link px-2 text-muted">About</a>
          </li>
        </ul>
        <p class="text-center text-muted">&copy; 2022 Company, Inc</p>
      </footer>
    </div>
  </body>
</html>
