$(function () {
    $("#find-email-btn").on("click", function () {
        const email = $("#find-id-email").val();
        if (emailValidate(email)) {
            alert("메일이 전송되었습니다.");

            $.ajax({
                url: "/auth/find-account/find-id",
                method: "POST",
                data: {email: email},
                success: function () {
                    console.log("ajax 통신 성공");
                },
                error: function () {
                    console.log("ajax 통신 실패");
                },
            })

            location.href="/clientLogin";
        }
    });

    const regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    function emailValidate(email) {
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
        const id = $("#reset-pwd-id").val();
        const email = $("#reset-pwd-email").val();

        if (idValidate(id) && emailValidate2(email)) {
            alert("메일이 전송되었습니다.");

            $.ajax({
                url: "/auth/find-account/reset-pwd",
                method: "POST",
                data: {id: id, email: email},
                success: function () {
                    console.log("ajax 통신 성공");
                },
                error: function () {
                    console.log("ajax 통신 실패");
                },
            })

            location.href="/clientLogin";
        }
    });

    function idValidate(id) {
        if (id === "" || id === null) {
            $("#id-errorMsg").text("아이디를 입력하세요.");
            return false;
        } else {
            $("#id-errorMsg").text("");
        }

        return true;
    }

    function emailValidate2(email) {
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
