package com.kh.lawservice101.booking.model.dao;

import com.kh.lawservice101.booking.model.vo.BookingVo;
import com.kh.lawservice101.payment.model.vo.PaymentVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookingDao {

    void insertBooking(BookingVo bookingVo);

    BookingVo selectLatestBooking(Long clientNum);

    BookingVo selectLatestCounseling(Long lawyerNum);

    BookingVo selectBookingDetail(Long bookingNum);

}
