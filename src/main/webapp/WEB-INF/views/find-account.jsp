<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" defer></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
    <title>아이디/비밀번호 찾기 | 법률서비스 101</title>

    <link href="/resource/css/find-account.css" rel="stylesheet">
    <link href="/resource/css/common.css" rel="stylesheet">
    <script src="/resource/js/find-account.js"></script>

</head>
<body>
    <body class="bg-body-tertiary">
        <main class="container" style="max-width: 550px">

            <h2 class="py-5 border-bottom text-center">아이디/비밀번호 찾기</h2>

            <form id="findIdForm">
                <label for="find-id-email" class="fw-bold mt-4 mb-2">아이디 찾기</label>
                <div class="form-group py-3 px-4 bg-white border">
                    <small id="findIdHelp" class="d-block form-text text-muted py-4">가입 시 등록하신 이메일을 입력하세요. <br> 이메일로 아이디를 알려드립니다.</small>
                    <input id="find-id-email" type="text" name="findIdEmail" class="form-control" placeholder="이메일을 입력하세요" required>
                    <p class="form-text text-danger" id="email-errorMsg"></p>
                </div>
                <div class="bg-custom text-center">
                    <button type="button" class="btn py-3 fw-bold text-white" id="find-email-btn">[이메일 받기]</button>
                </div>
            </form>

            <form action="/auth/find-account/reset-pwd" method="post" id="resetPwdForm">
                <label for="reset-pwd-id" class="fw-bold mt-4 mb-2">비밀번호 찾기</label>
                <div class="form-group py-3 px-4 bg-white border">
                    <small id="findPwdHelp" class="d-block form-text text-muted py-4">가입 시 등록하신 아이디와 이메일을 입력하세요. <br> 비밀번호 재설정 이메일을 보내드립니다.</small>

                    <input id="reset-pwd-id" type="text" name="resetPwdId" class="form-control" placeholder="아이디를 입력하세요" required>
                    <p class="form-text text-danger" id="id-errorMsg"></p>

                    <input id="reset-pwd-email" type="text" name="resetPwdEmail" class="form-control" placeholder="이메일을 입력하세요" required>
                    <p class="form-text text-danger" id="email-errorMsg2"></p>
                </div>
                <div class="bg-custom text-center">
                    <button type="button" class="btn py-3 fw-bold text-white" id="reset-pwd-btn">[이메일 받기]</button>
                </div>
            </form>

            <div class="text-center mt-3">
                <a href="/clientLogin" class="fs-6 text-body-tertiary fw-bold me-2">로그인</a>
                <a href="/joinOption" class="fs-6 text-body-tertiary fw-bold ms-2">회원가입</a>
            </div>
        </main>
    </body>
</body>
</html>