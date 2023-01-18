package com.kh.lawservice101.client.controller;

import com.kh.lawservice101.client.model.service.ClientService;
import com.kh.lawservice101.client.model.vo.ClientVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class ClientLoginController {
    private final ClientService clientService;

    @GetMapping("/clientLogin")
    public String clientLogin(HttpServletRequest request) {

        // 1.로그인 상태라면 로그인 버튼을 눌렀을때 메인이 보인다
        HttpSession session = request.getSession();
        ClientVo clientPram = (ClientVo) session.getAttribute("client");

        if (clientPram != null) {
            return "redirect:/";
        } else {
            // 2.로그인 상태가 아니라면 로그인 화면이 보인다
            return "clientLogin";
        }
    }

    @PostMapping("/clientLogin/select.do")
    public String insert(HttpServletRequest request, @ModelAttribute ClientVo clientVo) {

        ClientVo findClientIdPwVo = clientService.findClientIdPw(clientVo);

        if (findClientIdPwVo != null && findClientIdPwVo.getClientId() != null) {
            HttpSession session = request.getSession();
            session.setAttribute("client", findClientIdPwVo);

            return "redirect:/";
        } else {
            return "redirect:/clientLogin";
        }
    }
}

