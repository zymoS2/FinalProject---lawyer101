package com.kh.lawservice101.chat.model.dao;

import com.kh.lawservice101.chat.model.vo.ChatRoomVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ChatRoomDao {

    List<ChatRoomVo> selectAll();
    Long insertChatRoom(ChatRoomVo chatRoomVo);
    ChatRoomVo selectChatRoom(Long chatRoomNum);
    void plusUserCount(Long chatRoomNum);

    void minusUserCount(Long chatRoomNum);

    void deleteChatRoom(Long chatRoomNum);
}
