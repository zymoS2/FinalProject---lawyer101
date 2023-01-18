package com.kh.lawservice101.lawyer.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class LawyerSearchCon {
    private int pageNum;
    private int pageSize;
    private String keyword;
}
