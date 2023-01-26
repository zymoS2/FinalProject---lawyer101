package com.kh.lawservice101.lawyer.controller;

import com.kh.lawservice101.lawyer.model.service.CompanyService;
import com.kh.lawservice101.lawyer.model.service.LawyerService;
import com.kh.lawservice101.lawyer.model.vo.CompanyVo;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
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
        LawyerVo lawyerPram = new LawyerVo();
        lawyerPram.setLawyerNum(Long.valueOf(27));
        LawyerVo findLawyerVo = lawyerService.findLawyer(lawyerPram);

        return "lawyerJoin";
    }

    @PostMapping("/lawyerJoin/insert.do")
    public String insert(@ModelAttribute LawyerVo lawyerPram, @ModelAttribute CompanyVo companyPram) {

        lawyerService.saveLawyer(lawyerPram); // 변호사 등록

        CompanyVo checkCompany = companyService.findCompany(companyPram); // 회사조회

        if (checkCompany == null || checkCompany.getCompanyNum() == null) { // 회사없음
            companyService.saveCompany(companyPram); // 회사 등록
        }
        CompanyVo checkCompanyAf = companyService.findCompany(companyPram); // 회사조회

        if (checkCompanyAf != null && checkCompanyAf.getCompanyNum() != null) { // 회사 있음
            lawyerPram.setCompanyVo(checkCompanyAf);
            lawyerService.updateLawyer(lawyerPram);
        }
        return "redirect:/lawyerLogin";
    }
}