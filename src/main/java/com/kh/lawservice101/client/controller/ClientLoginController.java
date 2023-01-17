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
    public String clientLogin() {
        return "clientLogin";
    }

    @PostMapping("/clientLogin/select.do")
    public String insert(HttpServletRequest request, @ModelAttribute ClientVo clientVo) {

        ClientVo findClientIdPwVo = clientService.findClientIdPw(clientVo);

        if (findClientIdPwVo != null && findClientIdPwVo.getClientId() != null) {
            HttpSession session = request.getSession();
            session.setAttribute("client", findClientIdPwVo);

            ClientVo sessionClient = (ClientVo) session.getAttribute("client");


            return "redirect:/clientLogin";
        } else {
            return "redirect:/clientLogin";
        }
    }
}

