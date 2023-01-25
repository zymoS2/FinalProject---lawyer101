package com.kh.lawservice101.payment.controller;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;


@Controller
@RequestMapping("/verifyIamport")
@RequiredArgsConstructor
public class VerifyController {


    private final IamportClient iamportClient;

    //생성자를 통해 REST API와 REST API secret 입력.
    public VerifyController() {
        this.iamportClient = new IamportClient("1548401157108344","A8uzxb0JZbSQqovNButHMUZMqmaWzxX95AVFKlFCK8sywCPFtM5JNEjl4Tr2xGj6wyuZVxyeWExDAsNA");
    }

                // => /verifyIamport/imp_uid
    @PostMapping("/{imp_uid}")
    @ResponseBody
    public IamportResponse<Payment> paymentByImpUid(@PathVariable String imp_uid) throws IamportResponseException, IOException {
        System.out.println("paymentByImpUid 메서드 실행");
        System.out.println(iamportClient.paymentByImpUid(imp_uid));
        return iamportClient.paymentByImpUid(imp_uid);
    }
}

