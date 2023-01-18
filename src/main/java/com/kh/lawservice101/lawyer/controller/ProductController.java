package com.kh.lawservice101.lawyer.controller;

import com.kh.lawservice101.category.model.service.CategoryService;
import com.kh.lawservice101.category.model.vo.CategoryVo;
import com.kh.lawservice101.lawyer.model.service.LawyerService;
import com.kh.lawservice101.lawyer.model.vo.CompanyVo;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;

@Controller
@RequestMapping("/product")
@RequiredArgsConstructor
public class ProductController {
    private final LawyerService lawyerService;
    private final CategoryService categoryService;

    @GetMapping("/detail/{num}")
    public String ProductDetailPage(@PathVariable Long num, Model model) {
        LawyerVo lawyer = lawyerService.findLawyer(num);
        ArrayList<CategoryVo> categoryList = categoryService.findLawyerCategory(lawyer.getLawyerNum());
        model.addAttribute("lawyer", lawyer);
        model.addAttribute("categoryList", categoryList);
        return "product/ProductDetailPage";
    }
}
