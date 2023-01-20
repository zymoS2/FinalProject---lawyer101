package com.kh.lawservice101.lawyer.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

// 변호사 프로필 수정 DTO
@Getter
@Setter
@NoArgsConstructor
public class EditProfileDto {
    private MultipartFile profileImage;
    private String lawyerIntroMsg;
    private Long categoryNum;
    private MultipartFile mainImage;
}
