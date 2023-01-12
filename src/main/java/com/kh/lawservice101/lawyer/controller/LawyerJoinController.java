package com.kh.lawservice101.lawyer.controller;


import com.kh.lawservice101.lawyer.model.service.CompanyService;
import com.kh.lawservice101.lawyer.model.service.LawyerService;

import com.kh.lawservice101.lawyer.model.vo.CompanyVo;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class LawyerJoinController {
    private final LawyerService lawyerService;
    private final CompanyService companyService;


    @GetMapping("/lawyerJoin")
    public String lawyerJoin() {
        return "lawyerJoin";
    }

    @PostMapping("/lawyerJoin/insert.do")
    public String insert(@ModelAttribute LawyerVo lawyerVo ,@ModelAttribute CompanyVo companyVo) {
        lawyerService.saveLawyer(lawyerVo);
      companyService.saveCompany(companyVo);

        return "redirect:/lawyerJoin";
    }
}
