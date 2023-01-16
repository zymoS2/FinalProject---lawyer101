package com.kh.lawservice101.client.model.service;

import com.kh.lawservice101.client.model.vo.ClientVo;

import java.util.ArrayList;

public interface ClientService {
    ClientVo findClient(Long clientNum);


    //변호사 목록 조회
    ArrayList<ClientVo> findAllClients();

    ClientVo findClientByEmail(String email);

    ClientVo findClientByIdAndEmail(String resetPwdId, String resetPwdEmail);

    void passwordModify(String tempPwd, Long clientNum);
}
