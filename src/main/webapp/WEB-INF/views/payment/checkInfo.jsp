<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>결제 정보 확인 | 법률서비스 101</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" defer></script>

        <link href="/resource/css//headers.css" rel="stylesheet">
        <link href="/resource/css/sidebars.css" rel="stylesheet">
        <link href="/resource/css/footer.css" rel="stylesheet">
        <link href="/resource/css/common.css" rel="stylesheet">

        <link href="/resource/css/checkInfo.css" rel="stylesheet">
        <script src="/resource/js/checkInfo.js"> </script>
            <!-- jQuery -->
            <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
            <!-- iamport.payment.js -->
            <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

    </head>
    <body>
        <!-- header -->
        <jsp:include page="../common/header.jsp"/>

        <!-- sidebar -->
        <jsp:include page="../common/sidebar.jsp"/>

        <!-- main -->
        <div>
            <form action="#" method="#" name="#">
            <div class="container" id="main">
                <div class="position-relative mt-5 m-5 mx-auto " id="progressBar">
                    <div class="progress" style="height: 1px;">
                    <div class="progress-bar" role="progressbar" aria-label="Progress" style="width: 100%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <button type="button" class="position-absolute top-0 start-0 translate-middle btn btn-sm btn-primary rounded-pill" style="width: 2rem; height:2rem;">1</button>
                    <button type="button" class="position-absolute top-0 start-50 translate-middle btn btn-sm btn-primary rounded-pill" style="width: 2rem; height:2rem;">2</button>
                    <button type="button" class="position-absolute top-0 start-100 translate-middle btn btn-sm btn-primary rounded-pill" style="width: 2rem; height:2rem;">3</button>
                </div>
                    <h3 class="text-center">결제 정보 확인</h3>
                    <h5 class="text-center mb-5">정보를 확인하고 결제를 버튼을 눌러주세요.</h5>
                    <nav id="navbar-example2" class="navbar bg-light px-3 mb-3">
                        <ul class="nav nav-pills">
                        <li class="nav-item">
                            <a class="nav-link" href="#scrollspyHeading1">상담 정보</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#scrollspyHeading2">결제 수단</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#scrollspyHeading3">결제 정보</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#scrollspyHeading4">약관 동의</a>
                        </li>
                        </ul>
                    </nav>
                    <div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="scrollspy-example bg-light p-3 rounded-2" tabindex="0">
                        <div class="m-4">
                            <h4 id="scrollspyHeading1" class="fs-5"><b>상담 정보</b></h4>
                            <table id="table1" class="w-50">
                                <tr>
                                    <th style="width: 30%" >변호사</th>
                                    <td> ${lawyerName} </td>
                                </tr>
                                <tr>
                                    <th style="width: 30%">상담 날짜</th>
                                    <td> ${bookingDate} </td>
                                </tr>
                                <tr>
                                    <th style="width: 30%">상담 종류</th>
                                    <td>${categoryName} </td>
                                </tr>
                            </table>
                        </div>
                        <hr>
                        <div class="m-4">
                            <h4 id="scrollspyHeading2" class="fs-5"><b>결제 수단</b></h4>
                                <ul>
                                    <li>
                                        <label class="form-label">
                                            <input class="form-check-input" type="radio" name="payment" value="card" checked> &nbsp; 신용카드/체크카드
                                        </label>
                                    </li>
                                    <li>
                                        <label class="form-label">
                                            <input class="form-check-input" type="radio" name="payment" value="kakaopay" > &nbsp; 카카오 페이 결제
                                        </label>
                                    </li>
                                </ul>
                        </div>
                        <hr>
                        <div class="m-4">
                            <h4 id="scrollspyHeading3" class="fs-5 mb-3"><b>결제 정보</b></h4>
                            <h5 class="mb-3">상담료 <span style="background : #ffe900"><b>50,000원</b></span></h5>
                            <p class="small mb-2 text-secondary">
                            <strong>법률 서비스 101에서 지정한 1회 법적 자문 비용은 50,000원으로, 모든 변호사의 상담료는 동일합니다.<br></strong>
                            변호사의 법률 자문 이후 계약서 검토, 자문, 소송 등 추가적인 법률 서비스는 <strong>추가 상담료가 발생</strong>할 수 있습니다.<br>
                            추가적인 법률 서비스는 담당 변호사와 진행되고, 추가 자문 제공 및 상담료에 있어,  <strong>법률 서비스101 측 과는 무관 </strong>합니다.<br><br>
                            예약 날짜는 <Strong>마이페이지에서 확인</strong> 할 수 있습니다.<br>
                            <strong>변호사 사정</strong> 으로 상담을 하지 못한 경우에는 <strong>100% 환불</strong> 해드립니다.<br/>
                            <strong>의뢰인 사정</strong> 으로 상담을 하지 못한 경우 또는 상담이 이루어진 경우에는 <strong>환불해드리지 않습니다.</strong><br/>
                            </p>
                        </div>
                        <hr>
                        <div class="m-4">
                            <h4 id="scrollspyHeading4" class="fs-5"><b>약관 동의</b></h4>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" onClick="btnActive(this.form)">
                                <label class="form-check-label" for="flexCheckDefault">
                                    <p class="mb-2">아래 약관에 동의 합니다.</p>
                                </label>
                            <p class="small text-secondary">
                                '법률 서비스101' 은 예약 및 결제 정보의 중개서비스 또는 통신판매중개 시스템을 제공할 뿐 통신판매의 당사자가 아니며, 변호사가 제공하는 법률상담의 내용과 질에 대해서 법적 책임이 없음에 동의합니다.<br/>
                                    변호사와의 법률상담에 관하여 다음에 동의합니다.<br/>
                                    상담을 위해 작성한 이름과 상담요청내용, 전화번호가 변호사에게 제공됨에 동의합니다.<br/>
                                    상담료는 변호사가 정한 금액 (원)에 따릅니다.<br/>
                                    의뢰인은 변호사에게 다음의 사항을 제외하고 법률적인 문제에 관해 상담을 의뢰할 수 있습니다.<br/>
                                        &nbsp;&nbsp;  1. 선량한 풍속 기타 미풍양속을 해하는 사항<br/>
                                        &nbsp;&nbsp;  2. 대한민국의 법질서에 반하는 행위를 강요하는 사항<br/>
                                        &nbsp;&nbsp;  3. 변호사의 품위를 저해할 우려가 있는 사항<br/>
                                        &nbsp;&nbsp;  4. 기본적 인권 옹호에 관련된 변호사의 의무에 위반될 우려가 있는 사항<br/>
                                    의뢰인과 변호사는 서로의 명예를 해치거나 과장광고와 같은 서로의 동의를 얻지 아니한 약속을 다른사람에게 할 수 없으며 이로 인한 책임은 고의 또는 과실 있는 당사자가 부담합니다.<br/>
                                    의뢰인과 변호사는 상담과 관련된 기타 사항에 관하여는 일반 민법의 규정에 따라 권리와 의무를 부담합니다.<br/>
                                    의뢰인과 변호사는 법률상담에 관하여 위 사항에 서로 동의합니다.<br/>

                            </p>
                        </div>
                    </div>
            </div>
            <div class="d-flex justify-content-between">
                <input type="button" class="btn btn-custom mt-4" name="BackButton" value="뒤로" onclick="history.back()"></input>
                <input type="button" class="btn btn-custom mt-4" name="checkButton" value="결제하기" id="checkButton" disabled></input>
                <input type="hidden" value="payment" id="paymentVal">
            </div>
            </form>
        </div>

        <!-- footer -->
        <jsp:include page="../common/footer.jsp"/>
        <script>
        var params = {
            lawyerName :"${lawyerName}",
            bookingDate : "${bookingDate}",
            paymentState : "",
            impUid : "",
            merchantUid : "",
            payMethod : "",
            buyerName : "",
            paidAmount : "",
            paidAt : "",
            clientName : "${client.clientName}",
            clientEmail : "${client.clientEmail}",
            clientPhone : "${client.clientPhone}",
            clientNum :"${client.clientNum}"
        }


        $("#checkButton").click(function(){
            paymentMethod = payMethod();

            switch(paymentMethod) {
                case "card" :
                      requestCard(params);
                      break;
                case "kakaopay" :
                      requestKakaoPay(params);
                      break;
            }
        });

        $(".searchForm").hide();
        </script>
    </body>
</html>