package com.kh.lawservice101.lawyer.model.vo;

import com.kh.lawservice101.category.model.vo.CategoryVo;
import lombok.*;

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
	private CategoryVo categoryVo;
	private CompanyVo companyVo; //외래키는 객체로
	private CategoryVo categoryVo;

}
