package com.kh.lawservice101.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ChatVo {
    private Long chatNum;
    private String chatWriter;
    private String chatContent;
    private char userType;
    private String createdDate;
    private ChatRoomVo chatRoomVo;
}
