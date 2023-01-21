package com.kh.lawservice101.lawyer.controller;

import com.github.pagehelper.PageInfo;
import com.kh.lawservice101.category.model.service.CategoryService;
import com.kh.lawservice101.category.model.vo.CategoryVo;
import com.kh.lawservice101.knowledgein.model.service.InBoardService;
import com.kh.lawservice101.knowledgein.model.vo.InBoardVo;
import com.kh.lawservice101.lawyer.model.service.LawyerService;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import com.kh.lawservice101.lawyer.model.dto.SearchCon;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/product")
@Slf4j
public class ProductController {

    private final CategoryService categoryService;
    private final LawyerService lawyerService;
    private final InBoardService inBoardService;
    private final static int PAGE_SIZE = 12;

    @GetMapping("/detail/{num}")
    public String ProductDetailPage(@PathVariable Long num, Model model) {
        LawyerVo lawyer = lawyerService.findLawyer(num);
        CategoryVo categoryVo = categoryService.findCategory(lawyer.getCategoryVo().getCategoryNum());
        model.addAttribute("lawyer", lawyer);
        model.addAttribute("categoryVo", categoryVo);
        return "product/ProductDetailPage";
    }

    // 변호사, 지식인 검색 목록
    @GetMapping("/list")
    public String list(@ModelAttribute SearchCon searchCon, @RequestParam(required = false, defaultValue = "") String type, Model model) {
        searchCon.setPageSize(PAGE_SIZE);

        PageInfo<LawyerVo> pageLawyer = PageInfo.of(lawyerService.pagingLawyer(searchCon));
        PageInfo<InBoardVo> pageInBoard = PageInfo.of(inBoardService.pagingInboard(searchCon));

        model.addAttribute("pageLawyer", pageLawyer);
        model.addAttribute("pageInBoard", pageInBoard);
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

        model.addAttribute("inBoardList", inBoardList);

        return "list/knowledgeInListAjaxPage";
    }
}
