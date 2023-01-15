package com.kh.lawservice101.knowledgein.model.service;

import com.kh.lawservice101.knowledgein.model.dao.InBoardDao;
import com.kh.lawservice101.knowledgein.model.vo.InBoardVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class InBoardServiceImpl implements InBoardService {
    private final InBoardDao inBoardDao;

    @Override
    public void postInBoard(InBoardVo inBoardVo){
    inBoardDao.inBoardUpload(inBoardVo);
    }
}
