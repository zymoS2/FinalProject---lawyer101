package com.kh.lawservice101.category.model.service;

import com.kh.lawservice101.category.model.vo.CategoryVo;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;

import java.util.ArrayList;

public interface CategoryService {

    //변호사 카테고리 조회
    ArrayList<CategoryVo> findLawyerCategory(Long lawyerNum);

}
