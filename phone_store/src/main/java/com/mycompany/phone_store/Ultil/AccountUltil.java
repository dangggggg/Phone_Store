/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.phone_store.Ultil;


import com.mycompany.phone_store.entities.AccountEntity;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 *
 * @author dang
 */
public class AccountUltil {
    public static AccountEntity getAccount(){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof AccountEntity) {
            AccountEntity accountEntity = (AccountEntity) principal;
            return accountEntity;
        }   
        return null;
    }
}
