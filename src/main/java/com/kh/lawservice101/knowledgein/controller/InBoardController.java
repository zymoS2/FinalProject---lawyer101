package com.kh.lawservice101.knowledgein.controller;

import com.kh.lawservice101.category.model.vo.CategoryVo;
import com.kh.lawservice101.client.model.vo.ClientVo;
import com.kh.lawservice101.knowledgein.model.service.InBoardService;
import com.kh.lawservice101.knowledgein.model.vo.InBoardVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping
@RequiredArgsConstructor
public class InBoardController {

    private final InBoardService inBoardService;


    //지식인 전체목록


    @GetMapping("/knowledgeIn")
    public String knowledgeIn(Model model) {
        List<InBoardVo> showInBoard = inBoardService.viewAllInBoard();

        model.addAttribute("showInBoard", showInBoard);
        return "knowledgeIn";
    }
    //지식인글 상세페이지

    @GetMapping("/knowledgeInDetail")
    public String knowledgeInDetail(HttpServletRequest request, Model model) {

        String num = request.getParameter("num");
        //1. 없으면 만든다
        //2. 파라미터의 객체형을 바꾼다
        long number = Long.parseLong(num);
        InBoardVo showPost = inBoardService.findPost(number);

        //      Long inBoardNum = inBoardVo.getInBoardNum();
        //     showPost = inBoardService.findPost(inBoardNum);

        if (showPost != null) {
            model.addAttribute("showPost", showPost);
            inBoardService.viewCount(number);
            return "knowledgeInDetail";
        } else { // 게시글없으면 목록으로 돌아간다
            return "redirect:/knowledgeIn?return=error";
        }
    }

    //글쓰기 동작
    @GetMapping("/knowledgeInPost")
    public String knowledgeInPost(HttpServletRequest request) {
        // 1. 세션에 클라이언트라는 이름으로 담겨져있는 값이 있는지 확인한다
        HttpSession session = request.getSession();
        ClientVo sessionClient = (ClientVo) session.getAttribute("client");

        // 2. 작성하기전 로그인을 했다면 글쓸기 가능 그렇지 않으면 로그인 페이지 가기
        if (sessionClient != null) {
            return "knowledgeInPost";
        } else { // 3. 있으면 등록 없으면 로그인
            return "redirect:/clientLogin";
        }
    }

    //글쓰기 업로드
    @PostMapping("/knowledgeInPost/insert.do")
    public String insert(HttpServletRequest request, @ModelAttribute InBoardVo inBoardVo) {
        String categoryVal = request.getParameter("categoryNum");

        CategoryVo categoryVo = new CategoryVo();
        categoryVo.setCategoryNum(Long.parseLong(categoryVal));
        inBoardVo.setCategoryVo(categoryVo);

        // 1. 세션에 클라이언트라는 이름으로 담겨져있는 값이 있는지 확인한다
        HttpSession loginSession = request.getSession();
        ClientVo loginClientSession = (ClientVo) loginSession.getAttribute("client");
        // 2. 작성하기전 로인 세션이 유지 되면 글쓰기
        if (loginClientSession != null) {
            // 1. 제목이 있는지 확인
            if (inBoardVo.getInBoardTitle() == null) {
                return "redirect:/knowledgeInPost?false=title";
            }
            // 2. 내용이 있는지 확인
            if (inBoardVo.getInBoardContent() == null) {
                return "redirect:/knowledgeInPost?false=Content";
            }
            // 3. 카데고리 값 확인
            if (inBoardVo.getCategoryVo() == null) {
                return "redirect:/knowledgeInPost?false=category";
            }
            inBoardVo.setClientVo(loginClientSession);
            inBoardService.postInBoard(inBoardVo);
            return "redirect:/knowledgeIn";
        } else { // 3. 로그인 세션이 유지 되지 않았다면 다시 로그인
            return "redirect:/clientLogin";
        }
    }
}