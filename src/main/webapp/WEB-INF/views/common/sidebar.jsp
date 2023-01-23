<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
  <link href="/resource/css/sidebars.css" rel="stylesheet" />
  <script src="/resource/js/sidebars.js"></script>
</head>
<div class="sidebar h-100 w-100 position-fixed top-0 start-0">
  <div class="w-100 h-100 top-0 end-0 position-absolute bg-black sidebarOpacity" style="z-index: 201"></div>

  <nav class="sidebar-container vh-100 position-absolute top-0 start-0 bg-white" style="width: 320px; z-index: 203">
    <div class="d-flex flex-column flex-shrink-0 p-3" style="height: 100%">
      <div class="text-end">
        <button class="btn bg-transparent text-secondary border-0 sidebarButton">
          <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
            <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
          </svg>
        </button>
      </div>
      <a href="main.html" class="my-3 mb-md-0 mx-auto" style="width: 180px; height: 44px">
        <img src="../resource/img/logo.png" alt="로고" width="100%" height="100%"/>
      </a>
      <hr />
      <ul class="nav nav-pills flex-column">
        <li class="nav-item">
          <a href="#" class="nav-link text-secondary" aria-current="page">
            <svg class="bi pe-none me-2" width="16" height="16">
              <use xlink:href="#home" />
            </svg>
            변호사 찾기
          </a>
        </li>
        <li>
          <a href="/knowledgeIn" class="nav-link text-secondary">
            <svg class="bi pe-none me-2" width="16" height="16">
              <use xlink:href="#table" />
            </svg>
            법률 지식IN
          </a>
        </li>
        <li>
          <a href="counsel.html" class="nav-link text-secondary">
            <svg class="bi pe-none me-2" width="16" height="16">
              <use xlink:href="#table" />
            </svg>
            오픈 채팅 상담
          </a>
        </li>
      </ul>
      <hr />
      <a href="" class="d-flex justify-content-between fw-bold">
        <div>
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
            <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
          </svg>
          <span class="small"> 지식IN 글쓰기 </span>
        </div>
        <div>
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
          </svg>
        </div>
      </a>
      <hr />
      <ul class="nav nav-pills flex-column mb-auto">
        <a href="#" class="nav-link text-secondary" style="font-size: 14px !important">
          <svg class="bi pe-none me-2" width="16" height="16">
            <use xlink:href="#table" />
          </svg>
          공지사항
        </a>
        <a href="#" class="nav-link text-secondary" style="font-size: 14px !important">
          <svg class="bi pe-none me-2" width="16" height="16">
            <use xlink:href="#table" />
          </svg>
          이용약관
        </a>
        <a href="#"
                class="nav-link text-secondary"
                style="font-size: 14px !important"
        >
          <svg class="bi pe-none me-2" width="16" height="16">
            <use xlink:href="#table" />
          </svg>
          개인정보처리방침
        </a>
        <a href="#" class="nav-link text-secondary" style="font-size: 14px !important">
          <svg class="bi pe-none me-2" width="16" height="16">
            <use xlink:href="#table" />
          </svg>
          회사소개
        </a>
        <a href="#" class="nav-link text-secondary" style="font-size: 14px !important">
          <svg class="bi pe-none me-2" width="16" height="16">
            <use xlink:href="#table" />
          </svg>
          로톡이야기
        </a>
      </ul>
    </div>
    <div class="dropdown bg-custom position-absolute bottom-0 start-0 w-100 p-3 text-end">
      <!-- login -->
      <div>
        <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
          <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2"/>
          <strong>mdo</strong>
        </a>
        <ul class="dropdown-menu text-small shadow">
          <li>
            <a class="dropdown-item" href="myPage.html">마이페이지</a>
          </li>
          <li>
            <a class="dropdown-item" href="chatList.html">상담 목록</a>
          </li>
          <li><hr class="dropdown-divider" /></li>
          <li><a class="dropdown-item" href="login.html">로그아웃</a></li>
        </ul>
      </div>

      <!-- logout -->
      <!-- <div class="d-inline-block mt-2">
                    <a href="login.html" class="me-3 text-white fw-bold"><small>로그인</small></a>
                    <a href="sign-up-landing.html" class="me-3 text-white fw-bold"><small>회원가입</small></a>
                </div> -->
    </div>
  </nav>
</div>
