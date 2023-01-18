package com.kh.lawservice101.client.controller;

import com.kh.lawservice101.client.model.service.ClientService;
import com.kh.lawservice101.client.model.vo.ClientVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class ClientJoinController {
    private final ClientService clientService;

    // 가입 유형 선택
   @GetMapping("/joinLanding")
   public String joinLanding(){
       return "joinLanding";
   }

    //의뢰인 회원가입
    @GetMapping("/clientJoin")
    public String clientJoin() {

        return "clientJoin";
    }

    @PostMapping("/clientJoin/insert.do")
    public String insert(@ModelAttribute ClientVo clientVo) {
        clientService.saveClient(clientVo);
        return "redirect:/clientJoin";
    }
}
