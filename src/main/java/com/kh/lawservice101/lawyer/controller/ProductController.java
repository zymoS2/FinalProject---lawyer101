package com.kh.lawservice101.lawyer.controller;

import com.github.pagehelper.PageInfo;
import com.kh.lawservice101.category.model.service.CategoryService;
import com.kh.lawservice101.category.model.vo.CategoryVo;
import com.kh.lawservice101.knowledgein.model.service.InBoardReplyService;
import com.kh.lawservice101.knowledgein.model.service.InBoardService;
import com.kh.lawservice101.knowledgein.model.vo.InBoardVo;
import com.kh.lawservice101.knowledgein.model.vo.InReplyVo;
import com.kh.lawservice101.lawyer.model.dto.SearchCon;
import com.kh.lawservice101.lawyer.model.service.LawyerService;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import com.kh.lawservice101.review.model.service.ReviewService;
import com.kh.lawservice101.review.model.vo.ReviewVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/product")
@Slf4j
public class ProductController {

    private final CategoryService categoryService;
    private final LawyerService lawyerService;
    private final InBoardService inBoardService;
    private final ReviewService reviewService;
    private final InBoardReplyService inBoardReplyService;
    private final static int PAGE_SIZE = 12;
    private final static int PAGE_NUM = 1;

    // 변호사 상세 페이지
    @GetMapping("/detail/{num}")
    public String ProductDetailPage(@PathVariable Long num, Model model) {
        LawyerVo lawyer = lawyerService.findLawyer(num);
        CategoryVo categoryVo = categoryService.findCategory(lawyer.getCategoryVo().getCategoryNum());
        List<ReviewVo> reviewList = reviewService.findReviewListByLawyerNum(num);
        List<InReplyVo> inReplyList = inBoardReplyService.findAllInReplyByLawyerNum(num);

        model.addAttribute("lawyer", lawyer);
        model.addAttribute("categoryVo", categoryVo);
        model.addAttribute("reviewList", reviewList);
        model.addAttribute("inReplyList", inReplyList);

        return "product/ProductDetailPage";
    }

    // 변호사 리뷰 목록
    @GetMapping("/detail/{num}/review")
    public String reviewList(@PathVariable Long num, Model model) {
        LawyerVo lawyer = lawyerService.findLawyer(num);
        PageInfo<ReviewVo> pageReview = PageInfo.of(reviewService.pagingReview(num, PAGE_NUM, PAGE_SIZE));

        model.addAttribute("lawyer", lawyer);
        model.addAttribute("pageReview", pageReview);
        return "product/reviewList";
    }

    // 변호사 리뷰 목록 페이징
    @GetMapping("/detail/{num}/loadReview")
    public String loadReview(@PathVariable Long num, @RequestParam int pageNum, Model model) {
        PageInfo<ReviewVo> pageReview = PageInfo.of(reviewService.pagingReview(num, pageNum, PAGE_SIZE));
        List<ReviewVo> reviewList = pageReview.getList();

        model.addAttribute("reviewList", reviewList);

        return "product/reviewListAjaxPage";
    }

    // 변호사 답변 목록
    @GetMapping("/detail/{num}/reply")
    public String replyList(@PathVariable Long num, Model model) {
        LawyerVo lawyer = lawyerService.findLawyer(num);
        PageInfo<InReplyVo> pageInReply = PageInfo.of(inBoardReplyService.pagingInReply(num, PAGE_NUM, PAGE_SIZE));

        model.addAttribute("lawyer", lawyer);
        model.addAttribute("pageInReply", pageInReply);
        return "product/replyList";
    }

    // 변호사 리뷰 목록 페이징
    @GetMapping("/detail/{num}/loadReply")
    public String loadReply(@PathVariable Long num, @RequestParam int pageNum, Model model) {
        PageInfo<InReplyVo> pageInReply = PageInfo.of(inBoardReplyService.pagingInReply(num, pageNum, PAGE_SIZE));
        List<InReplyVo> inReplyList = pageInReply.getList();

        model.addAttribute("inReplyList", inReplyList);

        return "product/replyListAjaxPage";
    }

    // 변호사, 지식인 검색 목록
    @GetMapping("/list")
    public String list(@ModelAttribute SearchCon searchCon, @RequestParam(required = false, defaultValue = "") String type, Model model) {
        searchCon.setPageSize(PAGE_SIZE);

        PageInfo<LawyerVo> pageLawyer = PageInfo.of(lawyerService.pagingLawyer(searchCon));
        PageInfo<InBoardVo> pageInBoard = PageInfo.of(inBoardService.pagingInboard(searchCon));

        List<List<InReplyVo>> allInReply = new ArrayList<>();
        for (InBoardVo inBoardVo :pageInBoard.getList()) {
            List<InReplyVo> inReplyList = inBoardReplyService.findAllInReplyByInBoardNum(inBoardVo.getInBoardNum());
            allInReply.add(inReplyList);
        }

        model.addAttribute("pageLawyer", pageLawyer);
        model.addAttribute("pageInBoard", pageInBoard);
        model.addAttribute("allInReply", allInReply);
        model.addAttribute("keyword", searchCon.getKeyword());

        // type 이 lawyer 인 경우 변호사 목록
        if (type.equals("lawyer")) {
            return "list/lawyerList";
        }

        // type 이 knowledgeIn 인 경우 지식인 목록
        if (type.equals("knowledgeIn")) {
            return "list/knowledgeInList";
        }

        return "list/list";
    }

    // 변호사 목록 스크롤 페이징
    @GetMapping("/list/loadLawyers")
    public String loadLawyers(@ModelAttribute SearchCon searchCon, Model model) {
        searchCon.setPageSize(PAGE_SIZE);

        PageInfo<LawyerVo> pageLawyer = PageInfo.of(lawyerService.pagingLawyer(searchCon));
        List<LawyerVo> lawyerList = pageLawyer.getList();

        model.addAttribute("lawyerList", lawyerList);

        return "list/lawyerListAjaxPage";
    }

    // 지식인 목록 스크롤 페이징
    @GetMapping("/list/loadKnowledgeIns")
    public String loadKnowledgeIns(@ModelAttribute SearchCon searchCon, Model model) {
        System.out.println("searchCon = " + searchCon.getKeyword());
        System.out.println("searchCon = " + searchCon.getPageNum());
        searchCon.setPageSize(PAGE_SIZE);

        PageInfo<InBoardVo> pageLawyer = PageInfo.of(inBoardService.pagingInboard(searchCon));
        List<InBoardVo> inBoardList = pageLawyer.getList();

        List<List<InReplyVo>> allInReply = new ArrayList<>();
        for (InBoardVo inBoardVo : inBoardList) {
            List<InReplyVo> inReplyList = inBoardReplyService.findAllInReplyByInBoardNum(inBoardVo.getInBoardNum());
            allInReply.add(inReplyList);
        }

        model.addAttribute("inBoardList", inBoardList);

        return "list/knowledgeInListAjaxPage";
    }
}
