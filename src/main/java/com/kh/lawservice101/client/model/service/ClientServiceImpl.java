package com.kh.lawservice101.client.model.service;

import com.kh.lawservice101.client.model.dao.ClientDao;
import com.kh.lawservice101.client.model.vo.ClientVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
@RequiredArgsConstructor
public class ClientServiceImpl implements ClientService {

    private final ClientDao clientDao;

    //변호사 단건 조회
    @Override
    public ClientVo findClient(Long clientNum) {
        return clientDao.selectClient(clientNum);
    }

    //변호사 목록 조회
    @Override
    public ArrayList<ClientVo> findAllClients() {
        return clientDao.selectAllClients();
    }

    @Override
    public ClientVo findClientByEmail(String email) {
        return clientDao.selectClientByEmail(email);
    }

    @Override
    public ClientVo findClientByIdAndEmail(String resetPwdId, String resetPwdEmail) {
        return clientDao.selectClientByIdAndEmail(resetPwdId, resetPwdEmail);
    }

    @Override
    public void passwordModify(String tempPwd, Long clientNum) {
        clientDao.updatePassword(tempPwd, clientNum);
    }


}
