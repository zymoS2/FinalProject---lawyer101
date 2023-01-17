<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
 <meta charset="UTF-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">

     <title>지식IN 글쓰기</title>

     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" defer></script>

     <link href="../resource/css/headers.css" rel="stylesheet">
     <link href="../resource/css/sidebars.css" rel="stylesheet">
     <link href="../resource/css/footer.css" rel="stylesheet">
     <link href="../resource/css/common.css" rel="stylesheet">

    <link rel="stylesheet" href="../resource/css/in_post.css">

    <script type="text/javascript">
        function knowledgeInPost(){
            if(confirm('등록 하시겠습니까?')){

            var title = document.getElementsByName('inBoardTitle')[0].value;
            var content = document.getElementsByName('inBoardContent')[0].value;
            var category = document.getElementsByName('categoryNum')[0].value;

            if(title == null || title.length == 0) {
                alert('제목을 입력하세요');
                return;
            }
             if(content == null || content.length == 0) {
                 alert('내용을 입력하세요');
                 return;
             }

             if(category == null || category.length == 0) {
                 alert('카테고리를 선택하세요');
                 return;
             }

            document.getElementById('knowledgeInPostForm').setAttribute('action', '/knowledgeInPost/insert.do');
            document.getElementById('knowledgeInPostForm').submit();

             }
        }
    </script>

</head>
<body>
<div id="counselWriteDiv" class="container">
        <h3 id="counselWriteh1" class="text-center">지식IN 글쓰기</h3>
        <form class="mx-auto" action="" id="knowledgeInPostForm"  method="post">
            <h5 id="counselWriteh2" class="fw-bold">상담글을 작성하고<br><span class="text-custom">무료로</span> 변호사의 답변을 받으세요</h5>
            <div class="counselWriteTable mt-5">
                <div class="form-group mb-4">
                    <label class="form-label fw-bold">제목 <span class="text-secondary">(10자 이상*)</span></label>
                    <input type="text"  name="inBoardTitle" class="form-control" placeholder="제목을 작성해주세요">
                </div>
                <div class="form-group mb-4">
                    <label class="form-label fw-bold">카테고리</label>
                    <select name="categoryNum" class="form-select">
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
                </div>
                <div class="form-group mb-4">
                    <label class="form-label fw-bold">내용 <span class="text-secondary">(200자 이상*)</span></label>
                    <textarea name="inBoardContent" class="form-control p-3" rows="10" placeholder="내용을 작성해주세요"></textarea>
                </div>
            </div>
            <hr>
            <div class="counselWriteDivin my-4">
                <h3 id="counselWriteh3" class="fs-6 fw-bold">상담글 등록전 반드시 확인해주세요!</h3>
                <ul class="counselWriteUl small text-secondary">
                    <li class="small mt-1">상담글 제목은 <b>답변을 받기에 적합한 내용으로 일부 변경</b>될 수 있습니다.</li>
                    <li class="small mt-1">상담글에 변호사의 <b>답변 등록 시 글 삭제가 불가</b>합니다.</li>
                    <li class="small mt-1">등록된 글은 <b>네이버지식인, 포털사이트, 로톡 사이트에 내용이 공개</b>됩니다.</li>
                    <li class="small mt-1">아래 사항에 해당할 경우 <b>서비스 이용이 제한</b>될 수 있습니다.
                        <ul class="counselWriteUlIn">
                            <li m>개인정보(개인/법인 실명, 전화번호, 주민번호, 주소, 아이디 등) 및 외부 링크가 포함된 경우</li>
                            <li m>변호사 선임 및 변호사 선임 비용과 관련된 질문인 경우</li>
                            <li m>법률 문제 해결을 목적으로 작성한 상담글이 아닌 경우</li>
                            <li m>동일/유사한 내용의 게시물을 지속적으로 반복 게재하는 경우</li>
                            <li m>의미없는 문자의 나열인 경우</li>
                        </ul>
                    </li>
                </ul>
                <label id="agreement">
                    <input type="checkbox" name="" id=""> 안내사항을 모두 확인했으며, 동의합니다.
                </label>
            </div>

            <button type="button" onclick="knowledgeInPost();" class="btn btn-custom w-100" >상담글 등록하기</button>

        </form>
    </div>
</body>
</html>
