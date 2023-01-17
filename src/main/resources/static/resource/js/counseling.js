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

function checkCompletion() {
  alert("문자 인증이 완료되었습니다.");
  initButton();
}

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
