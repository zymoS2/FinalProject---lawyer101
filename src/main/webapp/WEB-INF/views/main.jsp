<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>법률서비스 101</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
    <link href="/resource/css/common.css" rel="stylesheet" />

    <link href="/resource/css/list.css" rel="stylesheet" />
    <link href="/resource/css/features.css" rel="stylesheet" />
    <link href="/resource/css/main.css" rel="stylesheet" />
    <script src="/resource/js/main.js"></script>
  </head>
  <body>
    <!-- header -->
    <jsp:include page="common/header.jsp"/>

    <!-- sidebar -->
    <jsp:include page="common/sidebar.jsp"/>

    <!-- 광고 -->
    <div class="container" style="height: 500px">
      <div id="carouselExampleCaptions" class="carousel slide h-100" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
                  aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                  aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
                  aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner h-100">
          <div class="carousel-item active h-100">
            <img src="/resource/img/주먹은법보다빠르다.jpg" class="d-block w-100 h-100 object-fit-cover" 50lt="..." />
            <div class="carousel-caption d-none d-md-block">
              <h1 class="fw-bold" style="font-size: 50px">주먹은 법보다 빠르다</h1>
              <p class="fw-bold" style="font-size: 24px">
                멘트는 너가 짜
              </p>
            </div>
          </div>
          <div class="carousel-item h-100">
            <img src="/resource/img/sample1.jpg" class="d-block w-100 h-100 object-fit-cover" 50lt="..." />
            <div class="carousel-caption d-none d-md-block">
              <h5>Second slide label</h5>
              <p>
                Some representative placeholder content for the second slide.
              </p>
            </div>
          </div>
          <div class="carousel-item h-100">
            <img src="/resource/img/sample1.jpg" class="d-block w-100 h-100 object-fit-cover" 50lt="..." />
            <div class="carousel-caption d-none d-md-block">
              <h5>Third slide label</h5>
              <p>
                Some representative placeholder content for the third slide.
              </p>
            </div>
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
                data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
                data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
    </div>

    <!-- 카테고리 -->
    <div class="container px-4 py-5" id="icon-grid">
      <h2 class="pb-2 border-bottom fw-bold fs-3">분야로 변호사를 찾으세요.</h2>

      <div class="category row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-6 g-4 py-3">
        <a href="/product/list?keyword=성범죄">
          <div class="col d-flex align-items-start justify-content-center">
            <div>
              <img src="/resource/img/성범죄.png" alt="성범죄" class="rounded mx-auto d-block object-fit-contain"
                   width="50px;" height="50px" />
              <h3 class="fw-bold mt-2 fs-5 text-center">성범죄</h3>
            </div>
          </div>
        </a>
        <a href="/product/list?keyword=재산범죄">
          <div class="col d-flex align-items-start justify-content-center">
            <div>
              <img src="/resource/img/재산범죄.png" alt="재산범죄" class="rounded mx-auto d-block object-fit-contain"
                   width="50px" height="50px" />
              <h3 class="fw-bold mt-2 fs-5 text-center">재산범죄</h3>
            </div>
          </div>
        </a>
        <a href="/product/list?keyword=교통사고/범죄">
          <div class="col d-flex align-items-start justify-content-center">
            <div>
              <img src="/resource/img/교통사고_범죄.png" alt="교통사고/범죄" class="rounded mx-auto d-block object-fit-contain"
                   width="50px" height="50px" />
              <h3 class="fw-bold mt-2 fs-5 text-center">교통사고/범죄</h3>
            </div>
          </div>
        </a>
        <a href="/product/list?keyword=형사절차">
          <div class="col d-flex align-items-start justify-content-center">
            <div>
              <img src="/resource/img/형사절차.png" alt="형사절차" class="rounded mx-auto d-block object-fit-contain"
                   width="50px" height="50px" />
              <h3 class="fw-bold mt-2 fs-5 text-center">형사절차</h3>
            </div>
          </div>
        </a>
        <a href="/product/list?keyword=폭행/협박">
          <div class="col d-flex align-items-start justify-content-center">
            <div>
              <img src="/resource/img/폭행_협박.png" alt="폭행/협박" class="rounded mx-auto d-block object-fit-contain"
                   width="50px" height="50px" />
              <h3 class="fw-bold mt-2 fs-5 text-center">폭행/협박</h3>
            </div>
          </div>
        </a>
        <a href="/product/list?keyword=명예훼손/모욕">
          <div class="col d-flex align-items-start justify-content-center">
            <div>
              <img src="/resource/img/명예훼손_모욕.png" alt="명예훼손/모욕" class="rounded mx-auto d-block object-fit-contain"
                   width="50px" height="50px" />
              <h3 class="fw-bold mt-2 fs-5 text-center">명예훼손/모욕</h3>
            </div>
          </div>
        </a>
        <a href="/product/list?keyword=기타 형사범죄">
          <div class="col d-flex align-items-start justify-content-center">
            <div>
              <img src="/resource/img/기타형사범죄.png" alt="기타 형사범죄" class="rounded mx-auto d-block object-fit-contain"
                   width="50px" height="50px" />
              <h3 class="fw-bold mt-2 fs-5 text-center">기타 형사범죄</h3>
            </div>
          </div>
        </a>
        <a href="/product/list?keyword=부동산/임대차">
          <div class="col d-flex align-items-start justify-content-center">
            <div>
              <img src="/resource/img/부동산_임대차.png" alt="부동산/임대차" class="rounded mx-auto d-block object-fit-contain"
                   width="50px" height="50px" />
              <h3 class="fw-bold mt-2 fs-5 text-center">부동산/임대차</h3>
            </div>
          </div>
        </a>
        <a href="/product/list?keyword=금전/계약 문제">
          <div class="col d-flex align-items-start justify-content-center">
            <div>
              <img src="/resource/img/금전_계약문제.png" alt="금전/계약 문제" class="rounded mx-auto d-block object-fit-contain"
                   width="50px" height="50px" />
              <h3 class="fw-bold mt-2 fs-5 text-center">금전/계약 문제</h3>
            </div>
          </div>
        </a>
        <a href="/product/list?keyword=민사절차">
          <div class="col d-flex align-items-start justify-content-center">
            <div>
              <img src="/resource/img/민사절차.png" alt="민사절차" class="rounded mx-auto d-block object-fit-contain"
                   width="50px" height="50px" />
              <h3 class="fw-bold mt-2 fs-5 text-center">민사절차</h3>
            </div>
          </div>
        </a>
        <a href="/product/list?keyword=기타 민사문제">
          <div class="col d-flex align-items-start justify-content-center">
            <div>
              <img src="/resource/img/기타민사문제.png" alt="기타 민사문제" class="rounded mx-auto d-block object-fit-contain"
                   width="50px" height="50px" />
              <h3 class="fw-bold mt-2 fs-5 text-center">기타 민사문제</h3>
            </div>
          </div>
        </a>
        <a href="/product/list?keyword=가족">
          <div class="col d-flex align-items-start justify-content-center">
            <div>
              <img src="/resource/img/가족.png" alt="가족" class="rounded mx-auto d-block object-fit-contain" width="50px"
                   height="50px" />
              <h3 class="fw-bold mt-2 fs-5 text-center">가족</h3>
            </div>
          </div>
        </a>
        <a href="/product/list?keyword=회사">
          <div class="col d-flex align-items-start justify-content-center">
            <div>
              <img src="/resource/img/회사.png" alt="회사" class="rounded mx-auto d-block object-fit-contain" width="50px"
                   height="50px" />
              <h3 class="fw-bold mt-2 fs-5 text-center">회사</h3>
            </div>
          </div>
        </a>
        <a href="/product/list?keyword=의료/세금/행정">
          <div class="col d-flex align-items-start justify-content-center">
            <div>
              <img src="/resource/img/의료_세금_행정.png" alt="의료/세금/행정" class="rounded mx-auto d-block object-fit-contain"
                   width="50px" height="50px" />
              <h3 class="fw-bold mt-2 fs-5 text-center">의료/세금/행정</h3>
            </div>
          </div>
        </a>
        <a href="/product/list?keyword=IT/지식재산/금융">
          <div class="col d-flex align-items-start justify-content-center">
            <div>
              <img src="/resource/img/it_지식재산_금융.png" alt="IT/지식재산/금융"
                   class="rounded mx-auto d-block object-fit-contain" width="50px" height="50px" />
              <h3 class="fw-bold mt-2 fs-5 text-center">IT/지식재산/금융</h3>
            </div>
          </div>
        </a>
      </div>
    </div>

    <!-- 뉴스 -->
    <div class="container px-4 py-5" id="custom-cards">
      <h2 class="pb-2 border-bottom fw-bold fs-3">법률 지식IN</h2>
      <div class="text-end mt-4 mb-2">
        <a href="/knowledgeIn" class="text-custom">전체보기</a>
      </div>
      <div class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-2">
        <c:forEach var="inBoard" items="${inBoardList}" begin="0" end="2">
          <div class="col">
            <a href="/knowledgeInDetail?num=${inBoard.inBoardNum}">
              <div class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 shadow-lg"
                   style="background-image: url('unsplash-photo-1.jpg')">
                <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
                  <h3 class="pt-3 mt-5 mb-4 display-6 lh-1 fw-bold">
                    ${inBoard.inBoardTitle}
                  </h3>
                  <ul class="d-flex list-unstyled mt-auto">
                    <li class="me-auto"></li>
                    <li class="d-flex align-items-center me-3">
                      <svg class="bi me-2" width="1em" height="1em">
                        <use xlink:href="#geo-fill" />
                      </svg>
                      <small>${inBoard.categoryVo.categoryName}</small>
                    </li>
                    <li class="d-flex align-items-center">
                      <svg class="bi me-2" width="1em" height="1em">
                        <use xlink:href="#calendar3" />
                      </svg>
                      <small>조회수 ${inBoard.inBoardCount}</small>
                    </li>
                  </ul>
                </div>
              </div>
            </a>
          </div>
        </c:forEach>
      </div>
    </div>

    <hr />

    <!-- footer -->
    <jsp:include page="common/footer.jsp"/>
  </body>
</html>
