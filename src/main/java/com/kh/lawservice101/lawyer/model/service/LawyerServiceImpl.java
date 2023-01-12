package com.kh.lawservice101.lawyer.model.service;

import com.kh.lawservice101.lawyer.model.dao.LawyerDao;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@RequiredArgsConstructor
@Service
public class LawyerServiceImpl implements LawyerService {

    private final LawyerDao lawyerDao;

    //변호사 가입
    @Override
    public void saveLawyer(LawyerVo lawyerVo) {
        lawyerDao.insertLawyer(lawyerVo);
    }

    //변호사 단건 조회
    @Override
    public LawyerVo findLawyer(Long lawyerNum) {
        return lawyerDao.selectLawyer(lawyerNum);
    }

    //변호사 목록 조회
    @Override
    public ArrayList<LawyerVo> findAllLawyers() {
        return lawyerDao.selectAllLawyers();
    }
}
