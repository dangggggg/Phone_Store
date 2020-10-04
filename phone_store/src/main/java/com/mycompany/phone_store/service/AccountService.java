/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.phone_store.service;

import com.mycompany.phone_store.entities.AccountEntity;
import com.mycompany.phone_store.repositories.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author dang
 */
@Service
public class AccountService {

    @Autowired
    private AccountRepository accountRepository;

//    public AccountEntity
//            findAccountByEmailAndPassword(String email, String password) {
//        return accountRepository.findAccountByEmailAndPassword(email, password);
//    }
    public AccountEntity findAccountByUsernameAndPassword(String username, String password){
        return accountRepository.findByUsernameAndPassword(username, password);
    }
    public AccountEntity saveAccount(AccountEntity account){
        return (AccountEntity) accountRepository.save(account);
    }
    public AccountEntity getAccountByEmail(String email){
        return accountRepository.findByEmail(email);
    }
    public AccountEntity getAccountByUsername(String username){
        return accountRepository.findByUsername(username);
    }
}
