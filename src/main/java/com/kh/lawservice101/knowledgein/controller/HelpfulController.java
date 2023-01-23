package com.kh.lawservice101.knowledgein.controller;

import com.kh.lawservice101.client.model.vo.ClientVo;
import com.kh.lawservice101.knowledgein.model.service.HelpfulService;
import com.kh.lawservice101.knowledgein.model.vo.HelpfulVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class HelpfulController {
    public final HelpfulService helpfulService;


    //도움됐어요 동작
    @GetMapping("/helpful")
    public String updateHelpful(HttpServletRequest request, @ModelAttribute ClientVo ClientVo) {
        // 1. 세션에 클라이언트라는 이름으로 담겨져있는 값이 있는지 확인한다
        HttpSession loginSession = request.getSession();
        ClientVo sessionClient = (ClientVo) loginSession.getAttribute("client");
        // 2. 로그인이 되어있다면 유지 되면 좋아요 버튼을 누를수 있음
//        if (sessionClient != null) {
//            if () {  // 좋아요 버튼을 눌렀다면
//                // 색이 있는 얼굴로 변하고 카운트가 올라간다
//            }
//
//        } else {// 로그인이 되어있지 않다면
//            // msg <회원만 가능합니다>
        return "knowledgeInDetail";
    }

    @PostMapping("/helpful/click")
    public String update(HttpServletRequest request, @ModelAttribute HelpfulVo helpfulVo) {
        return "knowledgeInDetail";
    }
}
