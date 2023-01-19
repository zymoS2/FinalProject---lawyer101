package com.kh.lawservice101.booking.model.vo;

import com.kh.lawservice101.client.model.vo.ClientVo;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class BookingVo {
    private Long bookingNum;
    private String bookingDate;
    private String counselingContent;
    private String bookingTime;
    private ClientVo clientVo;
    private LawyerVo lawyerVo;
}
