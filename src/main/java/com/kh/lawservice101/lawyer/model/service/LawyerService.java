package com.kh.lawservice101.lawyer.model.service;

import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;

public interface LawyerService {

    // 변호사 업데이트
    int updateLawyer(LawyerVo lawyerPram);

    //변호사 가입
    void saveLawyer(LawyerVo lawyerVo);

    //변호사 조회
    LawyerVo findLawyer(LawyerVo lawyerPram);

    //변호사 단건 조회
    LawyerVo findLawyer(Long lawyerNum);


    //변호사 목록 조회
    ArrayList<LawyerVo> findAllLawyers();


    LawyerVo findLawyerByEmail(String email);

    LawyerVo findLawyerByIdAndEmail(String resetPwdId, String resetPwdEmail);

    void passwordModify(String tempPwd, Long lawyerNum);

    void editInfo(LawyerVo findLawyer, LawyerVo lawyerVo);

    void editProfile(LawyerVo findLawyer, MultipartFile multipartFile, LawyerVo lawyerVo);
}
