package com.kh.lawservice101.chat.model.service;

import com.kh.lawservice101.chat.model.vo.ChatRoomVo;

import java.util.List;

public interface ChatRoomService {
    List<ChatRoomVo> findAllChatRooms();
    Long saveChatRoom(ChatRoomVo chatRoomVo);
    ChatRoomVo findChatRoom(Long chatRoomNum);
    void incrementUserCount(Long chatRoomNum);

    void decrementUserCount(Long chatRoomNum);

    void removeChatRoom(Long chatRoomNum);
}
