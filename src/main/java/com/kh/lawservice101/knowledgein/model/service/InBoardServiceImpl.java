package com.kh.lawservice101.knowledgein.model.service;

import com.kh.lawservice101.knowledgein.model.dao.InBoardDao;
import com.kh.lawservice101.knowledgein.model.vo.InBoardVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
@RequiredArgsConstructor
public class InBoardServiceImpl implements InBoardService {
    private final InBoardDao inBoardDao;

    //게시판 등록
    @Override
    public void postInBoard(InBoardVo inBoardVo) {
        inBoardDao.inBoardUpload(inBoardVo);
    }
    //게시판 목록 조회
    @Override
    public ArrayList<InBoardVo> viewAllInBoard(){
        return inBoardDao.selectAllInBoard();
    }

}
