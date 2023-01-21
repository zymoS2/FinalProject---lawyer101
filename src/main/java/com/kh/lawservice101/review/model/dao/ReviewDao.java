package com.kh.lawservice101.review.model.dao;

import com.kh.lawservice101.review.model.vo.ReviewVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewDao {
    // 리뷰 저장
    void insertReview(ReviewVo reviewVo);
}
