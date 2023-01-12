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
    public void  saveCompany(CompanyVo companyVo) {
        companyDao.insertCompany(companyVo);
    }
}
