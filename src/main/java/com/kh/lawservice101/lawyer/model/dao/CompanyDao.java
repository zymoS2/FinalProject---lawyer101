package com.kh.lawservice101.lawyer.model.dao;

import com.kh.lawservice101.lawyer.model.vo.CompanyVo;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface CompanyDao {
    //회사 등록
    void insertCompany(CompanyVo companyPram);

    //회사 조회
    CompanyVo findCompany(CompanyVo companyPram);
}


