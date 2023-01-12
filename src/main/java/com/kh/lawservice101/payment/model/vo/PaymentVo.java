package com.kh.lawservice101.payment.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PaymentVo {
    private Long paymentNum;
    private char paymentState;
    private int price;
    private Long bookingNum;
}
