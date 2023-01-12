package com.kh.lawservice101.category.model.vo;

import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CategoryVo {
    private Long categoryNum;
    private String categoryName;
    private LawyerVo lawyerVo;
}
