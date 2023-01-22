package com.kh.lawservice101.review.model.service;

import com.github.pagehelper.Page;
import com.kh.lawservice101.payment.model.vo.PaymentVo;
import com.kh.lawservice101.review.model.vo.ReviewVo;

import java.util.List;

public interface ReviewService {
    // 리뷰 저장
    void saveReview(ReviewVo reviewVo, PaymentVo paymentVo);

    // 변호사 리뷰 목록 조회
    List<ReviewVo> findReviewListByLawyerNum(Long lawyerNum);

    // 페이징 리뷰 목록
    List<ReviewVo> pagingReview(Long lawyerNum, int pageNum, int pageSize);
}
