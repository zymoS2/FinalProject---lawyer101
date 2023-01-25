<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:forEach var="inReply" items="${inReplyList}">
    <li class="py-5 border-bottom">
        <a href="/knowledgeInDetail?num=${inReply.inBoardVo.inBoardNum}">
            <p class="text-secondar small">${inReply.inBoardVo.categoryVo.categoryName}</p>
            <h5 class="fw-bold">${inReply.inBoardVo.inBoardTitle}</h5>
            <p class="small text-secondary mb-0">${fn:substring(inReply.replyDate, 0, 10)}</p>
        </a>
    </li>
</c:forEach>