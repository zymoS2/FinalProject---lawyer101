package com.kh.lawservice101.booking.controller;

import com.kh.lawservice101.booking.model.service.BookingService;
import com.kh.lawservice101.booking.model.vo.BookingVo;
import com.kh.lawservice101.client.model.service.ClientService;
import com.kh.lawservice101.client.model.vo.ClientVo;
import com.kh.lawservice101.lawyer.model.service.LawyerService;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value="/booking", produces="text/plain;charset=UTF-8")
@RequiredArgsConstructor
public class BookingController {

    //private final BookingService bookingService;
    private final LawyerService lawyerService;
    private final ClientService clientService;


    LawyerVo lawyerInfo;
    ClientVo clientInfo;

    //예약 페이지 뿌려주는 GET메서드
    @GetMapping("/{lawyerNum}")
    public String bookingList(@PathVariable Long lawyerNum, Model model){
        lawyerNum = 3L; //임시
        lawyerInfo = lawyerService.findLawyer(lawyerNum);
        model.addAttribute("lawyerInfo",lawyerInfo); //모델은 화면에 뿌려주는거.
        return "booking/booking";
    }

    @PostMapping("/{lawyerNum}")                                //여기에 bookingDate,bookingTime 값이 넣어져서 들어옴.
    public String postBooking(@PathVariable Long lawyerNum, @ModelAttribute BookingVo bookingVo, HttpSession httpSession){
        lawyerInfo = lawyerService.findLawyer(lawyerNum);
        bookingVo.setLawyerVo(lawyerInfo);

         //임시, 로그인 세션으로 clientVo 값 넣어주기
        Long clientNum = 2L;
        clientInfo = clientService.findClient(clientNum);
        bookingVo.setClientVo(clientInfo);

        httpSession.setAttribute("bookingVo1",bookingVo);
        return "redirect:/booking/go-counselpage"; //redirect:/ -> url로 보내줌
    }

    //상담 글 작성 페이지 뿌려주는 GET메서드
    @GetMapping("/go-counselpage")
    public String bookingDetails(@SessionAttribute BookingVo bookingVo1, Model model){
        model.addAttribute("bookingDate", bookingVo1.getBookingDate());
        model.addAttribute("bookingTime", bookingVo1.getBookingTime());

        //임시로 클라이언트 정보를 가져옴.
        Long clientNum = 4L;
        clientInfo = clientService.findClient(clientNum);
        model.addAttribute("clientInfo",clientInfo);
        return "booking/counseling";
    }

   //상담글 post
    @PostMapping("/go-counselpage")
    public String bookingAdd(@RequestParam String counselingContent, @SessionAttribute BookingVo bookingVo1){
        bookingVo1.setCounselingContent(counselingContent);
        return "redirect:/payment/pay"; // controller간의 이동
    }

}
