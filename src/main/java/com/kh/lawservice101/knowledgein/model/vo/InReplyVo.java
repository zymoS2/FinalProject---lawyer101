package com.kh.lawservice101.knowledgein.model.vo;

import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class InReplyVo {
    private Long replyNum;
    private String replyContent;
    private String replyDate;
    private LawyerVo lawyerVo;
    private InBoardVo inBoardVo;
}
