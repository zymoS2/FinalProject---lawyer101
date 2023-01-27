$(function () {
    let email = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
    let id = /^[a-z]+[a-z0-9]{6,10}$/g;
    let name = /^[a-zA-Zㄱ-힣][a-zA-Zㄱ-힣 ]{1,16}$/;
    let password = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,12}$/;
    let phone = /01[016789][0-9]{4}[0-9]{4}/;
    let lawyerCer = /^[0-9]+$/; 

    $("#email").on("keyup", function () {
      var value = document.querySelector("#email").value;
      if (email.test(value)) {
        $(".lawyerEmail").css({ opacity: 0 });
      } else {
        $(".lawyerEmail").css({ opacity: 1 });
      }
    });
  
    $("#id").on("keyup", function () {
      var value = document.querySelector("#id").value;
      if (id.test(value)) {
        $(".lawyerId").css({ opacity: 0 });
      } else {
        $(".lawyerId").css({ opacity: 1 });
      }
    });
  
    $("#name").on("keyup", function () {
      var value = document.querySelector("#name").value;
      if (name.test(value)) {
        $(".lawyerName").css({ opacity: 0 });
      } else {
        $(".lawyerName").css({ opacity: 1 });
      }
    });
  
    $("#password").on("keyup", function () {
      var value = document.querySelector("#password").value;
      if (password.test(value)) {
        $(".lawyerPassword").css({ opacity: 0 });
      } else {
        $(".lawyerPassword").css({ opacity: 1 });
      }
    });
  
    $("#password-confirm").on("keyup", function () {
      var value2 = document.querySelector("#password").value;
      var value = document.querySelector("#password-confirm").value;
      if (value != value2) {
        $(".lawyerPasswordConfirm").css({ opacity: 1 });
      } else{
        $(".lawyerPasswordConfirm").css({ opacity: 0 });
      }
    });
  
    $("#phone").on("keyup", function () {
      let value = document.querySelector("#phone").value;
      console.log(value);
      if (phone.test(value)) {
        $(".lawyerPhoneText1").css({ opacity: 0 });
        $('.phoneButton').prop('disabled', false);
      } else {
        $(".lawyerPhoneText1").css({ opacity: 1 });
        $(".lawyerPhoneText").hide();
        $('.phoneButton').prop('disabled', true);
      }
    });


      $(document).on("click","input:checkbox[name=chkAll]",function(){
        var chkAt = '';
    
        if ($(this).prop('checked')) {
            chkAt = 'Y';
        } else {
            chkAt = 'N';
        }
        
        if(chkAt == 'Y'){ 
            $("input:checkbox[name=chkAgree]").prop('checked', true);
            $("input:checkbox[name=chkAgreeSelect]").prop('checked', true);
            // $(".lawyerButton").prop('disabled', false)
            
        } else {
            $("input:checkbox[name=chkAgree]").prop('checked', false);
            $("input:checkbox[name=chkAgreeSelect]").prop('checked', false);
            // $(".lawyerButton").prop('disabled', true)
        }
    });
      
    $(document).on("click","input:checkbox[name=chkAgree]",function(){
        var chkAt = '';
    
        $("input:checkbox[name=chkAgree]").each(function() {
            if($(this).prop('checked')){
                chkAt = 'Y';
                $(".lawyerButton").prop('disabled', false)
            } else {
                chkAt = 'N';
                $(".lawyerButton").prop('disabled', true)
                return false;
            }
        });
        
        if(chkAt == 'Y'){
            $("input:checkbox[name=chkAll]").prop('checked', true);
        } else {
            $("input:checkbox[name=chkAll]").prop('checked', false);
        }
        
    
        // var chkAll = $('input:checkbox[id="chkAll"]').is(":checked");
        // var chk = $('input:checkbox[id="chk"]').is(":checked");
        // var chk1 = $('input:checkbox[id="chk1"]').is(":checked");
        // var chk2 = $('input:checkbox[id="chk2"]').is(":checked");
    
        // if((chk && chk1 && chk2) || chkAll == true){
        //   $(".lawyerButton").prop('disabled', false)
        // } else{
        //   $(".lawyerButton").prop('disabled', true)
        // }
    
      });
    
      $(".spinnerButton").on("click", function(){
        $(".spinningDisplay").show();
        $(".spinnerText").hide()
  
        setTimeout(function(){
          $(".spinningDisplay").css({ opacity: 0 });
          alert("인증되었습니다!");
        }, 2000)
      })


      $(".scriptCommonText").on("keyup", function(){

        var value = document.querySelector("#email").value;
        var value1 = document.querySelector("#id").value;
        var value2 = document.querySelector("#name").value;
        var value3 = document.querySelector("#password").value;
        var value5 = document.querySelector("#password-confirm").value;
        var value6 = document.querySelector("#phone").value;
  
        if(email.test(value) && id.test(value1) && name.test(value2) && password.test(value3) == password.test(value5) 
        && phone.test(value6)){
          $("#chkAll").click(function(){
            if($("#chkAll").prop("checked", true)) {
              $("input:checkbox").prop('checked', true);
              $(".lawyerButton").attr('disabled', false);
            } else {
              $("input:checkbox").prop('checked', false);
              $(".lawyerButton").attr('disabled', true);
            }
          })
                var chkAll = $('input:checkbox[id="chkAll"]').is(":checked");
        var chk = $('input:checkbox[id="chk"]').is(":checked");
        var chk1 = $('input:checkbox[id="chk1"]').is(":checked");
        var chk2 = $('input:checkbox[id="chk2"]').is(":checked");
    
        if((chk && chk1 && chk2) || chkAll == true){
          $(".lawyerButton").prop('disabled', false)
        } else{
          $(".lawyerButton").prop('disabled', true)
        }
          
  
        }else{
          $(".lawyerButton").prop('disabled', true)
        }
      });
  
          // $(".accept_btn").click(function() {
          //   if($("input[name='chkAgree']:checked").length == 3) {
          //     $(".lawyerButton").attr('disabled', false)
          //   } else {
          //     $(".lawyerButton").attr('disabled', true)
          //   }
          // })
  
          


    });

    


    // $(".accept_btn").click(function() {
    //   if($("input[name='chkAgree']:checked").length == 3) {
    //     $(".lawyerButton").attr('disabled', false)
    //   } else {
    //     $(".lawyerButton").attr('disabled', true)
    //   }
    // })


    

