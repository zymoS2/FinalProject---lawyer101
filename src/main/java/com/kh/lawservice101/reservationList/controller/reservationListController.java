package com.kh.lawservice101.reservationList.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping
public class reservationListController {

    @GetMapping("/reservation-list")
    public String reservationList(){
        return "mypage/ReservationList";
    }
}
