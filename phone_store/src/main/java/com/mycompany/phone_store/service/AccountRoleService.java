/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.phone_store.service;


import com.mycompany.phone_store.entities.AccountRoleEntity;
import com.mycompany.phone_store.enums.AccountRole;
import com.mycompany.phone_store.repositories.AccountRoleRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author dang
 */
@Service
public class AccountRoleService {
    @Autowired 
    private AccountRoleRepository accountRoleRepository;
    
    public List<AccountRoleEntity> getAccountRoles(){
        return (List<AccountRoleEntity>) accountRoleRepository.findAll();
    }
    
    public AccountRoleEntity getAccountRolesByRole(AccountRole role){
        return accountRoleRepository.findByRoles(role);
    }
}
