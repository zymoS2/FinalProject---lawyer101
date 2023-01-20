package com.kh.lawservice101.lawyer.controller;

import com.kh.lawservice101.lawyer.model.service.LawyerService;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequiredArgsConstructor
@Slf4j
public class LawyerController {

    private final LawyerService lawyerService;

    @GetMapping("/lawyer/myPage/{num}")
    public String myPageForm(@PathVariable Long num, Model model) {
        LawyerVo lawyer = lawyerService.findLawyer(num);
        model.addAttribute("lawyer", lawyer);
        return "member/lawyer/myPage";
    }

    @PostMapping("/lawyer/myPage/{num}")
    public String myPageEditInfo(@PathVariable Long num, @ModelAttribute LawyerVo lawyerVo) {
        LawyerVo findLawyer = lawyerService.findLawyer(num);
        lawyerService.editInfo(findLawyer, lawyerVo);

        return "redirect:/lawyer/myPage/" + num;
    }

    @PostMapping("/lawyer/myPage/profile/{num}")
    public String myPageEditProfile(@PathVariable Long num, @RequestParam MultipartFile multipartFile,
                                    @ModelAttribute LawyerVo lawyerVo) {
        LawyerVo findLawyer = lawyerService.findLawyer(num);
        lawyerService.editProfile(findLawyer, multipartFile, lawyerVo);

        return "redirect:/lawyer/myPage/" + num;
    }
}
