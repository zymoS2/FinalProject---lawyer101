package com.kh.lawservice101.category.model.service;

import com.kh.lawservice101.category.model.vo.CategoryVo;

public interface CategoryService {

    //변호사 카테고리 조회
    CategoryVo findCategory(Long categoryNum);

}
