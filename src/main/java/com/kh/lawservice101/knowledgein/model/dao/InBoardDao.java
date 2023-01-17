package com.kh.lawservice101.knowledgein.model.dao;

import com.kh.lawservice101.knowledgein.model.vo.InBoardVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InBoardDao {
    //게시판 등록
    void inBoardUpload(InBoardVo inBoardVo);
/*
    //게시판 조회
    InBoardVo findClientNum(InBoardVo inBoardPram);*/
}
