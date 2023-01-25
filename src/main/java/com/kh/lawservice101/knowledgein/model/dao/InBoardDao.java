package com.kh.lawservice101.knowledgein.model.dao;

import com.kh.lawservice101.knowledgein.model.vo.InBoardVo;
import com.kh.lawservice101.lawyer.model.dto.SearchCon;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface InBoardDao {

    //게시판 등록
    void inBoardUpload(InBoardVo inBoardVo);

    //게시판 단건 조회
    InBoardVo selectPost(Long inBoardNum);

    //게시판 목록
    ArrayList<InBoardVo> selectAllInBoard();

    // 검색 조회
    ArrayList<InBoardVo> selectInboardByKeyword(SearchCon searchCon);

    //조회수
    void updateViewCount(Long inBoardNum);

    //게시글 목록 조회
    List<InBoardVo> selectInboard(String sortType);

    //도움됐어요 증가
    void updateHelpCount(Long inBoardNum);
}
