package com.kh.lawservice101.booking.controller;

import com.kh.lawservice101.booking.model.service.BookingService;
import com.kh.lawservice101.booking.model.vo.BookingVo;
import com.kh.lawservice101.client.model.service.ClientService;
import com.kh.lawservice101.client.model.vo.ClientVo;
import com.kh.lawservice101.lawyer.model.service.LawyerService;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping(value = "/booking", produces = "text/plain;charset=UTF-8")
@RequiredArgsConstructor
public class BookingController {

    private final BookingService bookingService;
    private final LawyerService lawyerService;
    private final ClientService clientService;


    LawyerVo lawyerInfo;
   // ClientVo clientInfo;

    //예약 페이지 뿌려주는 GET메서드
    @GetMapping("/{lawyerNum}")
    public String bookingList(@SessionAttribute(value="client", required = false) ClientVo clientVo, @PathVariable Long lawyerNum, Model model) {

//        if(clientVo == null ) {
//           return "redirect:/clientLogin";
//        } else  {
//            lawyerInfo = lawyerService.findLawyer(lawyerNum);
//            model.addAttribute("lawyerInfo", lawyerInfo); //모델은 화면에 뿌려주는거.
//            return "booking/booking";
//        }

            lawyerInfo = lawyerService.findLawyer(lawyerNum);
            model.addAttribute("lawyerInfo", lawyerInfo); //모델은 화면에 뿌려주는거.
           return "booking/booking";
    }

    @PostMapping("/{lawyerNum}")                                //여기에 bookingDate,bookingTime 값이 넣어져서 들어옴.
    public String postBooking(@SessionAttribute(value="client", required = false) ClientVo clientVo,@PathVariable Long lawyerNum, @ModelAttribute BookingVo bookingVo, HttpSession httpSession) {
        lawyerInfo = lawyerService.findLawyer(lawyerNum);
        bookingVo.setLawyerVo(lawyerInfo);

       // Long clientNum = clientVo.getClientNum();
       // clientInfo = clientService.findClient(clientNum);
       // bookingVo.setClientVo(clientInfo);

        httpSession.setAttribute("bookingVo1", bookingVo);
        return "redirect:/booking/go-counselpage"; //redirect:/ -> url로 보내줌
    }

    //상담 글 작성 페이지 뿌려주는 GET메서드
    @GetMapping("/go-counselpage")
    public String bookingDetails(@SessionAttribute(value="client") ClientVo clientVo, @SessionAttribute BookingVo bookingVo1, Model model) {
        model.addAttribute("bookingDate", bookingVo1.getBookingDate());
        model.addAttribute("bookingTime", bookingVo1.getBookingTime());

        // Long clientNum = clientVo.getClientNum();
        // clientInfo = clientService.findClient(clientNum);
        // model.addAttribute("clientInfo", clientInfo);

        return "booking/counseling";
    }

    //상담글 post
    @PostMapping("/go-counselpage")
    public String bookingAdd(@SessionAttribute(value="client") ClientVo clientVo, @RequestParam String counselingContent, @SessionAttribute BookingVo bookingVo1) {
        bookingVo1.setCounselingContent(counselingContent);
        return "redirect:/payment/pay"; // controller간의 이동
    }

    @PostMapping(value = "/getTimeByDate", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<String> getTimeByDate(@RequestParam String selectDate) {
        int hour = LocalDateTime.now().getHour();
       // System.out.println("date = " + selectDate); //클릭한 날짜
       // System.out.println("hour = " + hour); //현재 시간

        List<String> bookingListByDate = bookingService.findBookingListByDate(selectDate); //클릭한 날짜의 예약 목록들을 가져옴.
       // System.out.println("bookingListByDate : " + bookingListByDate);



        return bookingListByDate;
    }
}
