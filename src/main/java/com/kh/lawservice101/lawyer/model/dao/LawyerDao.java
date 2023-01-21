package com.kh.lawservice101.lawyer.model.dao;

import com.github.pagehelper.Page;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import com.kh.lawservice101.lawyer.model.vo.SearchCon;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface LawyerDao {

    //변호사 로그인
    LawyerVo lawyerLogin(LawyerVo lawyerVo);

    //변호사 가입
    void insertLawyer(LawyerVo lawyerVo);

    //변호사 업데이트
    int updateLawyer(LawyerVo lawyerPram);

    //변호사 단건 조회
    LawyerVo selectLawyerVo(LawyerVo lawyerPram);

    //변호사 단건 조회
    LawyerVo selectLawyer(Long lawyerNum);

    //변호사 목록
    ArrayList<LawyerVo> selectAllLawyers();

    LawyerVo selectLawyerByEmail(String email);

    LawyerVo selectLawyerByIdAndEmail(String id, String email);

    void updatePassword(String tempPwd, Long lawyerNum);

    Page<LawyerVo> selectLawyerByKeyword(SearchCon searchCon);
    
    // 개인정보 수정
    void updateInfo(Long lawyerNum, String lawyerEmail, String lawyerName);

    // 프로필 수정
    void updateProfile(Long lawyerNum, String lawyerImg, String lawyerMainImg, String lawyerIntroMsg, Long categoryNum);
}
