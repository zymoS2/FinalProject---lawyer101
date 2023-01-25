package com.kh.lawservice101.knowledgein.controller;

import com.kh.lawservice101.client.model.service.ClientService;
import com.kh.lawservice101.client.model.vo.ClientVo;
import com.kh.lawservice101.knowledgein.model.service.HelpfulService;
import com.kh.lawservice101.knowledgein.model.service.InBoardService;
import com.kh.lawservice101.knowledgein.model.vo.HelpfulVo;
import com.kh.lawservice101.knowledgein.model.vo.InBoardVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class HelpfulController {
    private final HelpfulService helpfulService;
    private final InBoardService inBoardService;
    private final ClientService clientService;


    //도움됐어요 동작
    @ResponseBody
    @RequestMapping("/helpfulCheck")
    public int updateHelpful(@RequestParam Long inBoardNum, @RequestParam Long clientNum, @ModelAttribute HelpfulVo helpfulVo, Model model) {


        inBoardService.helpCount(inBoardNum);
        InBoardVo post = inBoardService.findPost(inBoardNum);
        ClientVo clientVo = clientService.findClient(clientNum);

        helpfulVo.setClientVo(clientVo);
        helpfulVo.setInBoardVo(post);

        HelpfulVo helpfulClick = helpfulService.saveHelpful(helpfulVo);
        model.addAttribute("helpfulClick", helpfulClick);

        return post.getInBoardHelpCount();
    }
}