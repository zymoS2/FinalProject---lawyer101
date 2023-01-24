
const regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
const emailtext = document.querySelector("#email").value;

console.log(emailtext);
// $("#email").on("keyup", function(){
//     if (regExp.test(emailtext) !== "") {
//         $(".emailscript1").hide();
//         console.log(emailtext);
//     } else if(!regExp.test(emailtext)){
//         $(".emailscript2").show();
//         alert("형식을 맞춰주세요");
//     } 
// });