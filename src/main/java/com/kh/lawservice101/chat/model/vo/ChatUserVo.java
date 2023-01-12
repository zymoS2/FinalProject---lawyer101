package com.kh.lawservice101.chat.model.vo;

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
    private Long lawyerNum;
    private Long clientNum;
}
