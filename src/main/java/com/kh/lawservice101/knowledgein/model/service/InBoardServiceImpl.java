package com.kh.lawservice101.knowledgein.model.service;

import com.github.pagehelper.PageHelper;
import com.kh.lawservice101.knowledgein.model.dao.InBoardDao;
import com.kh.lawservice101.knowledgein.model.vo.InBoardVo;
import com.kh.lawservice101.lawyer.model.dto.SearchCon;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class InBoardServiceImpl implements InBoardService {
    private final InBoardDao inBoardDao;

    //게시판 등록
    @Override
    public void postInBoard(InBoardVo inBoardVo) {
        inBoardDao.inBoardUpload(inBoardVo);
    }

    //게시판 단건 조회
    @Override
    public InBoardVo findPost(Long inBoardNum) {
        return inBoardDao.selectPost(inBoardNum);
    }

    //게시판 목록 조회
    @Override
    public ArrayList<InBoardVo> viewAllInBoard() {
        return inBoardDao.selectAllInBoard();
    }

    // 페이징 검색
    @Override
    public ArrayList<InBoardVo> pagingInboard(SearchCon searchCon) {
        PageHelper.startPage(searchCon);
        return inBoardDao.selectInboardByKeyword(searchCon);
    }



    //페이징 게시글 목록
    @Override
    public List<InBoardVo> PagingPost(int pageNum, int pageSize, String sortType) {
        PageHelper.startPage(pageNum, pageSize);
        return inBoardDao.selectInboard(sortType);
    }
    //조회수
    @Override
    public void viewCount(Long inBoardCount) {
        inBoardDao.updateViewCount(inBoardCount);
    }

    //도움됐어요 증가
    @Override
    public void helpCount(Long inBoardNum) {
        inBoardDao.updateHelpCount(inBoardNum);
    }
}

