/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.phone_store.service;


import com.mycompany.phone_store.entities.OrderDetailEntity;
import com.mycompany.phone_store.repositories.OrderDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author dang
 */
@Service
public class OrderDetailService {
    @Autowired
    private OrderDetailRepository orderDetailRepository;
    
    public OrderDetailEntity save(OrderDetailEntity orderDetail){
        return (OrderDetailEntity) orderDetailRepository.save(orderDetail);
    }
}
