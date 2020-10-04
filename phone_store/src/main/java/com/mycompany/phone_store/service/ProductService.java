/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.phone_store.service;

import com.mycompany.phone_store.entities.ProductEntity;
import com.mycompany.phone_store.enums.ActiveStatus;
import com.mycompany.phone_store.repositories.ProductRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
/**
 *
 * @author dang
 */
@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    public Page<ProductEntity> getPorducts(int page) {
        Pageable pageable = new PageRequest(page - 1, 9);
        return (Page<ProductEntity>) productRepository.findAll(pageable);
    }

    public List<ProductEntity> getPorducts() {
        return (List<ProductEntity>) productRepository.findAll();
    }

    public List<ProductEntity> getProductsActive() {
        return productRepository.findAllActiveProduct(ActiveStatus.ACTIVE);
    }

    public Page<ProductEntity> getProductsActive(int page) {
        Pageable pageable = new PageRequest(page - 1, 9);
        return productRepository.findAllActiveProductPageable(ActiveStatus.ACTIVE, pageable);
    }

    public ProductEntity getProductById(int id) {
        return productRepository.findById(id);
    }

    public Page<ProductEntity> getProductByAny(String searchText, int page) {
        Pageable pageable = new PageRequest(page - 1, 9);
        return productRepository.findProductByAny(searchText, pageable);
    }

    public Page<ProductEntity> getProductByAnyActive(String searchText, int page) {
        Pageable pageable = new PageRequest(page - 1, 9);

        return productRepository.findProductByAnyActive(searchText, ActiveStatus.ACTIVE, pageable);
    }

    public Page<ProductEntity> getProductByCategoryId(int categoryId, int page) {
        Pageable pageable = new PageRequest(page - 1, 9);
        return productRepository.findProductByCategoryID(categoryId, ActiveStatus.ACTIVE, pageable);
    }

}
