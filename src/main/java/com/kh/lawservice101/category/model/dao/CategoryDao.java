package com.kh.lawservice101.category.model.dao;

import com.kh.lawservice101.category.model.vo.CategoryVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryDao {
   CategoryVo selectCategory(Long categoryNum);
}
