package com.kh.lawservice101.common.controller;

import com.kh.lawservice101.common.model.sevice.SMSService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class SMSController {

    private final SMSService smsService;

    @GetMapping("/join/sendSMS")
    public String SMSSend(@RequestParam String phoneNum) {
        int randomNumber = (int)((Math.random() * (9999 - 1000 + 1)) + 1000); // 난수 생성

//        smsService.certifiedPhoneNumber(phoneNum, randomNumber);
        System.out.println("randomNumber = " + randomNumber);
        return Integer.toString(randomNumber); // data 반환
    }
}
