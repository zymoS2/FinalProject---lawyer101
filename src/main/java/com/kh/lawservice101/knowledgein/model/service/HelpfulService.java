package com.kh.lawservice101.knowledgein.model.service;

import com.kh.lawservice101.knowledgein.model.vo.HelpfulVo;

public interface HelpfulService {


    //도움됐어요 카운트 저장
    HelpfulVo saveHelpful(HelpfulVo helpfulVo);
}