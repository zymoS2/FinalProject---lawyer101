<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:forEach var="inBoard" items="${inBoardList}">
  <li>
    <a href="/knowledgeInDetail?num=${inBoard.inBoardNum}" class="d-block py-5 border-bottom">
      <p class="text-secondary">${inBoard.categoryVo.categoryName}</p>
      <h4 class="mb-3">${inBoard.inBoardTitle}</h4>
      <c:if test="${!empty allInReply.get(status.index)}">
        <p><b class="text-custom">답변</b><span class="ps-3">${allInReply.get(status.index).get(0).lawyerVo.lawyerName}</span> 변호사</p>
        <p class="text-skip">
            ${allInReply.get(status.index).get(0).replyContent}
        </p>
      </c:if>
      <small class="text-secondary">조회수 <b>${inBoard.inBoardCount}</b></small>
    </a>
  </li>
</c:forEach>
