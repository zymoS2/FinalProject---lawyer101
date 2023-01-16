$(function () {
    $("#find-email-btn").on("click", function () {
        if (emailValidate()) {
            alert("메일이 전송되었습니다.");
            $("#findIdForm").submit();
        }
    });

    function emailValidate() {
        const email = $("#find-id-email").val();
        const regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

        if (email === "" || email === null) {
            $("#email-errorMsg").text("이메일을 입력해주세요.");
            return false;
        } else {
            if (!regExp.test(email)) {
                $("#email-errorMsg").text("이메일 형식이 잘못되었습니다.");
                return false;
            } else {
                $("#email-errorMsg").text("");
            }
        }

        return true;
    }
});
