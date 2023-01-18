package com.kh.lawservice101.payment.model.service;

import com.kh.lawservice101.booking.model.service.BookingService;
import com.kh.lawservice101.booking.model.vo.BookingVo;
import com.kh.lawservice101.payment.model.dao.PaymentDao;
import com.kh.lawservice101.payment.model.vo.PaymentVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PaymentServiceImpl implements PaymentService{

    private final PaymentDao paymentDao;
    private final BookingService bookingService;

    @Override
    public void savePayment(PaymentVo paymentVo, BookingVo bookingVo) {

        //예약 정보 입력
        Long bookingNum = bookingService.addBooking(bookingVo);
        bookingVo.setBookingNum(bookingNum);

        paymentVo.setBookingVo(bookingVo);

        //결제 정보 입력
        paymentDao.insertOrder(paymentVo);

    }

    @Override
    public List<PaymentVo> findPaymentList(Long clientNum) {

        return paymentDao.selectPayment(clientNum);
    }

    @Override
    public List<PaymentVo> findCounselingList(Long lawyerNum) {
        return paymentDao.selectCounselingList(lawyerNum);
    }
}
