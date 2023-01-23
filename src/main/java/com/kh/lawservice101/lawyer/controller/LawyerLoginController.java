package com.kh.lawservice101.lawyer.controller;

import com.kh.lawservice101.lawyer.model.service.LawyerService;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class LawyerLoginController {
    private final LawyerService lawyerService;

    @GetMapping("/lawyerLogin")
    public String lawyerLogin(HttpServletRequest request) {

        // 1.로그인 상태라면 로그인 버튼을 눌렀을때 메인이 보인다
        HttpSession session = request.getSession();
        LawyerVo lawyerPram = (LawyerVo) session.getAttribute("lawyer");

        if (lawyerPram != null) {
            return "redirect:/";
        } else {
            // 2.로그인 상태가 아니라면 로그인 화면이 보인다
            return "lawyerLogin";
        }
    }

    @PostMapping("/lawyerLogin/select.do")
    public String insert(HttpServletRequest request, @ModelAttribute LawyerVo lawyerVo) {

        LawyerVo findLawyerIdPwVo = lawyerService.findLawyerIdPwd(lawyerVo);

        if (findLawyerIdPwVo != null && findLawyerIdPwVo.getLawyerId() != null) {
            HttpSession session = request.getSession();
            session.setAttribute("lawyer", findLawyerIdPwVo);
            return "redirect:/";
        } else {
            return "redirect:/lawyerLogin";
        }
    }

    // 로그아웃
    @GetMapping("/lawyerLogout")
    public String logout(HttpSession session) {
        session.removeAttribute("lawyer");
        return "redirect:/lawyerLogin";
    }
}