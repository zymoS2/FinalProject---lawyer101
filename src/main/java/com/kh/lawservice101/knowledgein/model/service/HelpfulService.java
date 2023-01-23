package com.kh.lawservice101.knowledgein.model.service;

import com.kh.lawservice101.knowledgein.model.vo.HelpfulVo;

public interface HelpfulService {

    // 도움됐어요 동작
    void checkHelpful(HelpfulVo helpfulPram);
}
