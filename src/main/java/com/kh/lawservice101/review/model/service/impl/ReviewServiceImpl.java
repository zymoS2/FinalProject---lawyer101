package com.kh.lawservice101.review.model.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.kh.lawservice101.payment.model.vo.PaymentVo;
import com.kh.lawservice101.review.model.dao.ReviewDao;
import com.kh.lawservice101.review.model.service.ReviewService;
import com.kh.lawservice101.review.model.vo.ReviewVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

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

    // 변호사 리뷰 목록 조회
    @Override
    public List<ReviewVo> findReviewListByLawyerNum(Long lawyerNum) {
        return reviewDao.selectReviewByLawyerNum(lawyerNum);
    }

    // 페이징 리뷰 목록
    @Override
    public List<ReviewVo> pagingReview(Long lawyerNum, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return reviewDao.selectReviewByLawyerNum(lawyerNum);
    }
}
