package com.kh.lawservice101.knowledgein.model.service;

import com.kh.lawservice101.knowledgein.model.vo.HelpfulVo;

public interface HelpfulService {


    //도움됐어요 카운트 저장
    void saveHelpful(HelpfulVo helpfulVo);

    //도움됐어요 찾기
    HelpfulVo selectHelpful(HelpfulVo helpfulVo);
}