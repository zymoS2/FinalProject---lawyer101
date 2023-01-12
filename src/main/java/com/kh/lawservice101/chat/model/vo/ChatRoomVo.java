package com.kh.lawservice101.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ChatRoomVo {
    private Long chatRoomNum;
    private String chatRoomTitle;
    private char lockState;
    private int chatRoomPwd;
    private int userCount;
    private String createdDate;
}
