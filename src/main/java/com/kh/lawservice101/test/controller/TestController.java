package com.kh.lawservice101.test.controller;

import com.kh.lawservice101.payment.model.service.PaymentService;
import com.kh.lawservice101.payment.model.vo.PaymentVo;
import com.kh.lawservice101.test.model.service.TestService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Controller
@RequiredArgsConstructor
public class TestController {

    private final TestService testService;
    private final PaymentService paymentService;

    List<PaymentVo> clientReservationList;

    @GetMapping("/test")
    public String test() {
        return "test";
    }

    @PostMapping("/testInsert")
    public String testSave(@RequestParam String id, @RequestParam String password) {
        testService.join(id, password);
        return "redirect:/";
    }
}
