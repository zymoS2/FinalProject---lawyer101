package com.kh.lawservice101.chat.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ChatUserDao {
    Long insertChatUser(Long chatRoomNum);
    void updateLawyer(@Param("chatRoomNum") Long chatRoomNum, @Param("lawyerNum") Long lawyerNum);
    void updateClient(@Param("chatRoomNum") Long chatRoomNum, @Param("clientNum") Long clientNum);

    void deleteLawyer(Long chatRoomNum);

    void deleteClient(Long chatRoomNum);

    void deleteChatUser(Long chatRoomNum);
}
