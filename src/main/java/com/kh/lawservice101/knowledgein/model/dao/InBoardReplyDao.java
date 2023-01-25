package com.kh.lawservice101.knowledgein.model.dao;

import com.kh.lawservice101.knowledgein.model.vo.InReplyVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface InBoardReplyDao {
    Long insertReply(InReplyVo inReplyVo);

    InReplyVo selectInReply(Long replyNum);

    List<InReplyVo> selectAllInReplyByInBoardNum(Long inBoardNum);

//    void save(InReplyVo params);


//    void (InReplyVo params);


}
