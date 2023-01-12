package com.kh.lawservice101.review.model.vo;

import com.kh.lawservice101.client.model.vo.ClientVo;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import com.kh.lawservice101.payment.model.vo.PaymentVo;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ReviewVo {
    private Long reviewNum;
    private String reviewTitle;
    private String reviewContent;
    private String reviewDate;
    private int reviewRating;
    private LawyerVo lawyerVo;
    private PaymentVo paymentVo;
    private ClientVo clientVo;
}
