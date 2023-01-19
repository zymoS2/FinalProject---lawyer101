package com.kh.lawservice101.lawyer.controller;

import com.kh.lawservice101.booking.model.service.BookingService;
import com.kh.lawservice101.booking.model.vo.BookingVo;
import com.kh.lawservice101.payment.model.service.PaymentService;
import com.kh.lawservice101.payment.model.vo.PaymentVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.SimpleTimeZone;

@Controller
@RequiredArgsConstructor
@RequestMapping("/lawyerpage")
public class LawyerMypageController {

    private final PaymentService paymentService;
    private final BookingService bookingService;

    List<PaymentVo> LawyerCounselList = null;
    BookingVo counselDetail;


    //clientCounselList.jsp 로 가는
    @GetMapping("/counsel-list")
    public String counselList (Model model) {
        //임시
        Long lawyerNum = 4L;
        LawyerCounselList = paymentService.findPaymentList(lawyerNum);
        model.addAttribute("lawyerCounselList",LawyerCounselList);

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date now = new Date();
        String nowDt = format.format(now);
        model.addAttribute("nowDt",nowDt);

        System.out.println("nowDt:"+nowDt);

        //가장 최신의 상담 예약 목록
        BookingVo latestCounseling = bookingService.findLatestBooking(lawyerNum);
        System.out.println("최근 : " + latestCounseling);
        model.addAttribute("latestCounseling",latestCounseling);


        return "mypage/clientCounselList";
    }

    //clientCounselListDetail.jsp 로 가는
    @GetMapping("/{bookingNum}")
    public String counselListDetail(@PathVariable Long bookingNum, Model model) {
        counselDetail = bookingService.findCounselingDetail(bookingNum);
        model.addAttribute("counselDetail",counselDetail);
        return "mypage/clientCounselListDetail";
    }

}
