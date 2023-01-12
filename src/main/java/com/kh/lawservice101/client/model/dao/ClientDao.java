package com.kh.lawservice101.client.model.dao;

import com.kh.lawservice101.client.model.vo.ClientVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface ClientDao {
    //의뢰인 가입
    void insertClient(ClientVo clientVo);

    //의뢰인 단건
    ClientVo selectClient(Long clientNum);

    //의뢰인 목록
    ArrayList<ClientVo> selectAllClients();



}
