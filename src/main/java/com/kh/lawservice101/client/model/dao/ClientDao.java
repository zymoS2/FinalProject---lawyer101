package com.kh.lawservice101.client.model.dao;

import com.kh.lawservice101.client.model.vo.ClientVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface ClientDao {
    //의뢰인 로그인
    ClientVo clientLogin(ClientVo clientVo);
    //의뢰인 가입
    void insertClient(ClientVo clientVo);

    //의뢰인 단건
    ClientVo selectClient(Long clientNum);

    //의뢰인 목록
    ArrayList<ClientVo> selectAllClients();



    ClientVo selectClientByEmail(String email);

    ClientVo selectClientByIdAndEmail(String id, String email);

    // 비밀번호 변경
    void updatePassword(String password, Long clientNum);

    // 개인정보 수정
    void updateInfo(Long clientNum, String clientEmail, String clientName);
}
