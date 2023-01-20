package com.kh.lawservice101.client.controller;

import com.kh.lawservice101.client.model.service.ClientService;
import com.kh.lawservice101.client.model.vo.ClientVo;
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
public class ClientController {

    private final ClientService clientService;

    @GetMapping("/client/myPage/{num}")
    public String myPageForm(@PathVariable Long num, Model model) {
        ClientVo client = clientService.findClient(num);
        model.addAttribute("client", client);
        return "member/client/myPage";
    }

    @PostMapping("/client/myPage/{num}")
    public String myPageEditInfo(@PathVariable Long num, @ModelAttribute ClientVo clientVo) {
        ClientVo findClient = clientService.findClient(num);
        clientService.editInfo(findClient, clientVo);

        return "redirect:/client/myPage/" + num;
    }
}
