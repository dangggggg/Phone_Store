/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.phone_store.service;

import com.mycompany.phone_store.entities.PromotionEntity;
import com.mycompany.phone_store.repositories.PromotionRepository;
import java.io.Serializable;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author dang
 */
@Service
public class PromotionService implements Serializable{
    @Autowired
    private PromotionRepository promotionRepository;
    
    
    
    public List<PromotionEntity> getPromotionsByProductId(int id){
    
        return promotionRepository.findPromotionByProductId(id);
    }
    
    public PromotionEntity getPromotionByPromotionNameAndProductId(String promotionName, int productId) {
        return promotionRepository.findPromotionByPromotionCodeAndProductId(promotionName, productId);
    }
    public PromotionEntity getPromotionByOrderDetailId(int orderDetailId) {
        return promotionRepository.findPromotionByOrderDetailId(orderDetailId);
    }
}
