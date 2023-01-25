package com.kh.lawservice101.knowledgein.controller;

import com.kh.lawservice101.knowledgein.model.service.InBoardReplyService;
import com.kh.lawservice101.knowledgein.model.service.InBoardService;
import com.kh.lawservice101.knowledgein.model.vo.InBoardVo;
import com.kh.lawservice101.knowledgein.model.vo.InReplyVo;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class InBoardReplyController {
    private final InBoardReplyService inBoardReplyService;
    private final InBoardService inBoardService;

    @PostMapping("/knowledgeInDetail/reply")
    @ResponseBody
    public Map<String, Object> replyWrite(@SessionAttribute("lawyer") LawyerVo lawyerVo,
                                           @RequestParam Long num,
                                           @ModelAttribute InReplyVo inReplyVo) {
        InBoardVo inBoardVo = inBoardService.findPost(num);
        inReplyVo.setLawyerVo(lawyerVo);
        inReplyVo.setInBoardVo(inBoardVo);
        inBoardReplyService.saveInboardReply(inReplyVo);


        List<InReplyVo> inReplyList = inBoardReplyService.findAllInReplyByInBoardNum(num);
        InReplyVo findInReply = inBoardReplyService.findInReply(inReplyVo.getReplyNum());
        HashMap<String, Object> map = new HashMap<>();
        map.put("replyContent", findInReply.getReplyContent());
        map.put("lawyerName", findInReply.getLawyerVo().getLawyerName());
        map.put("lawyerNum", findInReply.getLawyerVo().getLawyerNum());
        map.put("lawyerImg", findInReply.getLawyerVo().getLawyerImg());
        map.put("companyName", findInReply.getLawyerVo().getCompanyVo().getCompanyName());
        map.put("replyDate", findInReply.getReplyDate());
        map.put("replySize", inReplyList.size());

        return map;
    }
}
