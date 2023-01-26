package com.kh.lawservice101.lawyer.controller;

import com.kh.lawservice101.booking.model.service.BookingService;
import com.kh.lawservice101.booking.model.vo.BookingVo;
import com.kh.lawservice101.lawyer.model.dto.EditInfoDto;
import com.kh.lawservice101.lawyer.model.dto.EditProfileDto;
import com.kh.lawservice101.lawyer.model.service.LawyerService;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import com.kh.lawservice101.payment.model.service.PaymentService;
import com.kh.lawservice101.payment.model.vo.PaymentVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/lawyerpage")
public class LawyerMypageController {

    private final PaymentService paymentService;
    private final BookingService bookingService;
    private final LawyerService lawyerService;

    List<PaymentVo> LawyerCounselList = null;
    BookingVo counselDetail;


    //clientCounselList.jsp 로 가는
    @GetMapping("/counsel-list/{num}")
    public String counselList (@SessionAttribute(value = "lawyer", required = false) LawyerVo loginLawyer,
                               @PathVariable("num") Long lawyerNum, Model model) {
        LawyerVo lawyer = lawyerService.findLawyer(lawyerNum);
        if (loginLawyer == null || loginLawyer.getLawyerNum() != lawyer.getLawyerNum()) {
            return "redirect:/";
        }

        LawyerCounselList = paymentService.findCounselingList(lawyerNum);
        model.addAttribute("lawyerCounselList",LawyerCounselList);

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date now = new Date();
        String nowDt = format.format(now);
        model.addAttribute("nowDt",nowDt);

        System.out.println("nowDt:"+nowDt);

        //가장 최신의 상담 예약 목록
        BookingVo latestCounseling = bookingService.findLatestBooking(lawyerNum);
        System.out.println("최근 : " + latestCounseling);
        model.addAttribute("latestCounseling",latestCounseling);


        return "mypage/clientCounselList";
    }

    //clientCounselListDetail.jsp 로 가는
    @GetMapping("/{bookingNum}")
    public String counselListDetail(@PathVariable Long bookingNum, Model model) {
        counselDetail = bookingService.findCounselingDetail(bookingNum);
        model.addAttribute("counselDetail",counselDetail);
        return "mypage/clientCounselListDetail";
    }

    // 마이페이지 프로필
    @GetMapping("/info/{num}")
    public String myPage(@SessionAttribute(value = "lawyer", required = false) LawyerVo loginLawyer, @PathVariable Long num, Model model) {
        LawyerVo lawyer = lawyerService.findLawyer(num);
        if (loginLawyer == null || loginLawyer.getLawyerNum() != lawyer.getLawyerNum()) {
            return "redirect:/";
        }

        model.addAttribute("lawyer", lawyer);
        return "/mypage/lawyerMyPage";
    }

    // 개인정보 수정
    @PostMapping("/info/{num}")
    public String editInfo(@PathVariable Long num, @ModelAttribute EditInfoDto editInfoDto) {
        lawyerService.infoModify(num, editInfoDto);

        return "redirect:/lawyerpage/info/" + num;
    }

    // 프로필 수정
    @PostMapping("/profile/{num}")
    public String editProfile(@PathVariable Long num, @ModelAttribute EditProfileDto editProfileDto) {
        lawyerService.profileModify(num, editProfileDto);

        return "redirect:/lawyerpage/info/" + num;
    }

    // 비밀번호 변경
    @PostMapping("/profile/{num}/pwdModify")
    @ResponseBody
    public Boolean pwdModify(@PathVariable Long num, @RequestParam String currPwd,
                             @RequestParam String editPwd) {
        LawyerVo lawyer = lawyerService.findLawyer(num);
        if (lawyer.getLawyerPwd().equals(currPwd)) {
            lawyerService.passwordModify(editPwd, num);
            return true;
        }
        return false;
    }

}
