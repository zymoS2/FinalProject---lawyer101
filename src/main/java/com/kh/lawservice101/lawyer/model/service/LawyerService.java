package com.kh.lawservice101.lawyer.model.service;

import com.kh.lawservice101.lawyer.model.vo.LawyerVo;

import java.util.ArrayList;

public interface LawyerService {

    //변호사 단건 조회
    LawyerVo findLawyer(Long lawyerNum);


    //변호사 목록 조회
    ArrayList<LawyerVo> findAllLawyers();

    LawyerVo findLawyerByEmail(String email);

    LawyerVo findLawyerByIdAndEmail(String resetPwdId, String resetPwdEmail);

    void passwordModify(String tempPwd, Long lawyerNum);
}
