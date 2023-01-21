<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" defer></script>
  <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>

  <link rel="stylesheet" href="/resource/css/common.css" />
  <link rel="stylesheet" href="/resource/css/review.css" />
  <script src="/resource/js/review.js"></script>

  <title>리뷰 작성 | 법률서비스 101</title>
</head>
<body>

  <!-- header -->
  <jsp:include page="../common/header.jsp"/>

  <!-- sidebar -->
  <jsp:include page="../common/sidebar.jsp"/>

  <div class="container">
    <h3 class="text-center my-5">리뷰 작성</h3>
    <form action="/review/write/${paymentVo.paymentNum}" method="post" id="reviewForm">
      <div class="card m-auto my-5 p-4">
        <div class="profile mb-3">
          <img src="/display?fileName=${paymentVo.bookingVo.lawyerVo.lawyerImg}" width="100" height="100" class="pic" onerror="this.src='/resource/img/profile.png';" />
          <div class="rating ms-3">
            <div class="rating-star text-body-tertiary">
              <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
              </svg>
            </div>
            <div class="rating-star text-body-tertiary">
              <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
              </svg>
            </div>
            <div class="rating-star text-body-tertiary">
              <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
              </svg>
            </div>
            <div class="rating-star text-body-tertiary">
              <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
              </svg>
            </div>
            <div class="rating-star text-body-tertiary">
              <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
              </svg>
            </div>
          </div>
        </div>
        <input type="hidden" name="reviewRating" id="reviewRating" value="0">
        <div class="question-wrap mb-3">
          <p class="question-top">
            ${paymentVo.bookingVo.lawyerVo.lawyerName} 변호사에 대한 <span class="point-bold">솔직한 리뷰</span>를 작성해보세요
          </p>
        </div>
        <div class="comment-area mb-3">
          <div class="title-wrap">
            <div class="title">
              <label for="reviewTitle">
                제목<span class="pont-title">(10자 이상<span class="pont-color">*</span>)</span>
              </label>
            </div>
          </div>
          <textarea id="reviewTitle" class="text-form1 form-control" name="reviewTitle" placeholder="제목을 작성해주세요."></textarea>
        </div>
        <div class="form-middle"></div>
        <div class="title">
          <label for="reviewContent">
            내용<span class="pont-title">(200자 이상<span class="pont-color">*</span>)</span>
          </label>
        </div>
        <textarea class="text-form2 form-control" id="reviewContent" name="reviewContent" placeholder="내용을 작성해주세요."></textarea>

        <div class="warning">
          <p class="warning-top mb-2">리뷰 등록 전 반드시 확인해주세요!</p>
          <ul class="list1">
            <li class="question-notice">
              리뷰글 제목은
              <span class="bold">적합한 내용을로 일부 변경</span>될수있습니다
            </li>
            <li class="question-notice">
              게시글의 <span class="bold"> 수정 및 삭제</span>가 불가합니다
            </li>
            <li class="question-notice">
              등록된 리뷰 글은
              <span class="bold">네이버 지식인, 포털 사이트, 로톡 사이트에 내용이 공개</span>
              됩니다.
            </li>
            <li class="question-notice">
              아래 사항에 해당할 경우,
              <span class="bold">서비스 이용이 제한</span>될 수 있습니다.
            </li>
            <li class="question-notice">
              개인정보(개인/법인 실명, 전화번호, 주민번호, 주소, 아이디 등) 및
              외부 링크가 포함된 경우
            </li>
            <div class="notice-wrap">
              <ul class="list1">
                <li class="question-notice2">
                  변호사 선임 및 변호사 선임 비용과 관련된 질문인 경우
                </li>
                <li class="question-notice2">
                  법률 문제 해결을 목적으로 작성한 상담글이 아닌 경우
                </li>
                <li class="question-notice2">
                  동일/유사한 내용의 게시물을 지속적으로 반복 게재하는 경우
                </li>
                <li class="question-notice2">의미없는 문자의 나열인 경우</li>
              </ul>
            </div>
          </ul>
        </div>
        <div class="agree-box">
          <label class="check-agree">
            <input type="checkbox" />&ensp;안내 사항을 모두 확인했으며, 동의합니다.
          </label>
        </div>
        <div class="content d-flex justify-content-center">
          <button onclick="history.go(-1)" class="button button--winona button--border-thick button--round-l button--text-upper button--size-s button--text-thick"
                  type="button" data-text="뒤로가기">
            <span>뒤로가기</span>
          </button>
          <button id="submit-btn" class="button button--winona button--border-thick button--round-l button--text-upper button--size-s button--text-thick"
                  type="button" data-text="작성하기">
            <span>작성하기</span>
          </button>
        </div>
      </div>
    </form>
  </div>

  <!-- footer -->
  <jsp:include page="../common/footer.jsp"/>
</body>
</html>
