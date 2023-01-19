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
     function lawyerLogin(){
         if(confirm('로그인 하시겠습니까?')){
              var id =  document.getElementsByName('lawyerId')[0].value;
              var pwd =  document.getElementsByName('lawyerPwd')[0].value;

              if(id == null || id.length == 0){
                  alert('아이디를 입력하세요');
                   return;
              }
              if(pwd == null || pwd.length == 0){
                  alert('비밀번호를 입력하세요');
                   return;
              }
              document.getElementById('lawyerLoginForm').setAttribute('action', '/lawyerLogin/select.do');
              document.getElementById('lawyerLoginForm').submit();
         }
     }
    </script>
</head>
<body>
<main class="form-signin w-100 m-auto">
              <form action="" id="lawyerLoginForm"  method="post">
                  <a href="/" class="d-inline-block mb-4" style="width: 180px; height: 44px;">
                      <img src="../resource/img/logo.png" alt="로고" width="100%" height="100%">
                  </a>

                  <div class="btn-group" role="group" aria-label="Basic outlined example">
                      <button type="button" onclick="location.href='/clientLogin'" class="btn btn-outline-custom btn-outline-info fw-bold rounded-0 w-50" style="height: 55px;">로그인</button>
                      <button type="button" class="btn btn-outline-custom btn-outline-info fw-bold rounded-0 w-50 active"  style="height: 55px;">변호사로 로그인</button>
                  </div>

                  <div class="form-floating">
                  <input type="text" class="form-control"  name="lawyerId">
                  <label for="floatingInput">아이디</label>
                  </div>
                  <div class="form-floating">
                  <input type="password" class="form-control" name="lawyerPwd" placeholder="Password">
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
                  <button  type="button" onclick="lawyerLogin();" class="w-100 btn btn-lg btn-custom">로그인</button>
              </form>

              <hr>

              <p class="fs-6">아직 회원이 아니신가요? <a href="/joinOption" class="text-danger">회원가입</a></p>
          </main>
</form>
</body>
</html>
