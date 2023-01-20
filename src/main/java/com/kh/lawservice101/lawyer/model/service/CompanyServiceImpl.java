package com.kh.lawservice101.lawyer.model.service;

import com.kh.lawservice101.lawyer.model.dao.CompanyDao;
import com.kh.lawservice101.lawyer.model.vo.CompanyVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CompanyServiceImpl implements CompanyService {
    private final CompanyDao companyDao;

    @Override
    public void saveCompany(CompanyVo companyPram) {
        companyDao.insertCompany(companyPram);
    }

    //회사 조회
    public CompanyVo findCompany(CompanyVo companyPram) {
        CompanyVo companyVo = companyDao.findCompany(companyPram);
        return companyVo;
    }
}
