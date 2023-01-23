$(function () {
    let code;

    $("#send-sms-button").click(function () {
        const phoneNum = $('#phone').val();

        if (phoneValidator(phoneNum)) {
            alert("인증번호가 발송되었습니다.");
            $.ajax({
                type: "GET",
                url: "/join/sendSMS",
                data: {phoneNum: phoneNum},

                success: function(data) {
                    code = data;
                    $("#phone").attr("readonly", true);
                    $("#send-sms-button").attr("disabled", true);
                    $("#auth-code").attr("disabled", false);
                },
                error: function () {
                    console.log("ajax 통신 실패");
                },
            });
        } else {
            alert("유효하지 않는 전화번호입니다.");
        }
    });

    $("#auth-button").click(function () {
        const authCode = $("#auth-code").val();
        if (authCode === "" || !authCode) {
            return;
        }

        if (authCode === code) {
            alert("인증에 성공하였습니다.");
            $("#auth-code").attr("disabled", true);
            $("#auth-code").attr("readonly", true);
        } else {
            alert("인증번호가 일치하지 않습니다. 다시 시도하세요.");
        }
    });
});

function phoneValidator(phoneNum) {
    const regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
    if (!regPhone.test(phoneNum)) {
        return false;
    }
     return true;
}