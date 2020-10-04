/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.phone_store.repositories;


import com.mycompany.phone_store.entities.CommentEntity;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author dang
 */
@Repository
public interface CommentRepository extends CrudRepository<CommentEntity, Integer>{
    List<CommentEntity> findByProduct_id(int id);
}
