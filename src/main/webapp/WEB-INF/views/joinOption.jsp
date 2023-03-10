<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
     <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" defer></script>
        <title>회원가입 | 법률서비스 101</title>

        <link href="../resource/css/features.css" rel="stylesheet">
        <link href="../resource/css/sign-up.css" rel="stylesheet">
        <link href="../resource/css/common.css" rel="stylesheet">

</head>
<body>
    <main>
        <form action="" id="joinOptionForm"  method="post">
            <div class="container px-4 py-5 text-center" id="hanging-icons">
                <h2 class="pb-5 border-bottom">회원 가입</h2>
                <div class="row g-4 py-5 row-cols-1 row-cols-lg-3 justify-content-md-center">
                    <div class="col d-flex align-items-start">
                    <div class="px-5 rounded-2 d-flex flex-column justify-content-md-center bg-white" style="height: 500px;">
                        <h3 class="fs-3 p-2"><b class="d-inline-block bg-warning">의뢰인</b>이신가요?</h3>
                        <p class="p-2">법률서비스101 이천여 명 변호사님들 중 나에게 꼭 맞는 변호사를 찾아보세요.</p>
                        <a href="/clientJoin" class="btn btn-custom p-2">
                        의뢰인으로 가입하기
                        </a>
                    </div>
                    </div>
                    <div class="col d-flex align-items-start">
                    <div class="px-5 rounded-2 d-flex flex-column justify-content-md-center bg-white" style="height: 500px;">
                        <h3 class="fs-3 p-2"><b class="d-inline-block bg-warning">변호사</b>이신가요?</h3>
                        <p class="p-2">법률서비스101의 좋은 변호사가 되어
                            자신있는 분야의 의뢰인들을 만나보세요.</p>
                        <a href="/lawyerJoin" class="btn btn-custom p-2">
                        변호사로 가입하기
                        </a>
                    </div>
                    </div>
                </div>
                <div class="text-center">
                    <a href="clientLogin" class="fs-6 text-body-tertiary fw-bold">로그인</a>
                </div>
            </div>
        </form>
    </main>
</body>
</html>
