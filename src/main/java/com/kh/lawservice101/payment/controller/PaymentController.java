package com.kh.lawservice101.payment.controller;


import com.kh.lawservice101.booking.model.vo.BookingVo;
import com.kh.lawservice101.payment.model.service.PaymentService;
import com.kh.lawservice101.payment.model.vo.PaymentVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/payment")
@RequiredArgsConstructor
public class PaymentController {

    private final PaymentService paymentService;

    //화면 뿌려주는 매핑
    @GetMapping("/pay")
    String orderPage(@SessionAttribute BookingVo bookingVo1, Model model ){
        model.addAttribute("lawyerName",bookingVo1.getLawyerVo().getLawyerName());
        String bookingDate = bookingVo1.getBookingDate() + "  , " + bookingVo1.getBookingTime() + " 시";
        model.addAttribute("bookingDate",bookingDate);
        model.addAttribute("categoryName",bookingVo1.getLawyerVo().getCategoryVo().getCategoryName());
        model.addAttribute("bookingVo1",bookingVo1);

        //로그인 상태의 세션으로.
       // model.addAttribute("clientName",);
       // model.addAttribute("clientEmail",);
       // model.addAttribute("clientPhone",);
        return "payment/checkInfo";
    }

    //
    @PostMapping("/pay-complete")
    @ResponseBody
    public boolean payComplete (@ModelAttribute PaymentVo paymentVo, @SessionAttribute BookingVo bookingVo1) {

        boolean result = false;

        if(paymentVo.getPaymentState().equals("paid")) {

            //임시
            System.out.println("PayMethod : "+paymentVo.getPayMethod());
            System.out.println("ImpUid : "+paymentVo.getImpUid());
            System.out.println("MerchantUid :"+paymentVo.getMerchantUid());
            System.out.println("paymentState : " +paymentVo.getPaymentState());
            System.out.println("내용 :"+ bookingVo1.getCounselingContent());
            System.out.println("변호사 생일 : " +bookingVo1.getLawyerVo().getLawyerBirthyy());
            System.out.println("클라이언트 메일"+ bookingVo1.getClientVo().getClientEmail());


            paymentService.savePayment(paymentVo, bookingVo1);
            result = true;
        }
        return result;
    }
}
