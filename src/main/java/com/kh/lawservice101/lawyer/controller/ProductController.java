package com.kh.lawservice101.lawyer.controller;

import com.github.pagehelper.PageInfo;
import com.kh.lawservice101.lawyer.model.service.LawyerService;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import com.kh.lawservice101.lawyer.model.vo.SearchCon;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/product")
@Slf4j
public class ProductController {

    private final LawyerService lawyerService;
    private final static int PAGE_SIZE = 12;

    @GetMapping("/list")
    public String list(@ModelAttribute SearchCon searchCon, Model model) {
        searchCon.setPageSize(PAGE_SIZE);

        PageInfo<LawyerVo> pageLawyer = PageInfo.of(lawyerService.pagingLawyer(searchCon));

        model.addAttribute("pageLawyer", pageLawyer);
        model.addAttribute("keyword", searchCon.getKeyword());

        return "list/list";
    }

    @GetMapping("/list/lawyer")
    public String lawyerList(@ModelAttribute SearchCon searchCon, Model model) {
        searchCon.setPageSize(PAGE_SIZE);

        PageInfo<LawyerVo> pageLawyer = PageInfo.of(lawyerService.pagingLawyer(searchCon));

        model.addAttribute("pageLawyer", pageLawyer);
        model.addAttribute("keyword", searchCon.getKeyword());

        return "list/lawyerList";
    }

    @GetMapping("/list/loadLawyers")
    public String loadLawyers(@ModelAttribute SearchCon searchCon, Model model) {
        searchCon.setPageSize(PAGE_SIZE);

        PageInfo<LawyerVo> pageLawyer = PageInfo.of(lawyerService.pagingLawyer(searchCon));
        List<LawyerVo> lawyerList = pageLawyer.getList();

        model.addAttribute("lawyerList", lawyerList);

        return "list/lawyerListAjaxPage";
    }

    @GetMapping("/list/knowledgeIn")
    public String knowledgeInList(@ModelAttribute SearchCon searchCon, Model model) {
        searchCon.setPageSize(PAGE_SIZE);

        model.addAttribute("keyword", searchCon.getKeyword());
        return "list/knowledgeinList";
    }

    @GetMapping("/list/loadKnowledgeIns")
    public String loadKnowledgeIns(@ModelAttribute SearchCon lawyerSearchCon, Model model) {

        return "ok";
    }
}
