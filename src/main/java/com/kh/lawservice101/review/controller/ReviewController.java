package com.kh.lawservice101.review.controller;

import com.kh.lawservice101.booking.model.vo.BookingVo;
import com.kh.lawservice101.client.model.service.ClientService;
import com.kh.lawservice101.client.model.vo.ClientVo;
import com.kh.lawservice101.lawyer.model.service.LawyerService;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import com.kh.lawservice101.payment.model.vo.PaymentVo;
import com.kh.lawservice101.review.model.service.ReviewService;
import com.kh.lawservice101.review.model.vo.ReviewVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/review")
@Slf4j
public class ReviewController {

    private final ReviewService reviewService;

    private final ClientService clientService;
    private final LawyerService lawyerService;

    @GetMapping("/write/{num}")
    public String reviewForm(@PathVariable Long num, Model model) {

        // 임시
        LawyerVo lawyer = lawyerService.findLawyer(1L);
        ClientVo client = clientService.findClient(1L);
        PaymentVo paymentVo = new PaymentVo(1L, 'Y', 30000, new BookingVo(1L, "2022-12-01", "test", "15", client, lawyer));

        model.addAttribute("paymentVo", paymentVo);

        return "review/review";
    }

    @PostMapping("/write/{num}")
    public String reviewSave(@PathVariable Long num, @ModelAttribute ReviewVo reviewVo) {

        // 임시
        LawyerVo lawyer = lawyerService.findLawyer(1L);
        ClientVo client = clientService.findClient(1L);
        PaymentVo paymentVo = new PaymentVo(1L, 'Y', 30000, new BookingVo(1L, "2022-12-01", "test", "15", client, lawyer));

        reviewVo.setPaymentVo(paymentVo);
        reviewVo.setClientVo(paymentVo.getBookingVo().getClientVo());
        reviewVo.setLawyerVo(paymentVo.getBookingVo().getLawyerVo());

        reviewService.saveReview(reviewVo);
        return "redirect:/";
    }
}
