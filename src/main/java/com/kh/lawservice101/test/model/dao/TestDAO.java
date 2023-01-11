package com.kh.lawservice101.test.model.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TestDAO {
    void insertTestVO(String id, String password);
}
