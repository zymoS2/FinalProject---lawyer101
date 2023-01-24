<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약 목록 | 법률서비스 101</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>

    <link rel="stylesheet" href="/resource/css/common.css">
    <script src="/resource/js/reservationList.js"></script>
</head>
<body>
    <!-- header -->
    <jsp:include page="../common/header.jsp"/>

    <!-- sidebar -->
    <jsp:include page="../common/sidebar.jsp"/>

    <div class="main">
        <div class="w-50 mx-auto">
            <h2 class="pt-5 pb-4 text-center">예약 목록</h2>

            <!--현재 예약-->
            <div class="pb-5">
              <p class="fw-bold">현재 예약</p>
                <c:choose>
                   <c:when test="${ clientPaymentList.isEmpty()  }">
                        <h5> 현재 예약 목록이 없습니다. </h5>
                   </c:when>
                   <c:otherwise>
                      <c:choose>
                          <c:when test = "${latestBooking.bookingDate < nowDt }">
                             <h5> 현재 예약 목록이 없습니다. </h5>
                          </c:when>
                          <c:otherwise>
                             <c:forEach var="cp" items="${ clientPaymentList }">
                                <c:choose>
                                    <c:when test="${ nowDt <= cp.bookingVo.bookingDate }">
                                       <div class="d-flex justify-content-between align-items-center flex-shrink-0">
                                           <div class="list-group list-group-flush scrollarea" style="width: 88%;">
                                               <a href="" class="d-flex align-items-center">
                                                   <div class="list-group-item list-group-item-action py-3 lh-sm me-3 " aria-current="true">
                                                       <div class="d-flex w-100 align-items-center justify-content-between">
                                                           <div class="d-flex w-50">
                                                               <img src="/display?fileName=${cp.bookingVo.lawyerVo.lawyerImg}" onerror="this.src='/resource/img/profile.png';" alt="프로필사진"
                                                                    class="rounded-circle" width="36px" height="36px">
                                                               <div class="ms-2">
                                                                   <strong class="mb-1">${cp.bookingVo.lawyerVo.lawyerName} 변호사</strong>
                                                                   <div class="small">${cp.bookingVo.lawyerVo.companyVo.companyName}</div>
                                                               </div>
                                                           </div>
                                                           <div>
                                                               <div class="small text-muted">예약일 <span class="ms-2">${fn:substring(cp.bookingVo.bookingDate,0,10)}</span></div>
                                                               <div class="small text-muted">예약시간 <span class="ms-2">${cp.bookingVo.bookingTime} : 00 </span></div>
                                                           </div>
                                                       </div>
                                                   </div>
                                               </a>
                                           </div>
                                           <div>
                                               <button class="btn btn-danger btn-sm" style="width: 90px; height: 30px; color:white;" id="refund-button">환불 신청</button>
                                           </div>
                                       </div>
                                    </c:when>
                                </c:choose>
                             </c:forEach>
                          </c:otherwise>
                      </c:choose>
                   </c:otherwise>
                </c:choose>
            </div>

            <!--지난 예약-->
            <div class="pb-5">
                <p class="fw-bold">지난 예약</p>
                <c:choose>
                    <c:when test="${ clientPaymentList.isEmpty()  }">
                        <h5> 현재 지난 목록이 없습니다. </h5>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="cp" items="${ clientPaymentList }">
                            <c:choose>
                                <c:when test="${ nowDt >= cp.bookingVo.bookingDate }">
                                    <div class="d-flex justify-content-between align-items-center flex-shrink-0">
                                        <div class="d-flex list-group list-group-flush scrollarea" style="width: 88%;">
                                            <a href="" class="d-flex align-items-center">
                                                <div class="list-group-item list-group-item-action py-3 lh-sm me-3 bg-body-secondary" aria-current="true">
                                                    <div class="d-flex w-100 align-items-center justify-content-between">
                                                        <div class="d-flex w-50">
                                                            <img src="/display?fileName=${cp.bookingVo.lawyerVo.lawyerImg}" onerror="this.src='/resource/img/profile.png';"
                                                                 class="rounded-circle" width="36px" height="36px">
                                                            <div class="ms-2">
                                                                <strong class="mb-1">${cp.bookingVo.lawyerVo.lawyerName} 변호사</strong>
                                                                <div class="small">${cp.bookingVo.lawyerVo.companyVo.companyName}</div>
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <div class="small text-muted">예약일 <span class="ms-2">${fn:substring(cp.bookingVo.bookingDate,0,10)}</span></div>
                                                            <div class="small text-muted">예약시간 <span class="ms-2">${cp.bookingVo.bookingTime} : 00 </span></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div>
                                            <button class="btn btn-info btn-sm" style="width: 90px; height: 30px; color:white;"
                                                    onclick="location.href='/review/write/${cp.paymentNum}'">리뷰 쓰기</button>
                                        </div>
                                    </div>
                                </c:when>
                            </c:choose>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <hr class="m-0">

    <!-- footer -->
    <jsp:include page="../common/footer.jsp"/>

    <script>
        $(".searchForm").hide();
    </script>
</body>
</html>