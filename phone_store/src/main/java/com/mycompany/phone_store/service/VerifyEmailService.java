/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.phone_store.service;


import com.mycompany.phone_store.entities.VerifyEmailEntity;
import com.mycompany.phone_store.repositories.VerifyEmailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author dang
 */
@Service
public class VerifyEmailService {
    @Autowired
    private VerifyEmailRepository verifyEmailRepository;
    
    public VerifyEmailEntity save(VerifyEmailEntity v){
        return (VerifyEmailEntity) verifyEmailRepository.save(v);
    }
    
    public void delete(VerifyEmailEntity v){
        verifyEmailRepository.delete(v);
    }
    
    public VerifyEmailEntity getVerify(String email, String code){
        return verifyEmailRepository.findByEmailLikeAndCodeLike(email, code);
    }
}
