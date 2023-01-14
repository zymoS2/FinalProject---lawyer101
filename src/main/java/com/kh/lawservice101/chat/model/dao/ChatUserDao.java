package com.kh.lawservice101.chat.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ChatUserDao {
    Long insertLawyer(@Param("chatRoomNum") Long chatRoomNum, @Param("lawyerNum") Long lawyerNum);
    void updateClient(@Param("chatRoomNum") Long chatRoomNum, @Param("clientNum") Long clientNum);
}
