package com.kh.lawservice101.lawyer.model.dto;

import lombok.Getter;
import lombok.Setter;

// 변호사 개인 정보 수정 DTO
@Getter
@Setter
public class EditInfoDto {
    private String lawyerEmail;
    private String lawyerName;
}
