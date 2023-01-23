<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="frm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>

    <link href="/resource/css/common.css" rel="stylesheet" />

    <title>${counselDetail.clientVo.clientName} 의뢰인의 상담 내용 | 법률서비스 101</title>
</head>
<body>
    <!-- header -->
    <jsp:include page="../common/header.jsp"/>

    <!-- sidebar -->
    <jsp:include page="../common/sidebar.jsp"/>
    <div class="container" style="width: 800px;">
        <div class="pt-5 pb-3">
            <div class="p-5 border rounded-2">
                <h2 class="fw-bold mb-4 text-center">${counselDetail.clientVo.clientName} 의뢰인의 <span class="text-custom">상담 내용</span></h2>
                <p class="small text-secondary text-end">
                    <frm:parseDate var="parseDate" pattern="yyyy-MM-dd" value="${counselDetail.bookingDate}"/>
                    <frm:formatDate var="bookingDate" pattern="yyyy-MM-dd" value="${parseDate}"/>
                    <span class="me-1">${bookingDate}</span><span>
                    <c:choose>
                        <c:when test="${counselDetail.bookingTime >= 12}">오후</c:when>
                        <c:otherwise>오전</c:otherwise>
                    </c:choose>
                    ${counselDetail.bookingTime} : 00</span></p>
                <p>
                    ${counselDetail.counselingContent}
                </p>
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