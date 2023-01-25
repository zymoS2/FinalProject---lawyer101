package com.kh.lawservice101.refund.controller;


import com.kh.lawservice101.refund.model.service.RefundService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping
@RequiredArgsConstructor
public class RefundController {

    private final RefundService refundService;

    @PostMapping("/paymentRefund")
    @ResponseBody
    public String paymentRefund (@RequestParam Map<String,Object> map) throws IOException {

        System.out.println("merchantUid : " + map.get("merchant_uid"));
        System.out.println("impUid : "+ map.get("imp_uid"));

        String token = refundService.getToken();

        String merchanUid =  (String) map.get("merchant_uid");
        String impUid = (String) map.get("imp_uid");
        int productPrice = (int) map.get("cancel_request_amount");

        refundService.paymentCancle(token, merchanUid, impUid, productPrice);



        return "ok";
    }
}
