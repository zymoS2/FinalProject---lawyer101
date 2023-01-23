package com.kh.lawservice101.knowledgein.model.vo;

import com.kh.lawservice101.client.model.vo.ClientVo;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class HelpfulVo {
    private Long helpfulNum;
    private int helpfulCount;
    private InBoardVo inBoardVo;
    private ClientVo clientVo;
}
