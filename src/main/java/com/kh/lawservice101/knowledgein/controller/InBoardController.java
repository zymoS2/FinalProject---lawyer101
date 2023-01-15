package com.kh.lawservice101.knowledgein.controller;

import com.kh.lawservice101.knowledgein.model.service.InBoardService;
import com.kh.lawservice101.knowledgein.model.vo.InBoardVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class InBoardController {
    private final InBoardService inBoardService;

    @GetMapping("/knowledgeInPost")
    public String knowledgeInPost(){
        return "knowledgeInPost";
    }

    @PostMapping("/knowledgeInPost/insert.do")
    public String insert(@ModelAttribute InBoardVo inBoardVo){
        inBoardService.postInBoard(inBoardVo);
        return "redirect:/knowledgeInPost";

    }
}
