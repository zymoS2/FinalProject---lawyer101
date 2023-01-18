package com.kh.lawservice101.lawyer.controller;

import com.github.pagehelper.PageInfo;
import com.kh.lawservice101.lawyer.model.service.LawyerService;
import com.kh.lawservice101.lawyer.model.vo.LawyerSearchCon;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/product")
@Slf4j
public class ProductController {

    private final LawyerService lawyerService;
    private final static int PAGE_SIZE = 12;

    @GetMapping("/list")
    public String list(@ModelAttribute LawyerSearchCon lawyerSearchCon, Model model) {
        lawyerSearchCon.setPageSize(PAGE_SIZE);

        PageInfo<LawyerVo> pageLawyer = PageInfo.of(lawyerService.pagingLawyer(lawyerSearchCon));

        model.addAttribute("pageLawyer", pageLawyer);
        model.addAttribute("keyword", lawyerSearchCon.getKeyword());

        return "list/list";
    }

    @GetMapping("/list/lawyer")
    public String lawyerList(@ModelAttribute LawyerSearchCon lawyerSearchCon, Model model) {
        lawyerSearchCon.setPageSize(PAGE_SIZE);

        PageInfo<LawyerVo> pageLawyer = PageInfo.of(lawyerService.pagingLawyer(lawyerSearchCon));

        model.addAttribute("pageLawyer", pageLawyer);
        model.addAttribute("keyword", lawyerSearchCon.getKeyword());

        return "list/lawyerList";
    }

    @GetMapping("/list/loadLawyers")
    public String loadLawyers(@ModelAttribute LawyerSearchCon lawyerSearchCon, Model model) {
        lawyerSearchCon.setPageSize(PAGE_SIZE);

        PageInfo<LawyerVo> pageLawyer = PageInfo.of(lawyerService.pagingLawyer(lawyerSearchCon));
        List<LawyerVo> lawyerList = pageLawyer.getList();

        model.addAttribute("lawyerList", lawyerList);

        return "list/lawyerListAjaxPage";
    }
}
