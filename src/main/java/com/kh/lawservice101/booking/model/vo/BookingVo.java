package com.kh.lawservice101.booking.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class BookingVo {
    private Long bookingNum;
    private String bookingDate;
    private String counselingContent;
    private String bookingTime;
    private Long clientNum;
    private Long lawyerNum;
}
