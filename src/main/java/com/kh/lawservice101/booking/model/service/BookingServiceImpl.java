package com.kh.lawservice101.booking.model.service;

import com.kh.lawservice101.booking.model.dao.BookingDao;
import com.kh.lawservice101.booking.model.vo.BookingVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.IntStream;

@Service
@RequiredArgsConstructor
public class BookingServiceImpl implements BookingService {

    private final BookingDao bookingDao;
    @Override
    public Long addBooking(BookingVo bookingVo) {

        //System.out.println("bookingserviceImpl 예약 시간: " + bookingVo.getBookingDate() );
        //System.out.println("bookingserviceImpl 변호사" + bookingVo.getLawyerVo().getLawyerName());
        //System.out.println("bookingserviceImpl 클라이언트" +bookingVo.getClientVo().getClientName());

         bookingDao.insertBooking(bookingVo);
         Long bookingNum =bookingVo.getBookingNum();

         //System.out.println("bookingIMPl 에서 bookingVo1 값들어 갔니?" + bookingVo.getBookingNum());

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
    public List<String> findBookingListByDate(String selectDate) {

         //클릭한 예약 목록을 가져옴.
        List<BookingVo> bookingListByDate = bookingDao.selectBookingByDate(selectDate);

        ArrayList<String> alreadyBookingTime = new ArrayList<>(); //이미 예약 완료된 시간을 담는 변수.

        for (BookingVo bookingVo : bookingListByDate) {
            alreadyBookingTime.add(bookingVo.getBookingTime()); //bookingVo의 bookingTime만 for문을 이용해 담는다.
        }

        //System.out.println("alreadyBookingTime" + alreadyBookingTime);

        String[] bookingTime = {"9", "10", "11", "13", "14", "15", "16", "17"}; //비교군
        List<String> bookingTimeList = new ArrayList<>(Arrays.asList(bookingTime)); // remove를하기 위해서는Arrays.asList코드를 감싸서 리스트를생성해야 리스트 원소를 삭제할수있음.
        //System.out.println("bookingTimeList : " + bookingTimeList );
        bookingTimeList.removeAll(alreadyBookingTime);
        //System.out.println("차집합 : " +  bookingTimeList.toString());


        return bookingTimeList;
    }
}
