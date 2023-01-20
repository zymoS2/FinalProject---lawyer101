package com.kh.lawservice101.payment.model.vo;

import com.kh.lawservice101.booking.model.vo.BookingVo;
import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class PaymentVo {
    private Long paymentNum;
    private String paymentState;
    private int price;
    private BookingVo bookingVo;
    private String impUid;
    private String merchantUid;
    private String payMethod;
}
