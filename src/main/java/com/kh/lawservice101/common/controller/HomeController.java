package com.kh.lawservice101.common.controller;

import com.kh.lawservice101.knowledgein.model.service.InBoardService;
import com.kh.lawservice101.knowledgein.model.vo.InBoardVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final InBoardService inBoardService;

    @GetMapping("/")
    public String home(Model model) {
        ArrayList<InBoardVo> inBoardList = inBoardService.viewAllInBoard();
        model.addAttribute("inBoardList", inBoardList);
        return "main";
    }
}