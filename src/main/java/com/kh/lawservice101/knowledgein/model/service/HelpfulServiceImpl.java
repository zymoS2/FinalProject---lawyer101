package com.kh.lawservice101.knowledgein.model.service;

import com.kh.lawservice101.knowledgein.model.dao.HelpfulDao;
import com.kh.lawservice101.knowledgein.model.vo.HelpfulVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class HelpfulServiceImpl implements HelpfulService {
    private final HelpfulDao helpfulDao;

    //도움됐어요 동작
    @Override
    public void checkHelpful(HelpfulVo helpfulPram) {
        helpfulDao.clickHelpful(helpfulPram);
    }

}
