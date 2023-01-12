package com.kh.lawservice101.lawyer.model.service;

import com.kh.lawservice101.lawyer.model.dao.LawyerDao;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@RequiredArgsConstructor
@Service
public class LawyerServiceImpl implements LawyerService{

    private final LawyerDao lawyerDao;

    @Override
    public LawyerVo findLawyer(Long lawyerNum) {
        return lawyerDao.selectLawyer(lawyerNum);
    }

    @Override
    public ArrayList<LawyerVo> findAllLawyers() {
      return lawyerDao.selectAllLawyers();
    }
}
