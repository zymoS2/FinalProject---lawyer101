package com.kh.lawservice101.chat.model.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ChatVo {
    private Long chatRoomNum;
    private Long userNum;
    private String chatWriter;
    private String chatContent;
    private char userType;
    private Integer userCount;
    private String createdDate;
}
