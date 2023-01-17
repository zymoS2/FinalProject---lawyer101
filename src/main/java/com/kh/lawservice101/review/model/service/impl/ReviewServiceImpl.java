package com.kh.lawservice101.review.model.service.impl;

import com.kh.lawservice101.review.model.dao.ReviewDao;
import com.kh.lawservice101.review.model.service.ReviewService;
import com.kh.lawservice101.review.model.vo.ReviewVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {
    private final ReviewDao reviewDao;
    @Override
    public void saveReview(ReviewVo reviewVo) {
        reviewDao.insertReview(reviewVo);
    }
}
