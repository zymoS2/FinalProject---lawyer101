package com.kh.lawservice101.knowledgein.model.dao;

import com.kh.lawservice101.knowledgein.model.vo.InBoardVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface InBoardDao {

    //게시판 등록
    void inBoardUpload(InBoardVo inBoardVo);

    //게시판 단건 조회
    InBoardVo selectPost(Long inBoardNum);

    //게시판 목록
    ArrayList<InBoardVo> selectAllInBoard();

    //조회수
    void updateViewCount(Long inBoardNum);
}
