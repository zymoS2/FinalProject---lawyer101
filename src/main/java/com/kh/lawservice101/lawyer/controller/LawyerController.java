package com.kh.lawservice101.lawyer.controller;

import com.kh.lawservice101.lawyer.model.dto.EditInfoDto;
import com.kh.lawservice101.lawyer.model.dto.EditProfileDto;
import com.kh.lawservice101.lawyer.model.service.LawyerService;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
@Slf4j
public class LawyerController {

    private final LawyerService lawyerService;

    // 마이페이지 프로필
    @GetMapping("/lawyer/myPage/{num}")
    public String myPage(@PathVariable Long num, Model model) {
        LawyerVo lawyer = lawyerService.findLawyer(num);

        model.addAttribute("lawyer", lawyer);
        return "member/lawyer/myPage";
    }

    // 개인정보 수정
    @PostMapping("/lawyer/myPage/info/{num}")
    public String editInfo(@PathVariable Long num, @ModelAttribute EditInfoDto editInfoDto) {
        lawyerService.infoModify(num, editInfoDto);

        return "redirect:/lawyer/myPage/" + num;
    }

    // 프로필 수정
    @PostMapping("/lawyer/myPage/profile/{num}")
    public String editProfile(@PathVariable Long num, @ModelAttribute EditProfileDto editProfileDto) {
        lawyerService.profileModify(num, editProfileDto);

        return "redirect:/lawyer/myPage/" + num;
    }
}
