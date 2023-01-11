package com.kh.lawservice101.test.model.service;

import com.kh.lawservice101.test.model.dao.TestDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class TestServiceImpl implements TestService{

    private final TestDAO testDAO;

    @Override
    public void join(String id, String password) {
        testDAO.insertTestVO(id, password);
    }
}
