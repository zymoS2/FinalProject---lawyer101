package com.kh.lawservice101.client.model.service;

import com.kh.lawservice101.client.model.vo.ClientVo;

import java.util.ArrayList;

public interface ClientService {

    //의뢰인 가입
    void saveClient(ClientVo clientVo);

    //의뢰인 단건 조회
    ClientVo findClient(Long clientNum);

    //의뢰인 목록 조회
    ArrayList<ClientVo> findAllClients();


}
