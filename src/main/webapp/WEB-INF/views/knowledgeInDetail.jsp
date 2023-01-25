<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>지식IN - 상세 보기 | 법률서비스 101</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
    <link href="/resource/css/common.css" rel="stylesheet" />

    <link rel="stylesheet" href="/resource/css/knowledgeIN.css" />
    <script src="/resource/js/knowledgeInDetail.js"></script>

</head>
<body>
    <!-- header -->
    <jsp:include page="common/header.jsp" />

    <!-- sidebar -->
    <jsp:include page="common/sidebar.jsp"/>


       <div class="container" style="width: 1080px;">


                    <div class="pt-5 pb-3">
                      <p class="text-secondary">${showPost.categoryVo.categoryName}</p>
                      <h2 class="fw-bold mb-4">${showPost.inBoardTitle}</h2>
                      <p style=" white-space: pre-line"> ${showPost.inBoardContent}
                      </p>
                      <p class="small text-secondary"><span class="d-inline-block me-2">${showPost.writerDate}</span>조회수 <span>${showPost.inBoardCount}</span></p>

                   <script>
                    function clickHelpful(){

                           if(${empty client}) {
                                alert("회원만 가능합니다");
                           } else {
                                let src='../resource/img/emoji-smile-fill.png';

                                $.ajax({
                                    url:"helpfulCheck",
                                    data: {
                                        inBoardNum: ${showPost.inBoardNum},
                                        clientNum: ${showPost.clientVo.clientNum}
                                    },
                                    success: function(result) {
                                      console.log(result);
                                      $(".helpCount").text(result);
                                    },
                                    error: function() {
                                     console.log("도움됐어요 동작 실패");
                                    }
                                });

                                $(".smile").attr("src", src);
                           }
                       }
                   </script>


                      <button onclick="clickHelpful();" class="px-0 bg-transparent border-0">
                         <img class="smile" src="../resource/img/emoji-smile.png" width="23px" height="23px">
                          도움됐어요
                      </button><span class="helpCount">${showPost.inBoardHelpCount}</span>

                    </div>

                    
              <hr>

                <c:if test="${!empty lawyer}">
                    <form class="mb-3">
                        <h6 class="fw-bold">댓글 등록</h6>
                        <textarea name="replyContent" id="replyContent" cols="30" rows="5" class="form-control mb-2" style="resize: none;"></textarea>
                        <div class="text-end">
                            <button type="button" class="btn btn-custom" id="replyButton">등록</button>
                        </div>
                    </form>
                </c:if>

              <div class="py-3">
                  <h6 class="fw-bold">변호사 답변 총 <span class="text-custom replyCount">${inReplyList.size()}</span></h6>
                  <ul class="ps-0 py-4 replyList">
                   <c:forEach var="inReplyVo" items="${inReplyList}">
                        <li>
                            <div class="d-flex align-items-center bg-body-tertiary py-4 px-3 rounded-3">
                                <a href="/product/detail/${inReplyVo.lawyerVo.lawyerNum}" style="width: 64px; height: 64px;">
                                    <img src="/display?fileName=${inReplyVo.lawyerVo.lawyerImg}" onerror="this.src='/resource/img/profile.png';" class="rounded-circle" alt="" width="100%" height="100%">
                                </a>
                                <div class="ms-3">
                                    <p class="mb-1 text-secondary small">${inReplyVo.lawyerVo.companyVo.companyName}</p>
                                    <a href="/product/detail/${inReplyVo.lawyerVo.lawyerNum}" class="mb-0 fw-bold">${inReplyVo.lawyerVo.lawyerName} 변호사</a>
                                </div>
                            </div>
                            <div class="p-4">
                                <p>${inReplyVo.replyContent}</p>
                                <p class="small text-secondary">${inReplyVo.replyDate}</p>
                            </div>
                        </li>
                   </c:forEach>
                  </ul>
              </div>
          </div>

    <!-- footer -->
    <jsp:include page="common/footer.jsp" />

    <script>
        $(".searchForm").hide();

        $("#replyButton").click(function() {
            const replyContent = $("#replyContent").val();

            if(validate(replyContent)) {
                $.ajax({
                    url: "/knowledgeInDetail/reply",
                    method: "POST",
                    data: {"replyContent": replyContent,
                            "num": ${showPost.inBoardNum}
                            },
                    success: function(data) {
                        const html = $(
                         "<li>" +
                              "<div class='d-flex align-items-center bg-body-tertiary py-4 px-3 rounded-3'>" +
                                  "<a href='/product/detail/" + data.lawyerNum +"' style='width: 64px; height: 64px;'>" +
                                      "<img src='/display?fileName=" + data.lawyerImg + "' alt='' class='rounded-circle' width='100%' height='100%'>" +
                                  "</a>" +
                                  "<div class='ms-3'>" +
                                      "<p class='mb-1 text-secondary small'>" + data.companyName + "</p>" +
                                      "<a href='/product/detail/" + data.lawyerNum +"' class='mb-0 fw-bold'>" + data.lawyerName + " 변호사</a>" +
                                  "</div>" +
                              "</div>" +
                              "<div class='p-4'>" +
                                  "<p>" + data.replyContent + "</p>" +
                                  "<p class='small text-secondary'>" + data.replyDate + "</p>" +
                              "</div>" +
                          "</li>");
                        $(".replyList").prepend(html);
                        $(".replyCount").text(data.replySize);
                        $("#replyContent").val("");
                        $("#replyContent").focus();
                    },
                    error: function() {
                        console.log("ajax 통신 실패");
                    }
                })
            }
            })
    </script>
</body>
</html>
