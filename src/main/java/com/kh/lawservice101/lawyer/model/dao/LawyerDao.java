package com.kh.lawservice101.lawyer.model.dao;

import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface LawyerDao {

    LawyerVo selectLawyer(Long lawyerNum);

    ArrayList<LawyerVo> selectAllLawyers();

    LawyerVo selectLawyerByEmail(String email);
}
