/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.phone_store.repositories;

import com.mycompany.phone_store.entities.AccountEntity;
import com.mycompany.phone_store.entities.OrderEntity;
import java.util.Date;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 *
 * @author dang
 */
@Repository
public interface OrderRepository extends PagingAndSortingRepository<OrderEntity, Integer>{
    Page<OrderEntity> findByAccount_id (int id, Pageable pageable);
    List<OrderEntity> findByAccount_id (int id);
    OrderEntity findById(int id);
    
    @Query(value = "select o from OrderEntity o where o.id = ?1 and o.shipping.email = ?2")
    OrderEntity findOrderByIdAndEmail(int id, String email);

    
    
    
    @Query(value = "select o from OrderEntity o where o.orderDate = ?1 and o.account = ?2")
    Page<OrderEntity> findOrderByDate(Date orderDate,AccountEntity account_id, Pageable pageable);
    
}
