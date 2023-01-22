package com.kh.lawservice101.review.model.dao;

import com.kh.lawservice101.review.model.vo.ReviewVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReviewDao {
    // 리뷰 저장
    void insertReview(ReviewVo reviewVo);

    // 변호사 리뷰 목록 조회
    List<ReviewVo> selectReviewByLawyerNum(Long lawyerNum);
}
