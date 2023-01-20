package com.kh.lawservice101.lawyer.model.service;

import com.kh.lawservice101.lawyer.model.vo.CompanyVo;

public interface CompanyService {
    //회사 등록
    void saveCompany(CompanyVo companyPram);

    //회사 조회
    CompanyVo findCompany(CompanyVo companyPram);
}
