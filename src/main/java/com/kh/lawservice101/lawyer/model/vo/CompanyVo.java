package com.kh.lawservice101.lawyer.model.vo;


import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CompanyVo {
    Long companyNum;
    String companyName;
    String companyAddress;
    String companyPhone;
}
