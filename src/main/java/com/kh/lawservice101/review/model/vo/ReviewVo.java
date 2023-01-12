package com.kh.lawservice101.review.model.vo;

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
    private Long lawyerNum;
    private Long orderNum;
    private Long clientNum;
}
