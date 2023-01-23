package com.kh.lawservice101.common.controller;

import com.kh.lawservice101.common.model.sevice.MailService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/auth")
@Slf4j
public class MemberController {

    private final MailService mailService;

    @GetMapping("/find-account")
    public String findAccountForm() {
        return "find-account";
    }

    @PostMapping("/find-account/find-id")
    @ResponseBody
    public String findIdEmailSend(@RequestParam("email") String findIdEmail) {
        mailService.findIdMailSend(findIdEmail);
        return "";
    }

    @PostMapping("/find-account/reset-pwd")
    @ResponseBody
    public String resetPwdEmailSend(@RequestParam("id") String resetPwdId, @RequestParam("email") String resetPwdEmail) {
        mailService.resetPwdEmailSend(resetPwdId, resetPwdEmail);
        return "";
    }
}
