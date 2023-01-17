package com.kh.lawservice101.chat.model.service.impl;

import com.kh.lawservice101.chat.model.service.ChatService;
import com.kh.lawservice101.chat.model.vo.ChatRoomVo;
import com.kh.lawservice101.chat.model.vo.ChatVo;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Service
public class ChatServiceImpl implements ChatService {
    @Override
    public ChatVo setChatVo(ChatRoomVo chatRoomVo, ChatVo chatVo) {
        if (chatVo.getUserType() == 'L') {
            chatVo.setChatWriter(chatRoomVo.getChatUserVo().getLawyerVo().getLawyerName());
        } else {
            chatVo.setChatWriter(chatRoomVo.getChatUserVo().getClientVo().getClientName());
        }

        chatVo.setUserCount(chatRoomVo.getUserCount());
        chatVo.setCreatedDate(LocalDateTime.now().format(DateTimeFormatter.ofPattern("a hh: mm")));

        return chatVo;
    }
}
