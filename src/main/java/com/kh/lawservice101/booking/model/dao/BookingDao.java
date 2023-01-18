package com.kh.lawservice101.booking.model.dao;

import com.kh.lawservice101.booking.model.vo.BookingVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookingDao {

    void insertBooking(BookingVo bookingVo);
}
