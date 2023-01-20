package com.kh.lawservice101.review.model.dao;

import com.kh.lawservice101.review.model.vo.ReviewVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewDao {
    void insertReview(ReviewVo reviewVo);
}
