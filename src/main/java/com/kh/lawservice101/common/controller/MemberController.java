package com.kh.lawservice101.common.controller;

import com.kh.lawservice101.common.model.sevice.MailService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String findIdEmailSend(@RequestParam String findIdEmail) {
        mailService.mailSend(findIdEmail);

        return "redirect:/";
    }
}
