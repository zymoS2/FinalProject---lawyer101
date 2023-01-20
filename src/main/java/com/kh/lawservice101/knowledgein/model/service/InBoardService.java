package com.kh.lawservice101.knowledgein.model.service;

import com.kh.lawservice101.knowledgein.model.vo.InBoardVo;


import java.util.ArrayList;

public interface InBoardService {

    //게시판 등록
    void postInBoard(InBoardVo inBoardVo);

    //게시판 단건 조회
    InBoardVo findPost(Long inBoardNum);

    //게시판 목록 조회
    ArrayList<InBoardVo> viewAllInBoard();

}