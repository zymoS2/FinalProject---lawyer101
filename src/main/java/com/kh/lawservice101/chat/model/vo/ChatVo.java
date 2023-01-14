package com.kh.lawservice101.chat.model.vo;

import lombok.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ChatVo {
    private Long chatRoomNum;
    private String chatWriter;
    private String chatContent;
    private char userType;
    private String createdDate;
    private Integer userCount;
}
