package com.kh.lawservice101.refund.controller;


import com.kh.lawservice101.client.model.vo.ClientVo;
import com.kh.lawservice101.payment.model.service.PaymentService;
import com.kh.lawservice101.refund.model.service.RefundService;
import com.siot.IamportRestClient.IamportClient;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping
@RequiredArgsConstructor
public class RefundController {

    private final RefundService refundService;
    private final PaymentService paymentService;

    @PostMapping("/paymentRefund")
    @ResponseBody
    public String paymentRefund (@SessionAttribute(value = "client") ClientVo clientVo, @RequestParam Map<String,Object> map) throws IOException {

        String token = refundService.getToken();


        String merchantUid =  (String) map.get("merchant_uid");
        String impUid = (String) map.get("imp_uid");
        int productPrice = Integer.parseInt(String.valueOf(map.get("cancel_request_amount"))) ; //DB에 꺼내온 값임 ( 검증했음! )
        Long paymentNum = Long.parseLong(String.valueOf(map.get("paymentNum"))) ;

        //System.out.println("RefundController 에서 : " + paymentNum);

        refundService.paymentCancel(token, merchantUid, impUid, productPrice);
        refundService.saveRefund(paymentNum,impUid);

        //환불 시,회원 결제 상태 수정.
        paymentService.modifyPaymentState(paymentNum);


        System.out.println("잘됐어용!");

        return "ok";
    }
}
