package com.kh.lawservice101.payment.model.service;

import com.kh.lawservice101.booking.model.vo.BookingVo;
import com.kh.lawservice101.payment.model.vo.PaymentVo;

import java.util.List;

public interface PaymentService {

    void savePayment(PaymentVo paymentVo, BookingVo bookingVo);

    List<PaymentVo> findPaymentList(Long ClientNum);

    List<PaymentVo> findCounselingList(Long lawyer);

}
