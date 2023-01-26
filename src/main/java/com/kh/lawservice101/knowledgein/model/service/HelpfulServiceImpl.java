package com.kh.lawservice101.knowledgein.model.service;

import com.kh.lawservice101.knowledgein.model.dao.HelpfulDao;
import com.kh.lawservice101.knowledgein.model.vo.HelpfulVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class HelpfulServiceImpl implements HelpfulService {
    private final HelpfulDao helpfulDao;


    //도움됐어요 카운트 저장
    @Override
    public void saveHelpful(HelpfulVo helpfulVo) {
        helpfulDao.insertHelpful(helpfulVo);

    }

    //도움됐어요 찾기
    @Override
    public HelpfulVo selectHelpful(HelpfulVo helpfulVo) {
        return helpfulDao.selectHelpful(helpfulVo);
    }


}
