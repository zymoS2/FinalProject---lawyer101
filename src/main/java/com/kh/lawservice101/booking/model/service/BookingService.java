package com.kh.lawservice101.booking.model.service;

import com.kh.lawservice101.booking.model.vo.BookingVo;

import java.util.List;


public interface BookingService {

    Long addBooking(BookingVo bookingVo);

    //의뢰인 예약목록 페이지에서 가장 최근의 예약 리스트 찾기.
    BookingVo findLatestBooking(Long clientNum);

    //변호사 상담목록 페이지에서 가장 최근 예약 리스트 찾기.
    BookingVo findLatestCounseling(Long lawyerNum);

    //
    BookingVo findCounselingDetail(Long bookingNum);

    List<String> findBookingListByDate(String selectDate);


}
