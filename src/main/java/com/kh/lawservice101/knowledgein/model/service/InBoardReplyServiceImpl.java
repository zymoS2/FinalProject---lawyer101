package com.kh.lawservice101.knowledgein.model.service;

import com.github.pagehelper.PageHelper;
import com.kh.lawservice101.knowledgein.model.dao.InBoardReplyDao;
import com.kh.lawservice101.knowledgein.model.vo.InReplyVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class InBoardReplyServiceImpl implements InBoardReplyService {
    private final InBoardReplyDao inBoardReplyDao;

    //댓글쓰기
    @Override
    public Long saveInboardReply(InReplyVo inReplyVo) {
        return inBoardReplyDao.insertReply(inReplyVo);
    }

    //댓글삭제
    @Override
    public void DeleteInboardReply(){

    }

    // 답변 단건 조회
    @Override
    public InReplyVo findInReply(Long replyNum) {
        return inBoardReplyDao.selectInReply(replyNum);
    }

    // 지식인 게시글 답변 목록 조회
    @Override
    public List<InReplyVo> findAllInReplyByInBoardNum(Long inBoardNum) {
        return inBoardReplyDao.selectAllInReplyByInBoardNum(inBoardNum);
    }

    // 변호사 지식인 답변 목록 조회
    @Override
    public List<InReplyVo> findAllInReplyByLawyerNum(Long lawyerNum) {
        return inBoardReplyDao.selectAllInReplyByLawyerNum(lawyerNum);
    }

    // 페이징 변호사 지식인 답변 목록
    @Override
    public List<InReplyVo> pagingInReply(Long lawyerNum, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return inBoardReplyDao.selectAllInReplyByLawyerNum(lawyerNum);
    }


}

