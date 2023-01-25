package com.kh.lawservice101.payment.controller;


import com.kh.lawservice101.booking.model.vo.BookingVo;
import com.kh.lawservice101.client.model.vo.ClientVo;
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
    String orderPage(@SessionAttribute(value="client") ClientVo clientvo, @SessionAttribute BookingVo bookingVo1, Model model ){
        model.addAttribute("lawyerName",bookingVo1.getLawyerVo().getLawyerName());
        String bookingDate = bookingVo1.getBookingDate() + "  , " + bookingVo1.getBookingTime() + " 시";
        model.addAttribute("bookingDate",bookingDate);
        model.addAttribute("categoryName",bookingVo1.getLawyerVo().getCategoryVo().getCategoryName());
        model.addAttribute("bookingVo1",bookingVo1);

        return "payment/checkInfo";
    }

    //
    @PostMapping("/pay-complete")
    @ResponseBody
    public boolean payComplete (@SessionAttribute(value = "client") ClientVo clientVo, @ModelAttribute PaymentVo paymentVo, @SessionAttribute BookingVo bookingVo1) {

        boolean result = false;

        bookingVo1.setClientVo(clientVo);
        //System.out.println(bookingVo1.getClientVo().getClientName());

        if(paymentVo.getPaymentState().equals("paid")) {
            paymentService.savePayment(paymentVo, bookingVo1);
            result = true;
        }
        return result;
    }

}
