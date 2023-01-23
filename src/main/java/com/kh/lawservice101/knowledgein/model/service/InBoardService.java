package com.kh.lawservice101.knowledgein.model.service;

import com.kh.lawservice101.knowledgein.model.vo.InBoardVo;
import com.kh.lawservice101.lawyer.model.dto.SearchCon;


import java.util.ArrayList;

public interface InBoardService {

    //게시판 등록
    void postInBoard(InBoardVo inBoardVo);

    //게시판 단건 조회
    InBoardVo findPost(Long inBoardNum);

    //게시판 목록 조회
    ArrayList<InBoardVo> viewAllInBoard();

    // 페이징 검색
    ArrayList<InBoardVo> pagingInboard(SearchCon searchCon);
    
    //조회수
    void  viewCount(Long inBoardNum);
}