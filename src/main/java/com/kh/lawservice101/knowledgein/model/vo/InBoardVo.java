package com.kh.lawservice101.knowledgein.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class InBoardVo {
    private Long inBoardNum;
    private String inBoardTitle;
    private String inBoardContent;
    private int inBoardCount;
    private Long categoryNum;
    private Long clientNum;
    private String writerDate;
}
