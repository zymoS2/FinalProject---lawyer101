<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>상담글 작성 | 법률서비스 101</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" defer></script>
        <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
        <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>

        <link href="../resource/css/common.css" rel="stylesheet">

        <link href="../resource/css/counseling.css" rel="stylesheet">
        <script src="../resource/js/counseling.js" charset="utf-8"></script>

       <!-- jQuery -->
       <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
       <!-- iamport.payment.js -->
       <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-{SDK-최신버전}.js"></script>
       <style>
       ul,ol {
          list-style:none;
          }
       </style>
    </head>
    <body>
    <!-- header -->
    <jsp:include page="../common/header.jsp"/>

    <!-- sidebar -->
    <jsp:include page="../common/sidebar.jsp"/>

        <!-- 프로그레스 -->
        <div class="container" id="main">
            <div class="position-relative mt-5 m-5 mx-auto " id="progressBar">
                <div class="progress" style="height: 1px;">
                    <div class="progress-bar" role="progressbar" aria-label="Progress" style="width: 50%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <button type="button" class="position-absolute top-0 start-0 translate-middle btn btn-sm btn-primary rounded-pill" style="width: 2rem; height:2rem;">1</button>
                <button type="button" class="position-absolute top-0 start-50 translate-middle btn btn-sm btn-primary rounded-pill" style="width: 2rem; height:2rem;">2</button>
                <button type="button" class="position-absolute top-0 start-100 translate-middle btn btn-sm btn-secondary rounded-pill" style="width: 2rem; height:2rem;">3</button>
            </div>

        <!-- 예약페이지 시작. -->
            <h3 class="text-center">상담글 작성</h3>
            <h5 class="text-center mb-5">작성된 상담 내용은 변호사님께 전달되어 상담시 활용됩니다.</h5>
            <form action="#" method="post" name="#" class="mx-auto needs-validation novalidate" id="inputFrm">
                <div class="mb-3">
                    <div id="inputInfo">
                        <label for="exampleFormControlInput1" class="form-label fw-bold">예약자 정보</label>
                        <input type="text" class="form-control mb-3 shadow-sm bg-body-tertiary rounded-rounded" id="exampleFormControlInput1" placeholder="${client.clientName}" readonly>
                        <div style="display : flex;">
                            <div style="width: 45%;">
                                <label for="exampleFormControlInput1" class="form-label fw-bold">예약 날짜</label>
                                <input type="text" class="form-control mb-3 shadow-sm bg-body-tertiary rounded-rounded" id="exampleFormControlInput1" placeholder="${bookingDate}" readonly>
                            </div>
                            <div style="width:10%"></div>
                            <div style="float:right ; width: 45%;">
                                <label for="exampleFormControlInput1" class="form-label fw-bold">예약 시간</label>
                                <input type="text" class="form-control mb-3 shadow-sm bg-body-tertiary rounded-rounded" id="exampleFormControlInput1" placeholder="${bookingTime} 시" readonly>
                            </div>
                        </div>
                        <label for="exampleFormControlInput1" class="form-label fw-bold">휴대폰 인증하기</label>
                        <div class="input-group mb-2">
                            <input type="text" class="form-control shadow-sm bg-body rounded-rounded" id="checkPhoneNuminput" maxlength="13" oninput="checkPhoneNum()">
                            <button type="button" class="btn btn-custom" id="sendMessage" onClick="getToken()" disabled>번호 전송하기</button>
                        </div>
                        <div class="input-group d-flex justify-content-end align-items-end" id="timer" align="right" >
                            <div id="timeLimit" class="me-2">3:00</div>
                            <div style="width: 35%;">
                                <input type="text" class="form-control shadow-sm bg-body rounded-end-0" id="certiNum" >
                            </div>
                            <button disabled id="completion" class="btn btn-custom"  onClick="checkCompletion()">인증 확인</button>
                        </div>
                        <!-- 비동기/정규표현식 -->

                    </div>
                <!-- 모달 -->
                <div class="mt-3 text-end">
                    <a id="question" data-bs-toggle="modal" data-bs-target="#exampleModal">인증번호를 받지 못하셨나요?</a>
                </div>
            </form>
            <div>
            <form method="post">
                <label for="exampleFormControlTextarea1" class="form-label fw-bold">상담 요청 내용</label>
                <textarea name="counselingContent" class="form-control shadow-sm p-3 mb-2 bg-body rounded-rounded" id="exampleFormControlTextarea1" rows="3" onKeyup="counter(this,1500)",placeholder="궁금한 질문과 사건 내용을 작성해주세요."></textarea>
                <span class="d-block text-end" id="reCount">0자/최대 1500자</span>
                <div class="mt-5 d-flex justify-content-between">
                    <button type="button" class="btn btn-custom" onclick="goBack()">뒤로</button>
                    <button type="submit" class="btn btn-custom">제출하기</button>
                </div>
            </form>
            </div>
        </div>
        </div>
        <div class="p-3 bg-body-tertiary mt-5">
            <table class="container mx-auto" style="width: 700px;">
                <tr>
                    <th>작성요령</th>
                </tr>
                <tr>
                    <td>
                        <ul>
                            <li class="small mb-1"><b>사건내용과 질문 위주로 핵심만 </b>간결히 작성해주세요.</li>
                            <li class="small mb-1">가해자 또는 피해자, 원고 또는 피고 중 <b>본인이 어느 쪽인지</b> 알려주세요.</li>
                            <li class="small mb-1"><b>현재 법적 분쟁의 진행상황</b>이 있다면 적어주세요.(고소/고발,소송제기 등)</li>
                            <li class="small mb-1">본인의 <b>주장을 뒷받침할 증거가 있다면</b> 알려주세요.</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <th>유의사항</th>
                </tr>
                <tr>
                    <td>
                    <ul>
                        <li class="small mb-1">예약 완료 후에는 <b>내용 수정이 불가</b>합니다.</li>
                        <li class="small mb-1">다음의 경우는 <b>상담 예약이 취소</b>될 수 있습니다.
                            <ul>
                                <li class="small mb-1">같은 변호사에게 같은 내용의 상담을 반복하는 경우</li>
                                <li class="small mb-1">학술적 의문의 해소, 광고, 브로커제안, 장난 등의 목적인 경우</li>
                                <li class="small mb-1">해당 변호사의 전문 분야가 아닌경우</li>
                            </ul>
                        </li>
                    </ul>
                    </td>
                </tr>
            </table>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel"><b>인증 번호를 받지 못하셨나요? </b></h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body text-center">
                        <strong><span style="color : red">!</span>받지 못하셨다면, 아래 내용을 확인해 주세요.</strong> <br/>
                        <ol class="mt-2">
                            <li>
                                입력된 휴대 전화번호가 정확한지 확인해주세요.
                            </li>
                            <li>
                                스팸 차단 앱에 수신이 차단되어 있는지 확인해주세요.
                            </li>
                        </ol>
                        <hr>
                        위의 방법으로도 문제가 해결되지 않는다면 <br/> 아래 '법률 서비스101' 운영팀으로 연락주세요.<br>
                        <img src="../resource/img/code1.png" style="width:200px;" alt="법률서비스101 qr"/> <br>
                            혹은<br>
                            <h5>고객 센터 번호 : 1566-8282</h5>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-custom" data-bs-dismiss="modal">확인</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- footer -->
        <jsp:include page="../common/footer.jsp"/>

    <script>
        $(".searchForm").hide();
    </script>

    </body>
</html>