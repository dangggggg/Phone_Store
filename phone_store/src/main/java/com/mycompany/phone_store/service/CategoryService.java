/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.phone_store.service;


import com.mycompany.phone_store.entities.CategoryEntity;
import com.mycompany.phone_store.repositories.CategoryRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author dang
 */
@Service
public class CategoryService {
    @Autowired
    private CategoryRepository categoryRepository;
    
    public CategoryEntity getCategoryById(int id){
        return categoryRepository.findOne(id);
    }
    
    public List<CategoryEntity> getCategorys(){
        return (List<CategoryEntity>) categoryRepository.findAll();
    }
}
