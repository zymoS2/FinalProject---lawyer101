package com.kh.lawservice101.lawyer.model.dao;

import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface LawyerDao {
    //변호사 가입
    void insertLawyer(LawyerVo lawyerVo);

    //변호사 목록
    LawyerVo selectLawyer(Long lawyerNum);
    //변호사 목록
    ArrayList<LawyerVo> selectAllLawyers();
}
