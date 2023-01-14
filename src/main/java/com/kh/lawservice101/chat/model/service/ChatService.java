package com.kh.lawservice101.chat.model.service;

import com.kh.lawservice101.chat.model.vo.ChatRoomVo;
import com.kh.lawservice101.chat.model.vo.ChatVo;

public interface ChatService {
    ChatVo setChatVo(ChatRoomVo chatRoomVo, ChatVo chatVo);
}
