function checkPhoneNum(){
    const phone = document.getElementById("checkPhoneNuminput").value;
    if (phone.length === 13 ){
        document.getElementById("sendMessage").disabled = false;
            $(function(){
            $("#certiBtn").click(function(){
                $("#modalLink").slideDown(2000);
            })
        })
    }
}

function initButton(){
    document.getElementById("sendMessage").disabled = true;
    document.getElementById("completion").disabled = true;
}

let processId = -1 ;

const getToken = () => {
    document.getElementById("completion").disabled = false;
    if (processId != -1) clearInterval(processID);
        let time = 180;
        processID = setInterval(function () {
            if (time < 0 || document.getElementById("sendMessage").disabled) {
            clearInterval(processID);
            initButton();
            return;
            }
            let mm = String(Math.floor(time / 60)).padStart(2, "0");
            let ss = String(time % 60).padStart(2, "0");
            let result = mm + ":" + ss;
            document.getElementById("timeLimit").innerText = result;
            time--;
        }, 50);
        };


function checkCompletion(){
    alert("문자 인증이 완료되었습니다.");
    initButton();
}

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

