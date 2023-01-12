package com.kh.lawservice101.lawyer.model.dao;

import com.kh.lawservice101.lawyer.model.vo.CompanyVo;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface CompanyDao {
    void insertCompany(CompanyVo companyVo);
}

