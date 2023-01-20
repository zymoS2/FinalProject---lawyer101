package com.kh.lawservice101.category.model.service;

import com.kh.lawservice101.category.model.dao.CategoryDao;
import com.kh.lawservice101.category.model.vo.CategoryVo;
import com.kh.lawservice101.lawyer.model.dao.LawyerDao;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService{
    private final CategoryDao categoryDao;

    @Override
    public CategoryVo findCategory(Long categoryNum) {
        return categoryDao.selectCategory(categoryNum);
    }
}
