package com.kh.lawservice101.lawyer.model.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.kh.lawservice101.lawyer.model.dao.LawyerDao;
import com.kh.lawservice101.lawyer.model.vo.SearchCon;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@RequiredArgsConstructor
@Service
public class LawyerServiceImpl implements LawyerService {

    private final LawyerDao lawyerDao;

    //변호사 로그인
    @Override
    public LawyerVo findLawyerIdPwd(LawyerVo lawyerVo){
        return lawyerDao.lawyerLogin(lawyerVo);
    }
    //변호사 가입
    @Override
    public void saveLawyer(LawyerVo lawyerVo) {
        lawyerDao.insertLawyer(lawyerVo);
    }

    //변호사 업데이트
    @Override
    public int updateLawyer(LawyerVo lawyerPram) {
        //실행하고 바로 반환
        return lawyerDao.updateLawyer(lawyerPram);
    }

    //변호사 단건 조회
    @Override
    public LawyerVo findLawyer(LawyerVo lawyerPram) {
        return lawyerDao.selectLawyerVo(lawyerPram);
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

    @Override
    public LawyerVo findLawyerByEmail(String email) {
        return lawyerDao.selectLawyerByEmail(email);
    }

    @Override
    public LawyerVo findLawyerByIdAndEmail(String resetPwdId, String resetPwdEmail) {
        return lawyerDao.selectLawyerByIdAndEmail(resetPwdId, resetPwdEmail);
    }

    @Override
    public void passwordModify(String tempPwd, Long lawyerNum) {
        lawyerDao.updatePassword(tempPwd, lawyerNum);
    }

    @Override
    public Page<LawyerVo> pagingLawyer(SearchCon searchCon) {
        PageHelper.startPage(searchCon);
        return lawyerDao.selectLawyerByKeyword(searchCon);
    }
}
