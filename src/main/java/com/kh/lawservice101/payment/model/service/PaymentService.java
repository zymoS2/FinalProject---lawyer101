package com.kh.lawservice101.payment.model.service;

import com.kh.lawservice101.booking.model.vo.BookingVo;
import com.kh.lawservice101.payment.model.vo.PaymentVo;

import java.io.IOException;
import java.util.List;

public interface PaymentService {

    void savePayment(PaymentVo paymentVo, BookingVo bookingVo);

    List<PaymentVo> findPaymentList(Long clientNum);

    List<PaymentVo> findCounselingList(Long lawyerNum);

    // 결제 단건 조회
    PaymentVo findPayment(Long paymentNum);
}
