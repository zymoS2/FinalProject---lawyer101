package com.kh.lawservice101.chat.controller;

import com.kh.lawservice101.chat.model.service.ChatRoomService;
import com.kh.lawservice101.chat.model.service.ChatService;
import com.kh.lawservice101.chat.model.service.ChatUserService;
import com.kh.lawservice101.chat.model.vo.ChatRoomVo;
import com.kh.lawservice101.chat.model.vo.ChatUserVo;
import com.kh.lawservice101.chat.model.vo.ChatVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.event.EventListener;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

@Slf4j
@RequiredArgsConstructor
@Controller
public class StompChatController {

    public final SimpMessageSendingOperations template;  //특정 Broker로 메세지를 전달
    private final ChatRoomService chatRoomService;
    private final ChatService chatService;
    private final ChatUserService chatUserService;

    // @MessageMapping 을 통해 WebSocket으로 들어오는 메세지 발행을 처리
    // Client가 SEND할 수 있는 경로
    // stompConfig에서 설정한 applicationDestinationPrefixes와 @MessageMapping 경로가 병합됨 -> "/pub/chat/enter"
    @MessageMapping("/chat/enter")
    public void enter(@ModelAttribute ChatVo chatVo, SimpMessageHeaderAccessor headerAccessor) {
        log.info("chatVo={}", chatVo);

        ChatRoomVo chatRoomVo = chatRoomService.findChatRoom(chatVo.getChatRoomNum());
        ChatUserVo chatUserVo = chatRoomVo.getChatUserVo();

        if (chatUserVo.getLawyerVo() == null || chatUserVo.getClientVo() == null) {
            chatUserService.addChatUser(chatVo); // 채팅 유저 등록
        }
        chatRoomService.incrementUserCount(chatRoomVo.getChatRoomNum()); // 채팅방 유저 + 1

        chatRoomVo = chatRoomService.findChatRoom(chatRoomVo.getChatRoomNum());

        chatVo = chatService.setChatVo(chatRoomVo, chatVo);
        chatVo.setChatContent(chatVo.getChatWriter() + "님이 채팅방에 참여하였습니다.");
        log.info("chatVo={}", chatVo);

        headerAccessor.getSessionAttributes().put("chatVo", chatVo);

        template.convertAndSend("/sub/chat/room/" + chatVo.getChatRoomNum(), chatVo);
    }

    @MessageMapping(value = "/chat/message")
    public void message(@ModelAttribute ChatVo chatVo){
        // Client에서는 해당 주소를 SUBSCRIBE하고 있다가 메세지가 전달되면 화면에 출력, 이때 /sub/chat/room/[roomId]는 채팅방을 구분하는 값
        ChatRoomVo chatRoomVo = chatRoomService.findChatRoom(chatVo.getChatRoomNum());
        chatVo = chatService.setChatVo(chatRoomVo, chatVo);
        log.info("chatVo={}", chatVo);

        template.convertAndSend("/sub/chat/room/" + chatVo.getChatRoomNum(), chatVo);
    }

    // 유저 퇴장 시에는 EventListener 를 통해서 유저 퇴장을 확인
    @EventListener
    public void disconnectListener(SessionDisconnectEvent event) {
        log.info("DisconnectEvent={}", event);

        StompHeaderAccessor headerAccessor = StompHeaderAccessor.wrap(event.getMessage());
        log.info("headerAccessor={}", headerAccessor);

        ChatVo chatVo = (ChatVo) headerAccessor.getSessionAttributes().get("chatVo");

        ChatRoomVo chatRoom = chatRoomService.findChatRoom(chatVo.getChatRoomNum());

        chatVo = chatService.setChatVo(chatRoom, chatVo);
        chatVo.setChatContent(chatVo.getChatWriter() + "님이 채팅방에서 퇴장하였습니다.");
        log.info("chatVo={}", chatVo);

        chatRoomService.decrementUserCount(chatVo.getChatRoomNum()); // 채팅방 유저 -1
        chatUserService.removeChatUser(chatVo); // 채팅 유저 제거

        template.convertAndSend("/sub/chat/room/" + chatVo.getChatRoomNum(), chatVo);
    }
}
