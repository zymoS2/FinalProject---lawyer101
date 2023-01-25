package com.kh.lawservice101.review.controller;

import com.kh.lawservice101.booking.model.vo.BookingVo;
import com.kh.lawservice101.client.model.vo.ClientVo;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import com.kh.lawservice101.payment.model.service.PaymentService;
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
    private final PaymentService paymentService;

    // 리뷰 작성 화면
    @GetMapping("/write/{num}")
    public String reviewForm(@SessionAttribute(value = "client", required = false) ClientVo loginClient,
                             @PathVariable Long num, Model model) {
        PaymentVo paymentVo = paymentService.findPayment(num);
        if (loginClient == null || loginClient.getClientNum() != paymentVo.getBookingVo().getClientVo().getClientNum()) {
            return "redirect:/";
        }

        model.addAttribute("paymentVo", paymentVo);

        return "review/review";
    }

    // 리뷰 작성
    @PostMapping("/write/{num}")
    public String reviewSave(@PathVariable Long num, @ModelAttribute ReviewVo reviewVo) {
        PaymentVo paymentVo = paymentService.findPayment(num);

        reviewService.saveReview(reviewVo, paymentVo);
        return "redirect:/product/detail/" + paymentVo.getBookingVo().getLawyerVo().getLawyerNum();
    }
}
