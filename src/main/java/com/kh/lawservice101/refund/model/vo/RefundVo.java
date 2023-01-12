package com.kh.lawservice101.refund.model.vo;

import com.kh.lawservice101.payment.model.vo.PaymentVo;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class RefundVo {
    private Long refundNum;
    private char cancelState;
    private String cancelDate;
    private PaymentVo paymentVo;
}
