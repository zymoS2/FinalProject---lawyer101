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
    public String chatList(@SessionAttribute(required = false) Object loginUser, Model model,
                           @RequestParam(required = false, defaultValue = "false") Boolean error,
                           @RequestParam(required = false) String msg) {
        if (loginUser instanceof LawyerVo) {
            LawyerVo lawyerVo = (LawyerVo) loginUser;
            model.addAttribute("lawyer", lawyerVo);
        } else {
            ClientVo clientVo = (ClientVo) loginUser;
            model.addAttribute("client", clientVo);
        }

        List<ChatRoomVo> chatRoomList = chatRoomService.findAllChatRooms();
        for (ChatRoomVo chatRoomVo : chatRoomList) {
            if (chatRoomVo.getChatUserVo().getLawyerVo() == null) {
                chatRoomService.removeChatRoom(chatRoomVo.getChatRoomNum());
            }
        }

        chatRoomList = chatRoomService.findAllChatRooms();
        model.addAttribute("chatRoomList", chatRoomList);

        if (error) {
            model.addAttribute("msg", msg);
        }

        return "chat/chat";
    }

    // 채팅방 생성
    @PostMapping("/room")
    @ResponseBody
    public Long createChatRoom(@SessionAttribute("loginUser") LawyerVo lawyerVo,
                               @ModelAttribute ChatRoomVo chatRoomVo) {
        chatRoomService.saveChatRoom(chatRoomVo);
        Long chatRoomNum = chatRoomVo.getChatRoomNum();
        log.info("chatRoomNum={}", chatRoomNum);

        chatUserService.saveChatUser(chatRoomNum);
        chatUserService.addLawyer(chatRoomNum, lawyerVo);

        return chatRoomNum;
    }

    // 채팅방 입장
    @GetMapping("/room")
    public String chatDetail(@SessionAttribute(required = false) Object loginUser,
                             @RequestParam Long roomNum, Model model,
                             RedirectAttributes redirectAttributes) {

        // 로그인 검증
        if (loginUser == "" || loginUser == null) {
            ERROR_MSG = "무료 상담은 로그인 후 이용가능합니다.";
            redirectAttributes.addFlashAttribute("error", true);
            redirectAttributes.addFlashAttribute("msg", ERROR_MSG);
            return "redirect:/chat/rooms";
        }

        ChatRoomVo chatRoomVo = chatRoomService.findChatRoom(roomNum);
        log.info("chatRoomVo={}", chatRoomVo);

        // 상담중인 인원 검증
        if (chatRoomVo.getUserCount() >= 2) {
            ERROR_MSG = "상담중인 의뢰인이 있습니다.";
            redirectAttributes.addFlashAttribute("error", true);
            redirectAttributes.addFlashAttribute("msg", ERROR_MSG);
            return "redirect:/chat/rooms";
        }

        if (loginUser instanceof LawyerVo) {
            // 로그인한 유저가 변호사인 경우 방을 개설한 변호사인지 검증
            LawyerVo lawyerVo = (LawyerVo) loginUser;

            if (lawyerVo.getLawyerNum() != chatRoomVo.getChatUserVo().getLawyerVo().getLawyerNum()) {
                ERROR_MSG = "다른 변호사는 입장할 수 없습니다.";
                redirectAttributes.addFlashAttribute("error", true);
                redirectAttributes.addFlashAttribute("msg", ERROR_MSG);
                return "redirect:/chat/rooms";
            }

            model.addAttribute("loginUser", lawyerVo);

        } else {
            // 로그인한 유저가 의뢰인인 경우 채팅방 유저로 등록
            ClientVo clientVo = (ClientVo) loginUser;
            chatUserService.addClient(chatRoomVo.getChatRoomNum(), clientVo);

            chatRoomVo = chatRoomService.findChatRoom(roomNum);
            model.addAttribute("loginUser", clientVo);
        }

        List<ChatRoomVo> chatRoomList = chatRoomService.findAllChatRooms();

        model.addAttribute("chatRoomList", chatRoomList);
        model.addAttribute("chatRoom", chatRoomVo);

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
}
