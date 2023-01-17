package com.kh.lawservice101.chat.model.service.impl;

import com.kh.lawservice101.chat.model.dao.ChatRoomDao;
import com.kh.lawservice101.chat.model.dao.ChatUserDao;
import com.kh.lawservice101.chat.model.service.ChatRoomService;
import com.kh.lawservice101.chat.model.vo.ChatRoomVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ChatRoomServiceImpl implements ChatRoomService {

    private final ChatRoomDao chatRoomDao;
    private final ChatUserDao chatUserDao;

    @Override
    public List<ChatRoomVo> findAllChatRooms() {
        return chatRoomDao.selectAll();
    }

    @Override
    public Long saveChatRoom(ChatRoomVo chatRoomVo) {
        return chatRoomDao.insertChatRoom(chatRoomVo);
    }
    @Override
    public ChatRoomVo findChatRoom(Long chatRoomNum) {
        return chatRoomDao.selectChatRoom(chatRoomNum);
    }

    @Override
    public void incrementUserCount(Long chatRoomNum) {
        chatRoomDao.plusUserCount(chatRoomNum);
    }

    @Override
    public void decrementUserCount(Long chatRoomNum) {
        chatRoomDao.minusUserCount(chatRoomNum);
    }

    @Override
    public void removeChatRoom(Long chatRoomNum) {
        chatRoomDao.deleteChatRoom(chatRoomNum);
        chatUserDao.deleteChatUser(chatRoomNum);
    }

}
