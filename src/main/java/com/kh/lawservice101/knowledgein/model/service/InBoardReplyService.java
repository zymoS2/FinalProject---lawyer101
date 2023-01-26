package com.kh.lawservice101.knowledgein.model.service;

import com.kh.lawservice101.knowledgein.model.vo.InReplyVo;

import java.util.List;

public interface InBoardReplyService {

    //댓글쓰기
    Long saveInboardReply(InReplyVo inReplyVo);

    //댓글삭제
    void DeleteInboardReply();

    // 답변 단건 조회
    InReplyVo findInReply(Long replyNum);

    // 지식인 게시글 답변 목록 조회
    List<InReplyVo> findAllInReplyByInBoardNum(Long inBoardNum);

    // 변호사 지식인 답변 목록 조회
    List<InReplyVo> findAllInReplyByLawyerNum(Long lawyerNum);

    // 페이징 변호사 지식인 답변 목록
    List<InReplyVo> pagingInReply(Long lawyerNum, int pageNum, int pageSize);

    // 최근 답변이 활발한 변호사 목록
    List<InReplyVo> findRecentlyReplyLawyer();
}