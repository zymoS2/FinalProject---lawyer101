function btnActive(frm){
    if(frm.checkButton.disabled==true){ //비활성상태라면
        frm.checkButton.disabled=false;
    }else{
        frm.checkButton.disabled=true;
    }
}


function payMethod() {
    var payment = document.getElementsByName('payment');
    var paymentMethod;

    for(var i = 0 ; i < payment.length; i++){
        if(payment[i].checked) {
            paymentMethod = payment[i].value;
            console.log("paymentMethod : " + paymentMethod);
//            $("#paymentVal").value(payment[i].value)
        }
    }
    return paymentMethod;

}

//결제
var today = new Date();
var hours = today.getHours();
var minutes = today.getMinutes();
var seconds = today.getSeconds();
var milliseconds = today.getMilliseconds();
var makeMerchantUid = hours + minutes + seconds + milliseconds ;

var paymentMethod="";

//결제 - 카드
function requestCard(params) {
    const IMP = window.IMP;
    IMP.init("imp12435215");

    IMP.request_pay({
      pg: "html5_inicis",
      pay_method: "card",
      merchant_uid: "merchant_" + makeMerchantUid,
      name: params.lawyerName + " 변호사 [일시 : " + params.bookingDate + " ]" ,
      amount: 200,
      buyer_email: "okmail@mail.com",
      buyer_name: "다솜3",
      buyer_tel: "010-3333-3333"

    },function (rsp) { //승인
       if (rsp.success) {

          params.impUid = rsp.imp_uid;
          params.merchantUid =  rsp.merchant_uid;
          params.buyerName = rsp.buyer_name;
          params.paidAmount = rsp.paid_amount;
          params.paidAt = rsp.paid_at;
          params.paymentState = rsp.status;
          params.payMethod = rsp.pay_method;


            //결제 검증
            $.ajax({
                url :"/verifyIamport/" + rsp.imp_uid,
                type:"post"
            }).done(function(result){
                if(rsp.paid_amount === result.response.amount){
                    console.log(result.response);
                    paymentComplete(params);

                } else {
                    alert ("결제에 실패하였습니다.");
                }
            })
      } else { //승인 거부
          var msg = '결제에 실패하였습니다. \n';
          msg += '  에러내용 : ' + rsp.error_msg +"\n";

          alert(msg);
          location.href="/payment/pay";
      }
  });
}

//결제 - 카카오
function requestKakaoPay(params) {
    const IMP = window.IMP;
    IMP.init("imp12435215");

    IMP.request_pay({
      pg: "kakaopay",
      pay_method: "kakaopay",
      merchant_uid: "merchant_" + makeMerchantUid,
      name: params.lawyerName + " 변호사 [일시 : " + params.bookingDate + " ]" ,
      amount: 200,
      buyer_email: "okmail@mail.com",
      buyer_name: "다솜3",
      buyer_tel: "010-3333-3333"

    },function (rsp) { //승인
       if (rsp.success) {

          params.impUid = rsp.imp_uid;
          params.merchantUid =  rsp.merchant_uid;
          params.buyerName = rsp.buyer_name;
          params.paidAmount = rsp.paid_amount;
          params.paidAt = rsp.paid_at;
          params.paymentState = rsp.status;
          params.payMethod = rsp.pay_method;


            //결제 검증
            $.ajax({
                url :"/verifyIamport/" + rsp.imp_uid,
                type:"post"
            }).done(function(result){
                if(rsp.paid_amount === result.response.amount){
                    console.log(result.response);
                    paymentComplete(params);

                } else {
                    alert ("결제에 실패하였습니다.");
                }
            })
      } else { //승인 거부
          var msg = '결제에 실패하였습니다. \n';
          msg += '  에러내용 : ' + rsp.error_msg +"\n";

          alert(msg);
          location.href="/payment/pay";
      }
  });
}

//DB에 값 넣기
function paymentComplete(params) {
      $.ajax({
          url : "/payment/pay-complete",
          type : "post",
          data : {
                  "impUid" : params.impUid,  //아임포트 고유 결제번호
                  "merchantUid" : params.merchantUid, //주문번호
                  "payMethod" : params.payMethod, //결제수단 구분코드
                  "paymentState" : params.paymentState //결제상태
                 }
      }).done(function(result){
         if (result) {
              var msg = "결제가 완료되었습니다. \n" ;
                  msg += "주문 번호 : " + params.merchantUid +"\n";
                  msg += "주문자명 : " + params.buyerName +"\n";
                  msg += "결제 금액 : " + params.paidAmount +"\n";
                  msg += "결제 승인 시각 : " + params.paidAt +"\n";

              alert (msg);
              location.href="/mypage/reservation-list";
         }
      }).fail(function() {
               console.log("통신 실패");
         })
}




