/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.phone_store.repositories;


import com.mycompany.phone_store.entities.CategoryEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author dang
 */
@Repository
public interface CategoryRepository extends CrudRepository<CategoryEntity, Integer>{
    //CategoryEntity findById(int id);
}
