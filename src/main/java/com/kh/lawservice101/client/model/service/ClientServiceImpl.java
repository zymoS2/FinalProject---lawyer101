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


    //의뢰인 로그인
    @Override
    public ClientVo findClientIdPw(ClientVo clientVo) {
       return clientDao.clientLogin(clientVo);

    }
    //의뢰인 가입
    @Override
    public void saveClient(ClientVo clientVo) {
        clientDao.insertClient(clientVo);
    }

    //의뢰인 단건 조회
    @Override
    public ClientVo findClient(Long clientNum) {
        return clientDao.selectClient(clientNum);
    }

    //의뢰인 목록 조회
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

    // 비밀번호 변경
    @Override
    public void passwordModify(String password, Long clientNum) {
        clientDao.updatePassword(password, clientNum);
    }

    // 개인정보 수정
    @Override
    public void editInfo(Long clientNum, String clientEmail, String clientName) {
        clientDao.updateInfo(clientNum, clientEmail, clientName);
    }
}
