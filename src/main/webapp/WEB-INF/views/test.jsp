<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
</head>
<body>




<c:forEach var="cl"  items="${clientReservationList}">
  <c:if test="${now_dt < cl.bookingVo.bookingDate}" >
    <div class="d-flex flex-column align-items-stretch flex-shrink-0">
        <div class="list-group list-group-flush scrollarea">
            <a href="" class="d-flex align-items-center">
                <div class="list-group-item list-group-item-action py-3 lh-sm me-3" aria-current="true">
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <div class="d-flex w-50">
                            <img src="/resource/img/profile.png" alt="" width="36px" height="36px">
                            <div class="ms-2">
                                <strong class="mb-1">${cl.bookingVo.lawyerVo.lawyerName} 변호사</strong>
                                <div class="small">${cl.bookingVo.lawyerVo.companyVo.companyName}</div>
                            </div>
                        </div>
                        <div>
                            <div class="small text-muted">예약일 <span class="ms-2">${cl.bookingVo.bookingDate}</span></div>
                            <div class="small text-muted">예약시간 <span class="ms-2">${cl.bookingVo.bookingTime} : 00 </span></div>
                        </div>
                    </div>
                </div>
                <button class="btn btn-danger btn-sm" style="width: 90px; height: 30px;">환불신청</button>
            </a>
        </div>
    </div>
  </c:if>
</c:forEach>

<c:forEach var="cl"  items="${clientReservationList}">
<c:if test="${now_dt > cl.bookingVo.bookingDate}" >
<div class="d-flex flex-column align-items-stretch flex-shrink-0">
    <div class="list-group list-group-flush scrollarea">
        <a href="" class="d-flex align-items-center">
            <div class="list-group-item list-group-item-action py-3 lh-sm me-3 bg-body-secondary" aria-current="true">
                <div class="d-flex w-100 align-items-center justify-content-between">
                    <div class="d-flex w-50">
                        <img src="../resource/img/profile.png" alt="" width="36px" height="36px">
                        <div class="ms-2">
                            <strong class="mb-1">${cl.bookingVo.lawyerVo.lawyerName} 변호사</strong>
                            <div class="small">${cl.bookingVo.lawyerVo.companyVo.companyName}</div>
                        </div>
                    </div>
                    <div>
                        <div class="small text-muted">예약일 <span class="ms-2">${cl.bookingVo.bookingDate}</span></div>
                        <div class="small text-muted">예약시간 <span class="ms-2">${cl.bookingVo.bookingTime} : 00 </span></div>
                    </div>
                </div>
            </div>
            <button class="btn btn-info btn-sm" style="width: 90px; height: 30px; color:white;">리뷰 쓰기</button>
        </a>
    </div>
</div>
</c:if>
</c:forEach>



<form action="/insert" method="post">
    id: <input type="text" name="id">
    pwd: <input type="text" name="password">
    <button type="submit">제출</button>
</form>
<button onclick="requestKakaoPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->


</body>
</html>

