package com.kh.lawservice101.review.model.service.impl;

import com.kh.lawservice101.payment.model.vo.PaymentVo;
import com.kh.lawservice101.review.model.dao.ReviewDao;
import com.kh.lawservice101.review.model.service.ReviewService;
import com.kh.lawservice101.review.model.vo.ReviewVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {
    private final ReviewDao reviewDao;

    // 리뷰 저장
    @Override
    public void saveReview(ReviewVo reviewVo, PaymentVo paymentVo) {
        reviewVo.setPaymentVo(paymentVo);
        reviewVo.setLawyerVo(paymentVo.getBookingVo().getLawyerVo());
        reviewVo.setClientVo(paymentVo.getBookingVo().getClientVo());
        reviewDao.insertReview(reviewVo);
    }
}
