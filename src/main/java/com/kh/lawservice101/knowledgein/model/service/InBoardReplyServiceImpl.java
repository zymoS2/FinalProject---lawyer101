package com.kh.lawservice101.knowledgein.model.service;

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

    @Override
    public InReplyVo findInReply(Long replyNum) {
        return inBoardReplyDao.selectInReply(replyNum);
    }

    @Override
    public List<InReplyVo> findAllInReplyByInBoardNum(Long inBoardNum) {
        return inBoardReplyDao.selectAllInReplyByInBoardNum(inBoardNum);
    }


}

