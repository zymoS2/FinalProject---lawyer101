package com.kh.lawservice101.category.model.dao;

import com.kh.lawservice101.category.model.vo.CategoryVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface CategoryDao {
   ArrayList<CategoryVo> selectCategory(Long lawyerNum);
}
