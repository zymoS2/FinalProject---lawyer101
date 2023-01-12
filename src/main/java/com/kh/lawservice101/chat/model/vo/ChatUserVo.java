package com.kh.lawservice101.chat.model.vo;

import com.kh.lawservice101.client.model.vo.ClientVo;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ChatUserVo {
    private Long chatRoomNum;
    private LawyerVo lawyerVo;
    private ClientVo clientVo;
}
