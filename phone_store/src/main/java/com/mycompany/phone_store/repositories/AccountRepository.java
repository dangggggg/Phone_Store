/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.phone_store.repositories;

import com.mycompany.phone_store.entities.AccountEntity;
import java.io.Serializable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author dang
 */
@Repository
public interface AccountRepository extends
        CrudRepository<AccountEntity, Integer> {


    AccountEntity findByUsernameAndPassword(String username, String password);
    AccountEntity findByEmail(String email);
    AccountEntity findByUsername(String username);
}
