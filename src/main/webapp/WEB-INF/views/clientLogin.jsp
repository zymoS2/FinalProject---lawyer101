<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta charset="UTF-8">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" defer></script>

       <title>${client.clientName}로그인 | 법률서비스 101</title>
           <link href="../resource/css/sign-in.css" rel="stylesheet">
           <link href="../resource/css/common.css" rel="stylesheet">

   <script type="text/javascript">

     function clientLogin(){

      document.getElementById('clientLoginForm').setAttribute('action', '/clientLogin/select.do');
      document.getElementById('clientLoginForm').submit();


      }
    </script>
</head>
<body>
<main class="form-signin w-100 m-auto">
              <form action="" id="clientLoginForm"  method="post">
                  <a href="main.html" class="d-inline-block mb-4" style="width: 180px; height: 44px;">
                      <img src="../resource/img/logo.png" alt="로고" width="100%" height="100%">
                  </a>

                  <div class="btn-group" role="group" aria-label="Basic outlined example">
                      <button type="button" class="btn btn-outline-custom btn-outline-info fw-bold rounded-0 w-50 active" style="height: 55px;">로그인</button>
                      <button type="button" class="btn btn-outline-custom btn-outline-info fw-bold rounded-0 w-50" style="height: 55px;">변호사로 로그인</button>
                  </div>

                  <div class="form-floating">
                  <input type="text" class="form-control"  name="clientId">
                  <label for="floatingInput">아이디</label>
                  </div>
                  <div class="form-floating">
                  <input type="password" class="form-control" name="clientPwd" placeholder="Password">
                  <label for="floatingPassword">비밀번호</label>
                  </div>

                  <div class="checkbox mb-3 text-start">
                  <label class="text-body-tertiary fs-6 fw-bold">
                      <input type="checkbox" value="remember-me"> 로그인 상태 유지
                  </label>
                  <div class="float-end">
                      <a href="find-account.html" class="text-body-tertiary fs-6 fw-bold">아이디/비밀번호 찾기</a>
                  </div>
                  </div>
                  <button  type="button" onclick="clientLogin();" class="w-100 btn btn-lg btn-custom">로그인</button>
              </form>

              <hr>

              <div class="sns-login">
                  <div class="sns-login-prov kakao">
                      <a href=""><img src="../resource/img/kakao_login.png" alt="kakao"></a>
                  </div>
                  <div class="sns-login-prov naver">
                      <a href=""><img src="../resource/img/naver_login.png" alt="naver"></a>
                  </div>
              </div>

              <p class="fs-6">아직 회원이 아니신가요? <a href="sign-up-landing.html" class="text-danger">회원가입</a></p>
          </main>
</form>
</body>
</html>
