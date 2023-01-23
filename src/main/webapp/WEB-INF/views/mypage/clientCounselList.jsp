<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="frm" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>의뢰인 목록 | 법률서비스 101</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>

    <link rel="stylesheet" href="/resource/css/common.css">
</head>
<body>
    <!-- header -->
    <jsp:include page="../common/header.jsp"/>

    <!-- sidebar -->
    <jsp:include page="../common/sidebar.jsp"/>

    <div class="main">
        <div class="w-50 mx-auto">
            <h2 class="pt-5 pb-4 text-center">의뢰인 목록</h2>
            <div class="pb-5">
                <p class="fw-bold">현재 예약</p>
                <div class="d-flex flex-column align-items-stretch flex-shrink-0">
                    <div class="list-group list-group-flush scrollarea">
                      <c:choose>
                        <c:when test="${lawyerCounselList.isEmpty() }">
                            <h5> 현재 예약된 상담 목록이 없습니다. </h5>
                        </c:when>
                        <c:otherwise>
                           <c:choose>
                              <c:when test = "${latestCounseling.bookingDate < nowDt }">
                                 <h5> 현재 예약 목록이 없습니다. </h5>
                              </c:when>
                              <c:otherwise>
                                <c:forEach var="lc" items="${ lawyerCounselList }">
                                    <c:choose>
                                         <c:when test="${ nowDt <= lc.bookingVo.bookingDate }">
                                            <a href="/lawyerpage/${lc.bookingVo.bookingNum}" class="d-flex align-items-center">
                                                <div class="list-group-item list-group-item-action py-3 lh-sm me-3" aria-current="true">
                                                    <div class="d-flex w-100 align-items-center justify-content-between">
                                                        <div class="ms-2">
                                                            <strong class="mb-1">${lc.bookingVo.clientVo.clientName}</strong>
                                                            <div class="small text-skip-2">${lc.bookingVo.counselingContent}</div>
                                                        </div>
                                                        <div>
                                                            <div class="small text-muted">예약일<span class="ms-2">${lc.bookingVo.bookingDate}</span></div>
                                                            <div class="small text-muted">예약시간<span class="ms-2">${lc.bookingVo.bookingTime} : 00 </span></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                         </c:when>
                                    </c:choose>
                                </c:forEach>
                              </c:otherwise>
                           </c:choose>
                        </c:otherwise>
                      </c:choose>
                    </div>
                </div>
            </div>

            <div class="pb-5">
                <p class="fw-bold">지난 예약</p>
                <c:choose>
                    <c:when test="${lawyerCounselList.isEmpty()}">
                        <h5>지난 예약 목록이 없습니다.</h5>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="lc" items="${lawyerCounselList}">
                            <c:choose>
                              <c:when test="${ nowDt >= lc.bookingVo.bookingDate }">
                                <div class="d-flex flex-column align-items-stretch flex-shrink-0">
                                    <div class="list-group list-group-flush scrollarea">
                                        <div class="d-flex align-items-center">
                                            <a href="/lawyerpage/${lc.bookingVo.bookingNum}" class="list-group-item list-group-item-action py-3 lh-sm me-3 bg-body-secondary" aria-current="true">
                                                <div class="d-flex w-100 align-items-center justify-content-between">
                                                    <div class="w-75">
                                                        <div class="ms-2">
                                                            <strong class="mb-1">${lc.bookingVo.clientVo.clientName}</strong>
                                                            <div class="small text-skip-2">${lc.bookingVo.counselingContent}</div>
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <div class="small text-muted">예약일<span class="ms-2">${fn:substring(lc.bookingVo.bookingDate,0,10)}</span></div>
                                                        <div class="small text-muted">예약시간<span class="ms-2">${lc.bookingVo.bookingTime} : 00 </span></div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
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