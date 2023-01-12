package com.kh.lawservice101.knowledgein.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class InReplyVo {
    private Long replyNum;
    private String replyTitle;
    private String replyContent;
    private String replyDate;
    private Long lawyerNum;
    private Long inBoardNum;
}
