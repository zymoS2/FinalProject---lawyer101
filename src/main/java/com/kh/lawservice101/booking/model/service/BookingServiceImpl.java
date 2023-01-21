package com.kh.lawservice101.booking.model.service;

import com.kh.lawservice101.booking.model.dao.BookingDao;
import com.kh.lawservice101.booking.model.vo.BookingVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BookingServiceImpl implements BookingService {

    private final BookingDao bookingDao;
    @Override
    public Long addBooking(BookingVo bookingVo) {

        System.out.println("bookingserviceImpl 예약 시간: " + bookingVo.getBookingDate() );
        System.out.println("bookingserviceImpl 변호사" + bookingVo.getLawyerVo().getLawyerName());
        System.out.println("bookingserviceImpl 클라이언트" +bookingVo.getClientVo().getClientName());

         bookingDao.insertBooking(bookingVo);
         Long bookingNum =bookingVo.getBookingNum();

         System.out.println("bookingIMPl 에서 bookingVo1 값들어 갔니?" + bookingVo.getBookingNum());

         return bookingNum;

    }
    //의뢰인 예약목록 페이지에서 가장 최근의 예약 리스트 찾기.
    @Override
    public BookingVo findLatestBooking(Long clientNum) {
        return bookingDao.selectLatestBooking(clientNum);
    }

    public BookingVo findLatestCounseling(Long lawyerNum) {
        return bookingDao.selectLatestCounseling(lawyerNum);
    }

    @Override
    public BookingVo findCounselingDetail(Long bookingNum) {
        return bookingDao.selectBookingDetail(bookingNum);
    }

    @Override
    public List<BookingVo> findBookingListByDate(String date) {
        return bookingDao.selectBookingByDate(date);
    }
}
