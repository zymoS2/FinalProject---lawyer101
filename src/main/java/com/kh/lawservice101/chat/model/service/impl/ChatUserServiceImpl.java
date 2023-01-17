package com.kh.lawservice101.chat.model.service.impl;

import com.kh.lawservice101.chat.model.dao.ChatUserDao;
import com.kh.lawservice101.chat.model.service.ChatUserService;
import com.kh.lawservice101.chat.model.vo.ChatVo;
import com.kh.lawservice101.client.model.vo.ClientVo;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ChatUserServiceImpl implements ChatUserService {

    private final ChatUserDao chatUserDao;

    @Override
    public void saveChatUser(Long chatRoomNum) {
        chatUserDao.insertChatUser(chatRoomNum);
    }

    @Override
    public void addLawyer(Long chatRoomNum, LawyerVo lawyerVo) {
        chatUserDao.updateLawyer(chatRoomNum, lawyerVo.getLawyerNum());
    }

    @Override
    public void addClient(Long chatRoomNum, ClientVo clientVo) {
        chatUserDao.updateClient(chatRoomNum, clientVo.getClientNum());
    }

    @Override
    public void removeChatUser(ChatVo chatVo) {
        if (chatVo.getUserType() == 'L') {
            chatUserDao.deleteLawyer(chatVo.getChatRoomNum());
        } else {
            chatUserDao.deleteClient(chatVo.getChatRoomNum());
        }
    }

    @Override
    public void addChatUser(ChatVo chatVo) {
        if (chatVo.getUserType() == 'L') {
            chatUserDao.updateLawyer(chatVo.getChatRoomNum(), chatVo.getUserNum());
        } else {
            chatUserDao.updateClient(chatVo.getChatRoomNum(), chatVo.getUserNum());
        }
    }
}
