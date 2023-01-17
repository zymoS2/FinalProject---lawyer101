$(function () {
    $("#find-email-btn").on("click", function () {
        if (emailValidate()) {
            alert("메일이 전송되었습니다.");
            $("#findIdForm").submit();
        }
    });

    const regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    function emailValidate() {
        const email = $("#find-id-email").val();

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

    $("#reset-pwd-btn").on("click", function () {
        if (idValidate() && emailValidate2()) {
            alert("메일이 전송되었습니다.");
            $("#resetPwdForm").submit();
        }
    });

    function idValidate() {
        const id = $("#reset-pwd-id").val();
        if (id === "" || id === null) {
            $("#id-errorMsg").text("아이디를 입력하세요.");
            return false;
        } else {
            $("#id-errorMsg").text("");
        }

        return true;
    }

    function emailValidate2() {
        const email = $("#reset-pwd-email").val();

        if (email === "" || email === null) {
            $("#email-errorMsg2").text("이메일을 입력해주세요.");
            return false;
        } else {
            if (!regExp.test(email)) {
                $("#email-errorMsg2").text("이메일 형식이 잘못되었습니다.");
                return false;
            } else {
                $("#email-errorMsg").text("");
            }
        }

        return true;
    }
});
