package com.kh.lawservice101.knowledgein.model.vo;

import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
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
    private LawyerVo lawyerVo;
    private InBoardVo inBoardVo;
}
