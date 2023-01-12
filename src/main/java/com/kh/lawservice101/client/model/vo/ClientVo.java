package com.kh.lawservice101.client.model.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ClientVo {
    private Long clientNum;
    private String clientId;
    private String clientPwd;
    private String clientName;
    private String clientBirthyy;
    private String clientGender;
    private String clientEmail;
    private String clientPhone;
}
