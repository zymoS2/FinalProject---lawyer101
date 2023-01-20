package com.kh.lawservice101.client.model.service;

import com.kh.lawservice101.client.model.vo.ClientVo;

import java.util.ArrayList;

public interface ClientService {

    //의뢰인 로그인
    ClientVo findClientIdPw(ClientVo clientVo);

    //의뢰인 가입
    void saveClient(ClientVo clientVo);

    //의뢰인 단건 조회
    ClientVo findClient(Long clientNum);

    //의뢰인 목록 조회
    ArrayList<ClientVo> findAllClients();


    ClientVo findClientByEmail(String email);

    ClientVo findClientByIdAndEmail(String resetPwdId, String resetPwdEmail);

    void passwordModify(String tempPwd, Long clientNum);

    void editInfo(ClientVo findClient, ClientVo clientVo);
}
