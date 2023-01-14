<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상담하기 | 법률서비스 101</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>

    <link rel="stylesheet" href="/resource/css/headers.css">
    <link rel="stylesheet" href="/resource/css/sidebars.css">
    <link rel="stylesheet" href="/resource/css/footer.css">
    <link rel="stylesheet" href="/resource/css/common.css">
    
    <link rel="stylesheet" href="/resource/css/chat.css">
    <script src="/resource/js/chat.js"></script>

    <c:if test="${!empty msg}">
        <script>
            alert("${msg}");
        </script>
    </c:if>

</head>
<body class="position-relative">

     <!-- header -->
<%--     <jsp:include page="../common/header.jsp" />--%>

    <!-- sidebar -->
<%--     <jsp:include page="../common/sidebars.jsp" />--%>

    <!-- chat -->
     <div class="bg-body-tertiary ">
         <div class="position-relative border-bottom">
             <div class="d-flex flex-column align-items-stretch flex-shrink-0 h-100 border border-bottom-0 bg-body position-relative" style="width: 330px;">
                 <span class="fs-4 fw-bold p-3 py-4">오픈 채팅 목록</span>
                 <div class="chat-rooms overflow-y-scroll" style="height: 800px; margin-bottom: 70px;">
                 <c:choose>
                     <c:when test="${empty chatRoomList}">
                         <p class="ps-3 text-secondary">개설된 채팅방이 없습니다</p>
                     </c:when>
                     <c:otherwise>
                         <c:forEach var="chatRoom" items="${chatRoomList}">
                             <div class="chat-room list-group list-group-flush border-bottom scrollarea" data-num="${chatRoom.chatRoomNum}">
                                 <div class="list-group-item list-group-item-action py-3 lh-sm d-flex justify-content-between" aria-current="true">
                                     <div class="d-flex flex-column w-100">
                                         <strong class="mb-1">${chatRoom.chatUserVo.lawyerVo.lawyerName} 변호사의 채팅방</strong>
                                         <div class="col-10 mb-1 small text-skip-2">${chatRoom.chatRoomTitle}</div>
                                     </div>
                                     <c:choose>
                                         <c:when test="${chatRoom.lockState == 'Y'.charAt(0)}">
                                             <div class="d-flex flex-column justify-content-between">
                                                 <div class="text-warning">
                                                     <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-lock-fill" viewBox="0 0 16 16">
                                                         <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z"/>
                                                     </svg>
                                                 </div>
                                                 <div class="text-body-tertiary small mt-auto">
                                                     <span class="user-count">${chatRoom.userCount}</span>/2
                                                 </div>
                                             </div>
                                         </c:when>
                                         <c:otherwise>
                                             <div class="text-body-tertiary small mt-auto">
                                                 <span class="user-count">${chatRoom.userCount}</span>/2
                                             </div>
                                         </c:otherwise>
                                     </c:choose>
                                 </div>
                             </div>
                         </c:forEach>
                     </c:otherwise>
                 </c:choose>
                 </div>
                 <c:if test="${!empty lawyer}">
                    <button class="btn btn-outline-custom position-absolute bottom-0 end-0 mb-3 me-3" id="makeRoomBtn">채팅방 만들기</button>
                 </c:if>
             </div>
             <div class="position-absolute start-50 top-0 translate-middle-x" id="chat-container">
                 <c:choose>
                     <c:when test="${empty chatRoom}">
                         <h2 class="text-center pt-5 pb-4">채팅방에 입장하여 <span class="text-custom">무료 상담</span>을 받아보세요!</h2>
                     </c:when>
                     <c:otherwise>
                         <h2 class="text-center pt-5 pb-4">${chatRoom.chatUserVo.lawyerVo.lawyerName} 변호사 채팅방</h2>
                         <div class="d-flex justify-content-center align-items-center">
                             <div class="d-flex justify-content-center mb-5 position-relative">
                                 <div class="exit-btn position-absolute z-1 rounded-circle text-white" style="width: 50px; height: 50px; top: 80px; left:26px;">
                                     <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-arrow-left-short" viewBox="0 0 16 16">
                                         <path fill-rule="evenodd" d="M12 8a.5.5 0 0 1-.5.5H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5a.5.5 0 0 1 .5.5z"/>
                                     </svg>
                                 </div>

                                 <div class="card d-flex justify-content-between">
                                     <div class="d-flex flex-row justify-content-between p-3 adiv text-white bg-custom">
                                         <i class="fas fa-chevron-left"></i>
                                         <span class="pb-3 fs-5">상담중</span>
                                         <i class="fas fa-times"></i>
                                     </div>
                                     <div class="d-flex flex-column justify-content-end" style="height: 700px;">
                                         <div class="chat-scrollbar flex-row px-3 overflow-y-scroll h-100">
                                             <div class="chat-box">

                                             </div>
                                          </div>
                                         <div class="message-area form-group px-3 mb-3">
                                             <textarea class="message form-control pe-5 py-0" rows="4" placeholder="메시지를 입력하세요."></textarea>
                                             <button class="message-btn">
                                                 <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16">
                                                     <path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/>
                                                 </svg>
                                             </button>
                                         </div>
                                     </div>
                                 </div>
                             </div>

                             <div class="text-center ms-5">
                                 <img src="/resource/img/lawyer/lawyer1.jpg" class="rounded-circle" alt="프로필" width="130px">
                                 <h2 class="fw-normal mt-3">${chatRoom.chatUserVo.lawyerVo.lawyerName} 변호사</h2>
                                 <p class="mt-3">${chatRoom.chatUserVo.lawyerVo.lawyerIntroMsg}</p>
                             </div>
                         </div>
                     </c:otherwise>
                 </c:choose>
             </div>
         </div>
     </div>

    <!-- 채팅방 생성 modal -->
    <div id="roomModal" class="w-100 h-100 bg-black position-absolute top-0 start-0 z-2 bg-opacity-25">
        <div class="position-absolute start-50 translate-middle bg-body rounded-4 p-4" style="width: 800px; top: 35%">
            <h3>채팅방 생성</h3>
            <hr>
            <div class="mb-2">
                <label class="form-label fw-bold">생성자</label>
                <input type="text" class="form-control" value="${lawyer.lawyerName}" readonly>
            </div>
            <div class="mb-2">
                <label for="chatRoomTitle" class="form-label fw-bold">방 제목</label>
                <input type="text" class="form-control" name="chatRoomTitle" id="chatRoomTitle">
                <p class="text-danger" id="title-errorMsg"></p>
            </div>
            <div class="mb-2">
                <label class="form-label d-block fw-bold">잠금 설정</label>
                <label class="form-label mb-0 me-2">
                    <input type="radio" name="lockState" value="N" checked>공개
                </label>
                <label class="form-label mb-0">
                    <input type="radio" name="lockState" value="Y">잠금
                </label>
            </div>
            <div class="mb-2" id="pwd-box">
                <label for="chatRoomPwd" class="form-label fw-bold">비밀번호 <span class="small text-secondary">(숫자 4자리 *)</span></label>
                <input type="number" class="form-control w-25" name="chatRoomPwd" id="chatRoomPwd">
                <p class="text-danger" id="pwd-errorMsg"></p>
            </div>
            <div class="text-end mt-5">
                <button type="button" class="btn btn-outline-custom" id="cancelMakeBtn">취소</button>
                <button type="button" class="btn btn-custom" id="makeBtn">만들기</button>
            </div>
        </div>
    </div>

    <div id="pwdModal" class="w-100 h-100 bg-black position-absolute top-0 start-0 z-2 bg-opacity-25">
        <div class="position-absolute start-50 translate-middle bg-body rounded-4 p-4" style="width: 400px; top: 25%">
            <div class="form-group">
                <label for="pwdConfirm" class="form-label fw-bold">비밀번호 입력</label>
                <input type="number" class="form-control" name="pwdConfirm" id="pwdConfirm" placeholder="비밀번호 4자리를 입력하세요">
                <p class="text-danger" id="pwdConfirm-errorMsg"></p>
            </div>
            <div class="text-end mt-3">
                <button class="btn btn-outline-custom" id="cancelPwdBtn">취소</button>
                <button class="btn btn-custom" id="pwdConfirmBtn">확인</button>
            </div>
        </div>
    </div>

    <!-- footer -->
<%--    <jsp:include page="../common/footer.jsp"/>--%>

     <!-- Stomp -->
     <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

    <script>
        let stomp;
        const loginUser = "${loginUser}";

        const roomNum = "${chatRoom.chatRoomNum}";
        const lawyer = "${chatRoom.chatUserVo.lawyerVo}";
        const userCount = "${chatRoom.userCount}";

        const userType = loginUser === lawyer ? "L" : "C";

        function connect() {
            const sockJs = new SockJS("/stomp/chat");

            //1. SockJS를 내부에 들고있는 stomp를 내어줌
            stomp = Stomp.over(sockJs);

            //2. connection이 맺어지면 실행
            stomp.connect({}, function (){
                console.log("STOMP Connection");

                //3. send(path, header, message)로 메세지를 보낼 수 있음
                stomp.send('/pub/chat/enter', {}, JSON.stringify({chatRoomNum: roomNum, userType: userType, userCount: userCount}));

                //4. subscribe(path, callback)으로 메세지를 받을 수 있음
                stomp.subscribe("/sub/chat/room/" + roomNum, function (chat) {
                    const content = JSON.parse(chat.body);

                    const chatRoomNum = content.chatRoomNum;
                    const writer = content.chatWriter;
                    const message = content.chatContent;
                    const userType = content.userType;
                    const writeTime = content.createdDate;
                    const userCount = content.userCount;

                    let str = "";
                    if(userType === "L") {
                        str = $("<div class='d-flex flex-row p-3 justify-content-end' id='chat'>" +
                                    "<div class='mx-1 text-end'>" +
                                        "<div class='small text-end'>" + writer + " 변호사</div>" +
                                        "<div style='display: flex'>" +
                                            "<span class='d-inline-block mx-1 small text-secondary' style='min-width: 16%; margin-top: auto; font-size: 12px;'>" + writeTime + "</span>" +
                                            "<div class='bg-white mr-2 p-3 d-inline-block text-start' style='max-width: 80%'><span class='fs-6 text-muted text-break'>" + message +"</span></div>" +
                                         "</div>" +
                                    "</div>" +
                                    "<img src='/resource/img/lawyer/lawyer1.jpg' class='rounded-circle' width='40' height='40'>" +
                                "</div>")
                    } else {
                        str = $("<div class='d-flex flex-row p-3' id='chat'>" +
                                    "<img src='/resource/img/profile.png' class='rounded-circle' width='40' height='40'>" +
                                    "<div class='mx-1'>" +
                                        "<div class='small'>" + writer + "</div>" +
                                        "<div style='display: flex'>" +
                                             "<div class='chat ml-2 p-3 fs-6 text-break d-inline-block text-break' style='max-width: 80%'>" + message + "</div>" +
                                             "<span class='d-inline-block mx-1 small text-secondary' style='min-width: 16%; margin-top: auto; font-size: 12px;'>" + writeTime + "</span>" +
                                        "</div>" +
                                    "</div>" +
                                "</div>")
                    }
                    $(".chat-box").append(str);

                    $(".chat-room").each(function (index, item) {
                        if ($(item).attr("data-num") == chatRoomNum) {
                            $(item).find(".user-count").text(userCount);
                        }
                    });

                    const max = $(".chat-scrollbar").height();
                    const height = $(".chat-box").height();
                    if (height > max) {
                        $(".chat-scrollbar").scrollTop(height);
                    }
                });
            });

            $(".message-btn").on("click", function(e){
                const msg = $(".message").val();
                sendMsg(msg);
            });

            $(".message").on("keyup", function (e) {
                e.preventDefault();
                let msg = $(".message").val();
                if (e.keyCode === 13 && e.shiftKey) {
                    return
                } else if (e.keyCode === 13) {
                    sendMsg(msg);
                }
            });

            function sendMsg(msg) {
                stomp.send('/pub/chat/message', {}, JSON.stringify({chatRoomNum: roomNum, chatContent: msg, userType: userType}));

                $(".message").val("");
                $(".message").focus();
            };
        }

        function disConnect(stomp) {
            if (stomp != null) {
                console.log("Disconnect");
                stomp.disconnect();
            }
        }

        window.onbeforeunload = () => {
            disConnect(stomp);
        };
    </script>
</body>
</html>



