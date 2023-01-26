function checkPhoneNum() {
  const phone = document.getElementById("checkPhoneNuminput").value;
  if (phone.length === 13) {
    document.getElementById("sendMessage").disabled = false;
    $(function () {
      $("#certiBtn").click(function () {
        $("#modalLink").slideDown(2000);
      });
    });
  }
}

function initButton() {
  document.getElementById("sendMessage").disabled = true;
  document.getElementById("completion").disabled = true;
}

let processId = -1;

const getToken = () => {
  const value = document.getElementById("checkPhoneNuminput").value;
  console.log(value);
  let regExp = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
  if (regExp.test(value)) {
    $(".disnone").show();
    alert("메시지를 확인해주세요.");
  } else {
    alert("다시 한 번 확인해주세요.");
    e.preventDefault();
  }

  document.getElementById("completion").disabled = false;
  if (processId != -1) clearInterval(processID);
  let time = 1800;
  processID = setInterval(function () {
    if (time < 0 || document.getElementById("sendMessage").disabled) {
      clearInterval(processID);
      initButton();
      return;
    }
    let mm = String(Math.floor(time / 600)).padStart(2, "0");
    let ss = String(Math.floor(time / 30)).padStart(2, "0");
    let result = mm + ":" + ss;
    document.getElementById("timeLimit").innerText = result;
    time--;
  }, 50);
};

$(function () {
    let code;

    $("#sendMessage").click(function () {
        const phoneNum = $('#checkPhoneNuminput').val();

        if (phoneValidator(phoneNum)) {
            alert("인증번호가 발송되었습니다.");
            $.ajax({
                type: "GET",
                url: "/join/sendSMS",
                data: {phoneNum: phoneNum},

                success: function(data) {
                    code = data;
                    $("#checkPhoneNuminput").attr("readonly", true);
                    $("#sendMessage").attr("disabled", true);
                    $("#certiNum").attr("disabled", false);
                },
                error: function () {
                    console.log("ajax 통신 실패");
                },
            });
        } else {
            alert("유효하지 않는 전화번호입니다.");
        }
    });

    $("#completion").click(function () {
        const authCode = $("#certiNum").val();
        if (authCode === "" || !authCode) {
            return;
        }

        if (authCode === code) {
            alert("인증에 성공하였습니다.");
            $("#certiNum").attr("disabled", true);
            $("#certiNum").attr("readonly", true);
        } else {
            alert("인증번호가 일치하지 않습니다. 다시 시도하세요.");
        }
    });
});



function checkCompletion() {
  alert("문자 인증이 완료되었습니다.");
  initButton();
}




//글자수 증가
function counter(text,length) {
    var limit = length;
    var str = text.value.length;
    if(str>limit) {
        document.getElementById("reCount").innerHTML = "1500자 이상 입력했습니다.";
        text.value=text.value.substring(0,limit);
        text.focus();
    }
    document.getElementById("reCount").innerHTML = str + " 자 / 최대 " + limit + " 자";
    if(str>0) {
        submitBtnActive();
    } else {
        submitBtnDisabled();
    }
}



//뒤로 버튼 경고창 날라기
function goBack(){
    var result = confirm("지금 뒤로 가기 버튼을 누르면, 현재까지 작성한 내용들이 사라집니다.");
    if (result == true){
        alert("예약 페이지로 넘어갑니다.");
        window.history.back();
    } else {
        alert("상담 페이지에 머무릅니다.");
    }
}

function submitBtnActive(){
      $("#submitBtn").attr("disabled", false);
}

function submitBtnDisabled() {
      $("#submitBtn").attr("disabled", true);
};

// function test5(e) {
//   const value = document.getElementById("checkPhoneNuminput").value;
//   console.log(value);
//   let regExp = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
//   if (regExp.test(value)) {
//     alert("확인되었습니다");
//   } else {
//     alert("다시 한 번 확인해주세요");
//     e.preventDefault();
//   }
// }

// $(function onCheck() {
//   var com = document.querySelector(".completionbutton");
//   var tc = document.querySelector(".disnone");

//   function () {
//     $(com).click(function () {
//       $(tc).css({ opacity: 1 });
//     });
//   };
// })

// $(function () {
//   var patternPhone = /^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/;
//   var phone = document.querySelector("#checkPhoneNuminput").value;
//   $("#checkPhoneNuminput").keydown(function () {
//     if (!patternPhone.test(phone)) {
//       alert("핸드폰 번호를 확인 해주세요");
//       return false;
//     }
//   });
// });

// function checkPhoneNum(){
//     const phone = document.getElementById("checkPhoneNuminput").value;
//     if (phone.length === 13 ){
//         document.getElementById("sendMessage").Disabled = false;
//     }
// }

// $(function(){
//     $("#certiBtn").click(function(){
//         $("#modalLink").slideDown(2000);
//     })
// })
