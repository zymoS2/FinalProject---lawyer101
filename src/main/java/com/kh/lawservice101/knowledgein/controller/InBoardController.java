package com.kh.lawservice101.knowledgein.controller;

import com.github.pagehelper.PageInfo;
import com.kh.lawservice101.category.model.vo.CategoryVo;
import com.kh.lawservice101.client.model.vo.ClientVo;
import com.kh.lawservice101.knowledgein.model.service.InBoardReplyService;
import com.kh.lawservice101.knowledgein.model.service.InBoardService;
import com.kh.lawservice101.knowledgein.model.vo.InBoardVo;
import com.kh.lawservice101.knowledgein.model.vo.InReplyVo;
import com.kh.lawservice101.lawyer.model.dto.SearchCon;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping
@RequiredArgsConstructor
@Slf4j
public class InBoardController {

    private final InBoardService inBoardService;
    private final InBoardReplyService inBoardReplyService;

    private final static int PAGE_SIZE = 5;
    private final static int PAGE_NUM = 1;


    //지식인 전체목록
    @GetMapping("/knowledgeIn")
    public String knowledgeIn(HttpServletRequest request, Model model) {

        String page = request.getParameter("page"); // 현재 보는 페이지의 번호
        String sortType = request.getParameter("sortType");

        if (sortType == null || sortType.length() == 0) {
            sortType = "boardNum";
        }

        if (page == null || page.length() == 0) {
            page = "1";
        }

        PageInfo<InBoardVo> pagePost = PageInfo.of(inBoardService.PagingPost(Integer.valueOf(page), PAGE_SIZE, sortType));

        List<List<InReplyVo>> allInReply = new ArrayList<>();
        for (InBoardVo inBoardVo : pagePost.getList()) {
            List<InReplyVo> inReplyList = inBoardReplyService.findAllInReplyByInBoardNum(inBoardVo.getInBoardNum());
            allInReply.add(inReplyList);
        }

        List<InReplyVo> recentlyLawyerReplyList = inBoardReplyService.findRecentlyReplyLawyer();

        //List<InBoardVo> showInBoard = inBoardService.viewAllInBoard();
        //model.addAttribute("showInBoard", showInBoard);
        model.addAttribute("pagePost", pagePost);
        model.addAttribute("sortType", sortType);
        model.addAttribute("allInReply", allInReply);
        model.addAttribute("recentlyLawyerReplyList", recentlyLawyerReplyList);
        //model.addAttribute("page", page);

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
        List<InReplyVo> inReplyList = inBoardReplyService.findAllInReplyByInBoardNum(number);
        //      Long inBoardNum = inBoardVo.getInBoardNum();
        //     showPost = inBoardService.findPost(inBoardNum);

        if (showPost != null) {
            model.addAttribute("showPost", showPost);
            model.addAttribute("inReplyList", inReplyList);
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