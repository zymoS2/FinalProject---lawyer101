package com.kh.lawservice101.refund.model.vo;

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
    private Long paymentNum;
}
