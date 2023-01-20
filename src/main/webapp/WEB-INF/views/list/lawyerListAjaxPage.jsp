<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:forEach var="lawyer" items="${lawyerList}">
  <div class="col-lg-4 text-center my-5">
    <a href="/product/detail/${lawyer.lawyerNum}" class="profile rounded-circle d-inline-block">
      <img src="/resource/img/profile.png" alt="" width="100%" height="100%">
    </a>
    <div class="card-body">
      <h3 class="t-name">${lawyer.lawyerName} 변호사</h3>
      <p class="t-company">${lawyer.companyVo.companyName}</p>
      <p class="card-text">
        <a href="/product/detail/${lawyer.lawyerNum}">
            ${lawyer.lawyerIntroMsg}<span class="point-bold"> ▖ </span>
        </a>
      </p>
      <div class="d-flex justify-content-between align-items-center">
        <div class="btn-group">
          <button type="button" class="btn btn-sm btn-outline-custom"
                  onclick="location.href='/product/detail/' + ${lawyer.lawyerNum}">더보기
          </button>
          <button type="button" class="btn btn-sm btn-outline-custom"
                  onclick="location.href='/booking/' + ${lawyer.lawyerNum}">예약하기
          </button>
        </div>
      </div>
    </div>
  </div>
</c:forEach>
