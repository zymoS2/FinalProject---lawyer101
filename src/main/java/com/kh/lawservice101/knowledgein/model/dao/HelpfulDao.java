package com.kh.lawservice101.knowledgein.model.dao;

import com.kh.lawservice101.knowledgein.model.vo.HelpfulVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HelpfulDao {
    //도움됐어요 동작
    void clickHelpful(HelpfulVo helpfulPram);
}
