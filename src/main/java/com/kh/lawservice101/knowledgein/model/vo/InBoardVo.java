package com.kh.lawservice101.knowledgein.model.vo;

import com.kh.lawservice101.category.model.vo.CategoryVo;
import com.kh.lawservice101.client.model.vo.ClientVo;
import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor

public class InBoardVo {
    private Long inBoardNum;
    private String inBoardTitle;
    private String inBoardContent;
    private int inBoardCount;
    private CategoryVo categoryVo;
    private ClientVo clientVo;
    private String writerDate;
    private Long inBoardHelpCount;
}
