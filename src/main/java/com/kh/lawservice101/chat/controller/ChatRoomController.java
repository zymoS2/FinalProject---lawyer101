package com.kh.lawservice101.chat.controller;

import com.kh.lawservice101.chat.model.service.ChatRoomService;
import com.kh.lawservice101.chat.model.service.ChatUserService;
import com.kh.lawservice101.chat.model.vo.ChatRoomVo;
import com.kh.lawservice101.client.model.vo.ClientVo;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/chat")
@RequiredArgsConstructor
@Slf4j
public class ChatRoomController {

    private final ChatRoomService chatRoomService;
    private final ChatUserService chatUserService;

    private String ERROR_MSG = "";

    // 채팅 리스트
    @GetMapping("/rooms")
    public String chatList(Model model, @RequestParam(required = false, defaultValue = "false") Boolean error,
                           @RequestParam(required = false) String msg) {
        List<ChatRoomVo> chatRoomList = chatRoomService.findAllChatRooms();
        model.addAttribute("chatRoomList", chatRoomList);

        if (error) {
            model.addAttribute("msg", msg);
        }
        return "chat/chat";
    }

    // 채팅방 생성
    @PostMapping("/room")
    @ResponseBody
    public Long createChatRoom(@ModelAttribute ChatRoomVo chatRoomVo) {
        chatRoomService.saveChatRoom(chatRoomVo);
        Long chatRoomNum = chatRoomVo.getChatRoomNum();
        log.info("chatRoomNum={}", chatRoomNum);

        chatUserService.saveChatUser(chatRoomNum);

        return chatRoomNum;
    }

    // 채팅방 입장
    @GetMapping("/room")
    public String chatDetail(@RequestParam Long roomNum, Model model,
                             @SessionAttribute(value = "client", required = false) ClientVo clientVo,
                             @SessionAttribute(value = "lawyer", required = false) LawyerVo lawyerVo,
                             RedirectAttributes redirectAttributes) {

        // 로그인 검증
        if (lawyerVo == null && clientVo == null) {
            ERROR_MSG = "무료 상담은 로그인 후 이용가능합니다.";
            redirectAttributes.addFlashAttribute("error", true);
            redirectAttributes.addFlashAttribute("msg", ERROR_MSG);
            return "redirect:/chat/rooms";
        }

        ChatRoomVo chatRoom = chatRoomService.findChatRoom(roomNum);
        if (chatRoom == null) {
            ERROR_MSG = "상담이 종료되었습니다.";
            redirectAttributes.addFlashAttribute("error", true);
            redirectAttributes.addFlashAttribute("msg", ERROR_MSG);
            return "redirect:/chat/rooms";
        }

        // 변호사가 채팅방에 입장하는 경우
        if (lawyerVo != null) {
            // 채팅방에 변호사가 등록되어 있지 않으면 변호사를 등록
            if (chatRoom.getChatUserVo().getLawyerVo() == null) {
                chatUserService.addLawyer(roomNum, lawyerVo);
            } else {
                // 채팅방에 변호사가 등록되어 있으면 방을 개설한 변호사인지 검증
                if (lawyerVo.getLawyerNum() != chatRoom.getChatUserVo().getLawyerVo().getLawyerNum()) {
                    ERROR_MSG = "다른 변호사는 입장할 수 없습니다.";
                    redirectAttributes.addFlashAttribute("error", true);
                    redirectAttributes.addFlashAttribute("msg", ERROR_MSG);
                    return "redirect:/chat/rooms";
                }
            }
        }

        // 의뢰인이 채팅방에 입장하는 경우
        if (clientVo != null) {
            // 채팅방에 의뢰인이 등록되어 있지 않으면 의뢰인을 등록
            if (chatRoom.getChatUserVo().getClientVo() == null) {
                chatUserService.addClient(roomNum, clientVo);
            } else {
                // 채팅방에 의뢰인이 등록되어 있으면 입장 불가
                if (clientVo.getClientNum() != chatRoom.getChatUserVo().getClientVo().getClientNum()) {
                    ERROR_MSG = "상담중인 의뢰인이 있습니다. 조금만 기다려 주세요.";
                    redirectAttributes.addFlashAttribute("error", true);
                    redirectAttributes.addFlashAttribute("msg", ERROR_MSG);
                    return "redirect:/chat/rooms";
                }
            }
        }

        List<ChatRoomVo> chatRoomList = chatRoomService.findAllChatRooms();
        chatRoom = chatRoomService.findChatRoom(roomNum);

        model.addAttribute("chatRoomList", chatRoomList);
        model.addAttribute("chatRoom", chatRoom);

        return "chat/chat";
    }

    // 잠금 확인
    @GetMapping("/room/lockState-check")
    @ResponseBody
    public Character chatRoomLockStatChk(@RequestParam Long roomNum) {
        ChatRoomVo chatRoomVo = chatRoomService.findChatRoom(roomNum);
        char lockState = chatRoomVo.getLockState();
        log.info("lockStat={}" , lockState);

        return lockState;
    }

    // 비밀번호 확인
    @PostMapping("/room/pwd-check")
    @ResponseBody
    public Boolean chatRoomPwdChk(@RequestParam Long roomNum, @RequestParam Integer pwd) {
        ChatRoomVo chatRoomVo = chatRoomService.findChatRoom(roomNum);
        log.info("pwd={} roomPwd={}" , pwd, chatRoomVo.getChatRoomPwd());
        log.info("result={}", chatRoomVo.getChatRoomPwd().equals(pwd));

        return chatRoomVo.getChatRoomPwd().equals(pwd);
    }

    @DeleteMapping("/room")
    public void chatRoomRemove(@RequestParam Long roomNum) {
        chatRoomService.removeChatRoom(roomNum);
    }
}
