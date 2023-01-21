package com.kh.lawservice101.review.model.service;

import com.kh.lawservice101.payment.model.vo.PaymentVo;
import com.kh.lawservice101.review.model.vo.ReviewVo;

public interface ReviewService {
    // 리뷰 저장
    void saveReview(ReviewVo reviewVo, PaymentVo paymentVo);
}
