//package com.kh.lawservice101.knowledgein.controller;
//
//import com.kh.lawservice101.client.model.vo.ClientVo;
//import com.kh.lawservice101.knowledgein.model.service.HelpfulService;
//import com.kh.lawservice101.knowledgein.model.vo.HelpfulVo;
//import com.kh.lawservice101.knowledgein.model.vo.InBoardVo;
//import lombok.RequiredArgsConstructor;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//
//@Controller
//@RequiredArgsConstructor
//public class HelpfulController {
//    public final HelpfulService helpfulService;
//
//
//    //도움됐어요 동작
//    @GetMapping("/helpfulCheck")
//    public String updateHelpful(HttpServletRequest request, @ModelAttribute InBoardVo inBoardVo) {
//        // 1. 세션에 클라이언트라는 이름으로 담겨져있는 값이 있는지 확인한다
//        HttpSession loginSession = request.getSession();
//        ClientVo loginClientSession = (ClientVo) loginSession.getAttribute("client");
//
//        // 2. 로그인이 되어있다면 유지 되면 좋아요 버튼을 누를수 있음
//        if (loginClientSession != null) {
//
//            // 좋아요 버튼을 눌렀다면
//            if()
//            //1. 좋아요 이력테이블에서 유저시퀀스와 게시글 번호
//
//            //1-1. 있다면  이미 눌러서 끝
//
//            //1-2. 좋아요 이력테이블 유저시퀀스, 게시글 번호
//
//            //1-3. 이력테이블에 정보등록이 성공하면 성공을 반환하고 실패하면 실패 반환
//            //1-3-1. 성공시 좋아요 이력테이블의 갯수를 조회한다
//
//            // 최종 반환 되는값 성공여부, 좋아요 수
//            // 반환 json
//            // 색이 있는 얼굴로 변하고 카운트가 올라간다
//
//        } else {// 로그인이 되어있지 않다면
//            return "knowledgeInDetail";
//            // msg <회원만 가능합니다>i
//        }
//    }
