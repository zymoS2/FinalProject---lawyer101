<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
  <link href="/resource/css/headers.css" rel="stylesheet" />
  <script src="/resource/js/header.js"></script>
</head>
<header class="p-2 top-0 position-relative z-3">
  <div class="container h-100">
    <button class="bg-transparent border-0 text-secondary float-start headerButton">
      <svg xmlns="http://www.w3.org/2000/svg" width="44" height="44" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
        <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
      </svg>
    </button>

    <div class="nav d-inline-block float-end mt-2">
      <c:choose>
        <c:when test="${!empty client}">
          <a href="/clientLogout" class="me-3 text-secondary fw-bold"><small>로그아웃</small></a>
          <a href="/mypage/${client.clientNum}" class="me-3 text-secondary fw-bold"><small>마이페이지</small></a>
        </c:when>
        <c:when test="${!empty lawyer}">
          <a href="/lawyerLogout" class="me-3 text-secondary fw-bold"><small>로그아웃</small></a>
          <a href="/lawyerpage/info/${lawyer.lawyerNum}" class="me-3 text-secondary fw-bold"><small>마이페이지</small></a>
        </c:when>
        <c:otherwise>
          <a href="/clientLogin" class="me-3 text-secondary fw-bold"><small>로그인</small></a>
          <a href="/joinOption" class="me-3 text-secondary fw-bold"><small>회원가입</small></a>
        </c:otherwise>
      </c:choose>
      <a href="/product/list" class="fw-bold position-relative"><small>변호사찾기</small>
        <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="bi bi-search position-absolute bottom-0" viewBox="0 0 16 16">
          <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
        </svg>
      </a>
    </div>

    <div class="mx-auto mt-1" style="width: 236px">
      <a href="/" class="d-inline-block" style="width: 236px; height: 64px">
        <img src="/resource/img/logo.png" alt="로고" width="100%" height="100%"/>
      </a>
    </div>

    <form action="/product/list" method="get" class="mx-auto mt-4 position-relative searchForm" role="search" style="width: 50%">
      <div class="searchFormDiv">
        <input type="hidden" name="pageNum" value="1">
        <input type="search" name="keyword" class="form-control form-control-lg pe-5 fw-bold searchFormInput"
               placeholder="분야/사례/변호사를 검색하세요" aria-label="Search" value="${keyword}"/>
        <button type="button" class="bg-transparent border-0 me-2 text-secondary position-absolute end-0 top-50 translate-middle-y searchFormButton">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
          </svg>
        </button>
      </div>
    </form>
  </div>
</header>
