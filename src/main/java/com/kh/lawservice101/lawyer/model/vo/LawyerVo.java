package com.kh.lawservice101.lawyer.model.vo;

import com.kh.lawservice101.category.model.vo.CategoryVo;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class LawyerVo {
	private Long lawyerNum;
	private String lawyerId ;
	private String lawyerPwd ;
	private String lawyerName;
	private String lawyerBirthyy;
	private String lawyerGender;
	private String lawyerPhone;
	private String lawyerImg;
	private String lawyerEmail;
	private String lawyerLicenseNum;
	private String lawyerIntroMsg;
	private CompanyVo companyVo; //외래키는 객체로
	private CategoryVo categoryVo;
	private String LawyerMainImg;
}
