package com.kh.lawservice101.payment.model.service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.lawservice101.booking.model.service.BookingService;
import com.kh.lawservice101.booking.model.vo.BookingVo;
import com.kh.lawservice101.payment.model.dao.PaymentDao;
import com.kh.lawservice101.payment.model.vo.PaymentVo;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.net.ssl.HttpsURLConnection;
import java.io.*;
import java.net.URL;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class PaymentServiceImpl implements PaymentService{

    private final PaymentDao paymentDao;
    private final BookingService bookingService;

    @Value("${imp_key}")
    private String impKey;
    @Value("${imp_secret}")
    private String impSecret;



    @Override
    public void savePayment(PaymentVo paymentVo, BookingVo bookingVo) {

        //예약 정보 입력
        Long bookingNum = bookingService.addBooking(bookingVo);
        bookingVo.setBookingNum(bookingNum);

        paymentVo.setBookingVo(bookingVo); //paymentVo에 외래키 bookingVo 내용 추가하기

        //결제 정보 입력
        paymentDao.insertOrder(paymentVo);

    }

    //의뢰인 예약 목록조회
    @Override
    public List<PaymentVo> findPaymentList(Long clientNum) {
        return paymentDao.selectPayment(clientNum);
    }

    //변호사 예약 목록조회
    @Override
    public List<PaymentVo> findCounselingList(Long lawyerNum) {
        return paymentDao.selectCounselingList(lawyerNum);
    }

    // 결제 단건 조회
    @Override
    public PaymentVo findPayment(Long paymentNum) {
        return paymentDao.selectPaymentByPaymentNum(paymentNum);
    }




}
