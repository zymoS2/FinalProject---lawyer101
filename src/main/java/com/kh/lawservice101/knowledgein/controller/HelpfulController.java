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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class HelpfulController {
    private final HelpfulService helpfulService;
    private final InBoardService inBoardService;
    private final ClientService clientService;


    //도움됐어요 동작
    @ResponseBody
    @RequestMapping("/helpfulCheck")
    public Map<String, Object> updateHelpful(@RequestParam Long inBoardNum, @RequestParam Long clientNum, Model model) {

        InBoardVo inBoardVo = new InBoardVo();
        inBoardVo.setInBoardNum(inBoardNum);

        ClientVo clientVo = new ClientVo();
        clientVo.setClientNum(clientNum);

        HelpfulVo helpfulVo = new HelpfulVo();
        helpfulVo.setInBoardVo(inBoardVo);
        helpfulVo.setClientVo(clientVo);

        //1. 좋아요 이력테이블에서 유저시퀀스와 게시글 번호 조회한다
        HelpfulVo helpfulFind = helpfulService.selectHelpful(helpfulVo);
        //   helpfulVo.setInBoardVo(post);

        Map<String, Object> map = new HashMap<>();

        //1-1. 있다면  이미 눌러서 끝
        if (helpfulFind != null) {
            map.put("isHelpFul", false);
            return map;
        } else {
            //좋아요 카운트 올라감
            inBoardService.helpCount(inBoardNum);
            //     ClientVo clientVo = clientService.findClient(clientNum);
            //   helpfulVo.setClientVo(clientVo);
            //좋아요 이력 들어감
            helpfulService.saveHelpful(helpfulVo);

           InBoardVo post = inBoardService.findPost(inBoardNum);

            map.put("isHelpFul", true);
            map.put("count", post.getInBoardHelpCount());
            return map;
        }

        // 좋아요 버튼을 눌렀다면
        // return post.getInBoardHelpCount();
    }
}