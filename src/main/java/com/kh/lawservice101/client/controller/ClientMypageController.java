package com.kh.lawservice101.client.controller;

import com.kh.lawservice101.booking.model.service.BookingService;
import com.kh.lawservice101.booking.model.vo.BookingVo;
import com.kh.lawservice101.payment.model.service.PaymentService;
import com.kh.lawservice101.payment.model.vo.PaymentVo;
import kotlin.collections.FloatIterator;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping ("/mypage")
@RequiredArgsConstructor
public class ClientMypageController {

    private final PaymentService paymentService;
    private final BookingService bookingService;

    List<PaymentVo> clientPaymentList =null ;

   @GetMapping("/reservation-list")
   public String bookingList(Model model){

       //임시 (세션으로 바꿔줄것)
       Long clientNum = 2L;
       clientPaymentList = paymentService.findPaymentList(clientNum);
      // for (PaymentVo paymentVo : clientPaymentList) {
      //     String bookingDate = paymentVo.getBookingVo().getBookingDate();
      //     SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
      //     String newBookingDate = format.format(bookingDate);
      //     paymentVo.getBookingVo().setBookingDate(newBookingDate);
      // }

       model.addAttribute("clientPaymentList",clientPaymentList);

      // System.out.println("clientPaymentList : " + clientPaymentList );

       //현재 시간 구하기
       SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
       Date now = new Date();
       String nowDt = format.format(now);
       model.addAttribute("nowDt",nowDt);

       //System.out.println("nowDt:"+nowDt);

       //가장 최신의 상담 예약 목록
       BookingVo latestBooking = bookingService.findLatestBooking(clientNum);
       //System.out.println("최근 : " + latestBooking);
       model.addAttribute("latestBooking",latestBooking);

       return "mypage/reservationList";
   }

}
