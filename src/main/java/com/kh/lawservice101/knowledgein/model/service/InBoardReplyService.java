package com.kh.lawservice101.knowledgein.model.service;

import com.kh.lawservice101.knowledgein.model.vo.InReplyVo;

import java.util.List;

public interface InBoardReplyService {

    //댓글쓰기
    Long saveInboardReply(InReplyVo inReplyVo);

    //댓글삭제
    void DeleteInboardReply();

    InReplyVo findInReply(Long replyNum);

    List<InReplyVo> findAllInReplyByInBoardNum(Long inBoardNum);
}