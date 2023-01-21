<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:forEach var="inBoard" items="${inBoardList}">
  <li>
    <a href="/knowledgeInDetail/${inBoard.inBoardNum}" class="d-inline-block py-5 border-bottom">
      <p class="text-secondary">${inBoard.categoryVo.categoryName}</p>
      <h4 class="mb-3">${inBoard.inBoardTitle}</h4>
      <p><b class="text-custom">답변</b><span class="ps-3">지세훈</span> 변호사</p>
      <p class="text-skip">
        문의주신 사안의 경우 합의금조로 퇴직금과 급여를 받지 않겠다고 하며 상대방과 합의를 해 보는 것이 최선으로 보여집니다. 만약 상대방이 합의를 해 주지 않고 고소에 나아간 경우라면 받지 못한 임금 및 퇴직금에 대하여 노동청에 진정을 제기하는 것을 고려해 보시기 바랍니다. 이상의 점 참고하셔서 필요한 경우 구체적인 사실관계를 바탕으로 자세한 상담을 받아 보실 것을 권해드립니다.
      </p>
      <p class="text-secondary">다른 변호사 답변 <span>2</span>개</p>
      <small class="text-secondary">조회수 <b>100</b></small>
    </a>
  </li>
</c:forEach>
