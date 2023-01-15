package com.kh.lawservice101.knowledgein.model.service;

import com.kh.lawservice101.knowledgein.model.vo.InBoardVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InBoardService {

    //게시판 등록
    void postInBoard(InBoardVo inBoardVo);

}