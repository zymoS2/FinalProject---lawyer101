<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지 | 법률서비스 101</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>

    <link href="/resource/css/common.css" rel="stylesheet" />
    <script src="/resource/js/myPage.js"></script>
</head>
<body>
    <!-- header -->
    <jsp:include page="../../common/header.jsp"/>

    <!-- sidebar -->
    <jsp:include page="../../common/sidebar.jsp"/>

    <div class="container px-4 py-5">
        <h2 class="pb-5 text-center">마이페이지</h2>
        <div class="w-50 mx-auto p-5 border border-5 rounded mb-5">
            <div class="d-flex justify-content-center">
                 <a href="chatList.html" class="text-center" style="width: 184px;">
                    <p class="small fw-bold text-secondary mb-1">의뢰인 목록</p>
                    <p class="fs-2 fw-bold text-secondary">0</p>
                </a>
            </div>
        </div>
        
        <div class="mx-auto w-50">
            <h5 class="fw-bold mb-3">개인정보 수정</h5>
            <form action="/lawyer/myPage/info/${lawyer.lawyerNum}" method="post" class="border border-5 rounded p-4 mb-4" id="info-edit-form">
                <div class="form-group">
                    <label for="email" class="mb-1">이메일</label>
                    <input type="text" name="lawyerEmail" id="email" value="${lawyer.lawyerEmail}" class="form-control border-1">
                    <p class="text-danger" id="email-errorMsg"></p>
                </div>
                <div class="form-group">
                    <label for="id" class="mb-1">아이디</label>
                    <input type="text" name="lawyerId" id="id" value="${lawyer.lawyerId}" class="form-control border-1" readonly disabled>
                </div>
                <div class="form-group">
                    <label for="name" class="mb-1">이름</label>
                    <input type="text" name="lawyerName" id="name" value="${lawyer.lawyerName}" class="form-control border-1">
                    <p class="text-danger" id="name-errorMsg"></p>
                </div>
                
                <div class="bg-custom text-center">
                    <button type="button" class="btn py-3 fw-bold text-white" id="info-submit-btn">[ 저장 ]</button>
                </div>
            </form>
        </div>

        <div class="mx-auto w-50">
            <h5 class="fw-bold mb-3">프로필</h5>
            <form action="/lawyer/myPage/profile/${lawyer.lawyerNum}" method="post" enctype="multipart/form-data" class="border border-5 rounded p-4 mb-4" id="profile-form">

                <div class="mx-auto" style="width: 100px; height: 100px; object-fit: cover; cursor: pointer" id="profile-image-box">
                    <img src="/display?fileName=${lawyer.lawyerImg}" onerror="this.src='/resource/img/profile.png';" class="rounded-circle"
                         accept="image/jpg, image/jpeg, image/png" width="100%" height="100%" id="profile-image">
                </div>
                <input type="file" name="profileImage" class="d-none" id="profile-image-input">

                <div class="form-group">
                    <label for="intro" class="mb-1">소개</label>
                    <input type="text" name="lawyerIntroMsg" id="intro" value="${lawyer.lawyerIntroMsg}" class="form-control border-1">
                    <p class="text-danger" id="intro-errorMsg"></p>
                </div>
                <div class="form-group">
                    <label for="category" class="mb-1">분야</label>
                    <select name="categoryNum" id="category" class="form-select border-1">
                        <option value="" disabled selected style="display: none;">선택</option>
                        <option value="1">성범죄</option>
                        <option value="2">재산범죄</option>
                        <option value="3">교통사고/범죄</option>
                        <option value="4">형사절차</option>
                        <option value="5">폭행/협박</option>
                        <option value="6">명예훼손/모욕</option>
                        <option value="7">기타 형사범죄</option>
                        <option value="8">부동산/임대차</option>
                        <option value="9">금전/계약 문제</option>
                        <option value="10">민사절차</option>
                        <option value="11">기타 민사문제</option>
                        <option value="12">가족</option>
                        <option value="13">회사</option>
                        <option value="14">의료/세금/행정</option>
                        <option value="15">IT/지식재산/금융</option>
                    </select>
                    <p class="text-danger" id="category-errorMsg"></p>
                </div>
                <div class="form-group">
                    <label for="intro" class="mb-1">대표사진 등록</label>
                    <input type="file" name="mainImage" class="form-control border-1" id="main-image-input">
                    <p></p>
                </div>
                <div>
                    <label class="form-label d-block">대표사진</label>
                    <c:choose>
                        <c:when test="${lawyer.lawyerMainImg == null or lawyer.lawyerMainImg == ''}">
                            <p class="text-danger">현재 등록된 이미지가 없습니다.</p>
                        </c:when>
                        <c:otherwise>
                            <div class="d-inline-block border border-4" style="width: 354px; height: 457px">
                                <img src="/display?fileName=${lawyer.lawyerMainImg}" width="100%" height="100%" style="object-fit: cover">
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="bg-custom text-center mt-3">
                    <button type="button" class="btn py-3 fw-bold text-white" id="profile-submit-btn">[ 저장 ]</button>
                </div>
            </form>
        </div>

    </div>

    <!-- footer -->
    <jsp:include page="../../common/footer.jsp"/>

    <script>
        $("#category option").each(function () {
            if ($(this).val() == ${lawyer.categoryVo.categoryNum}) {
                $(this).attr("selected","selected");
            }
        });

    </script>
</body>
</html>