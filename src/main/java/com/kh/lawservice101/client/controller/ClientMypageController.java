package com.kh.lawservice101.client.controller;

import com.kh.lawservice101.booking.model.service.BookingService;
import com.kh.lawservice101.booking.model.vo.BookingVo;
import com.kh.lawservice101.client.model.service.ClientService;
import com.kh.lawservice101.client.model.vo.ClientVo;
import com.kh.lawservice101.payment.model.service.PaymentService;
import com.kh.lawservice101.payment.model.vo.PaymentVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping ("/mypage")
@RequiredArgsConstructor
public class ClientMypageController {

    private final PaymentService paymentService;
    private final BookingService bookingService;
    private final ClientService clientService;

    List<PaymentVo> clientPaymentList =null ;

   @GetMapping("/reservation-list/{num}")
   public String bookingList(@SessionAttribute(value = "client", required = false) ClientVo loginClient,
                             @PathVariable("num") Long clientNum, Model model){
       ClientVo client = clientService.findClient(clientNum);
       if (loginClient == null || loginClient.getClientNum() != client.getClientNum()) {
           return "redirect:/";
       }

       clientPaymentList = paymentService.findPaymentList(clientNum);
       model.addAttribute("clientPaymentList",clientPaymentList);

       SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
       Date now = new Date();
       String nowDt = format.format(now);
       model.addAttribute("nowDt",nowDt);

       System.out.println("nowDt:"+nowDt);

       //가장 최신의 상담 예약 목록
       BookingVo latestBooking = bookingService.findLatestBooking(clientNum);
       System.out.println("최근 : " + latestBooking);
       model.addAttribute("latestBooking",latestBooking);

       return "mypage/reservationList";
   }

    // 마이페이지
    @GetMapping("/{num}")
    public String myPage(@SessionAttribute(value = "client", required = false) ClientVo loginClient, @PathVariable Long num, Model model) {
        ClientVo client = clientService.findClient(num);
        if (loginClient == null || loginClient.getClientNum() != client.getClientNum()) {
            return "redirect:/";
        }
        model.addAttribute("client", client);
        return "mypage/clientMyPage";
    }

    // 개인정보 수정
    @PostMapping("/{num}")
    public String editInfo(@PathVariable Long num, @RequestParam String clientEmail, @RequestParam String clientName) {
        clientService.editInfo(num, clientEmail, clientName);

        return "redirect:/mypage/" + num;
    }

    // 비밀번호 변경
    @PostMapping("/{num}/pwdModify")
    @ResponseBody
    public Boolean pwdModify(@PathVariable Long num, @RequestParam String currPwd,
                                 @RequestParam String editPwd) {
        ClientVo client = clientService.findClient(num);
        if (client.getClientPwd().equals(currPwd)) {
            clientService.passwordModify(editPwd, num);
            return true;
        }
        return false;
    }
}
