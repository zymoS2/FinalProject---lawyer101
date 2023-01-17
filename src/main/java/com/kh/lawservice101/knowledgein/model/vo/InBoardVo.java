package com.kh.lawservice101.knowledgein.model.vo;

import com.kh.lawservice101.category.model.vo.CategoryVo;
import com.kh.lawservice101.client.model.vo.ClientVo;
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
    private CategoryVo categoryVo;
    private ClientVo clientVo;
    private String writerDate;
}
