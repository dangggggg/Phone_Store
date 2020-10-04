/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.phone_store.service;

import com.mycompany.phone_store.entities.ColorEntity;
import com.mycompany.phone_store.repositories.ColorRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author dang
 */
@Service
public class ColorService {
    @Autowired
    private ColorRepository colorRepository;
    
    public List<ColorEntity> getColorByProductId(int id){
        return colorRepository.findByProduct_Id(id);
    }
    public ColorEntity getColorById(int id){
        return colorRepository.findOne(id);
    }
}
