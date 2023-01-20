$(function () {
    $("#info-submit-btn").click(function () {
        const email = $("#email").val();
        const name = $("#name").val();

        if (infoValidate(email, name)) {
            alert("개인정보가 저장되었습니다");
            $("#info-edit-form").submit();
        }
    });

    function infoValidate(email, name) {
        const regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        if (email === "" || email === null) {
            $("#email-errorMsg").text("이메일을 입력하세요.");
            return false;
        } else {
            if (!regExp.test(email)) {
                $("#email-errorMsg").text("올바른 이메일 형식이 아닙니다.");
                return false;
            } else {
                $("#email-errorMsg").text("");
            }
        }

        if (name === "" || name === null) {
            $("#name-errorMsg").text("이름을 입력하세요");
            return false;
        } else {
            $("#name-errorMsg").text("");
        }

        return true;
    }

    $("#profile-image-box").click(function () {
        $("#profile-image-input").click();
    });

    $("#profile-image-input").on("change", (e) => {
        let file = e.target.files[0];

        if (!file.type.match("image.*")) {
            alert("이미지 파일만 업로드 가능합니다.");
            return;
        }

        if ([file].length > 0) {
            const reader = new FileReader();
            reader.onload = (e) => {
                $("#profile-image").attr("src", e.target.result);

            };
            reader.readAsDataURL(file);
        } else {
            $("#profile-image").attr("src", "/resource/img/profile.png");
            $("#profile-image").val("");
        }
    })

    $("#main-image-input").on("change", (e) => {
        let file = e.target.files[0];

        if (!file.type.match("image.*")) {
            $("#main-image-input").val("");
            alert("이미지 파일만 업로드 가능합니다.");
            return;
        }
    })

    $("#profile-submit-btn").click(function () {
        const introMsg = $("#intro").val();
        const category = $("#category option:selected").val();

        if (profileValidate(introMsg, category)) {
            alert("프로필이 수정되었습니다.");
            $("#profile-form").submit();
        }
    });

    function profileValidate(introMsg, category) {

        if (introMsg === "" || introMsg === null) {
            $("#intro-errorMsg").text("한 줄 소개를 입력하세요");
            return false;
        } else {
            $("#intro-errorMsg").text("");
        }

        if (category === "" || category === null) {
            $("#category-errorMsg").text("분야를 선택하세요");
            return false;
        } else {
            $("#category-errorMsg").text("");
        }

        return true;
    }
});