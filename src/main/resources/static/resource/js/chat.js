$(function() {
    // 채팅방 생성
    $("#makeRoomBtn").on("click", function() {
        $("#roomModal").show();
    })

    $("#makeBtn").on("click", function() {

        const params = {
            chatRoomTitle : $("#chatRoomTitle").val(),
            lockState : $("input[name='lockState']:checked").val(),
            chatRoomPwd : $("#chatRoomPwd").val()
        };

        if (roomValidate(params.chatRoomTitle, params.lockState, params.chatRoomPwd)) {
            $.ajax({
                url: "/chat/room",
                method: "POST",
                data: params,
                success: function(result) {
                    $("#roomModal").hide();
                    location.href = "/chat/room?roomNum=" + result;
                },
                error: function() {
                    console.log("ajax 통신 실패");
                },
            });
        }

    })

    function roomValidate(chatRoomTitle, lockState, chatRoomPwd) {
        if (chatRoomTitle === null || chatRoomTitle === "") {
            $("#title-errorMsg").text("제목을 입력하세요");
            return false;
        } else {
            $("#title-errorMsg").text("");
        }

        if (lockState === 'Y') {
            if (chatRoomPwd === null || chatRoomPwd === "") {
                $("#pwd-errorMsg").text("비밀번호를 입력하세요.")
                return false;
            } else {
                $("#pwd-errorMsg").text("")
            }

            if (chatRoomPwd.length !== 4) {
                $("#pwd-errorMsg").text("4자리 비밀번호를 입력하세요.")
                return false;
            } else {
                $("#pwd-errorMsg").text("")
            }
        }

        return true;
    }

    $("#cancelMakeBtn").on("click", function() {
        $("#chatRoomTitle").val("");
        $("#title-errorMsg").text("");
        $("#chatRoomPwd").val("");
        $("#pwd-errorMsg").text("")
        $("#roomModal").hide();
    })

    // 채팅방 잠금 설정
    $("input[name='lockState']").on('click', function () {
        if($(this).val() === "Y") {
            $("#chatRoomPwd").parent().show();
        } else {
            $("#chatRoomPwd").val("");
            $("#chatRoomPwd").parent().hide();
        }
    });

    // 채팅방 입장
    const sch = location.search;
    const params = new URLSearchParams(sch);
    const roomNum = params.get('roomNum');
    let selectedRoomNum;

    if (roomNum !== null) {
        connect(); // 소켓 연결

        $(".chat-room").each(function () {
            selectedRoomNum = $(this).attr("data-num");
            if (roomNum === selectedRoomNum) {
                $(this).children().addClass("active");
            }
        })
    }

    // 채팅방 입장
    $(".chat-room").on("click", function () {
        selectedRoomNum = $(this).attr("data-num");

        $.ajax({
            url: "/chat/room/lockState-check",
            method: "GET",
            data: {"roomNum": selectedRoomNum},
            success: function (result) {
                if(result === 'Y') {
                    $("#pwdModal").show();
                } else {
                    location.href="/chat/room?roomNum=" + selectedRoomNum;
                }
            },
            error: function () {
                console.log("ajax 통신 실패");
            },
        })
    })

    // 채팅방 비밀번호 확인
    $("#pwdConfirmBtn").on("click", function () {
        let pwd = $("#pwdConfirm").val();
        if (pwdValidate(pwd)) {
            $.ajax({
                url: "/chat/room/pwd-check",
                method: "POST",
                data: {"roomNum": selectedRoomNum, "pwd": pwd},
                success: function (result) {
                    if (result) {
                        $("#pwdModal").hide();
                        location.href="/chat/room?roomNum=" + selectedRoomNum;
                    } else {
                        $("#pwdConfirm-errorMsg").text("비밀번호가 일치하지않습니다");
                    }
                },
                error: function () {
                    console.log("ajax 통신 실패");
                },
            })
        }
    });

    // 비밀번호 입력 취소
    $("#cancelPwdBtn").on("click", function () {
        $("#pwdConfirm").val("");
        $("#pwdConfirm-errorMsg").text("");
        $("#pwdModal").hide();
    });

    function pwdValidate(pwd) {
        if (pwd === null || pwd === "") {
            $("#pwdConfirm-errorMsg").text("비밀번호를 입력하세요");
            return false;
        }

        if (pwd.length !== 4) {
            $("#pwdConfirm-errorMsg").text("4자리 비밀번호를 입력하세요");
            return false;
        }

        return true;
    }

    // 채팅방 나가기
    $(".exit-btn").on("click", function () {
        if (confirm("채팅방을 나가시겠습니까?\n채팅방을 나가면 현재 대화 내용이 사라집니다.")) {
            location.href = "/chat/rooms";
        }
    });
})