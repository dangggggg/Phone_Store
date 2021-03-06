/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.phone_store.entities;

import com.mycompany.phone_store.Ultil.StringUltil;
import com.mycompany.phone_store.enums.AccountRole;
import com.mycompany.phone_store.enums.ActiveStatus;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.Hibernate;
import org.springframework.format.annotation.DateTimeFormat;
/**
 *
 * @author dang
 */
@Entity
@Table(name = "account")
public class AccountEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "user_name", nullable = false,unique = true)
    private String username;
    
    @Column(name = "password", nullable = false)
    private String password;
    
    @ManyToMany(cascade = {
        CascadeType.MERGE}, fetch = FetchType.EAGER)
    @JoinTable(name = "acc_role_relationship",
            joinColumns = @JoinColumn(name = "acc_id",
                    referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(
                    name = "acc_role_id",
                    referencedColumnName = "id"))
    private List<AccountRoleEntity> accountRoles;

    @Column(unique = true,nullable = false)
    private String email;
    @DateTimeFormat(pattern = "yyyy-mm-dd")
    @Temporal(TemporalType.DATE)
    private Date birthday;
    @Column(name = "full_name")
    private String fullName;
    private String address;
    private String phone;
    @Enumerated(EnumType.STRING)
    private ActiveStatus status = ActiveStatus.INACTIVE;
    @OneToMany(mappedBy = "account", fetch = FetchType.LAZY)
   private List<FavoriteEntity> favorites;
   
   @OneToMany(mappedBy = "account", fetch = FetchType.LAZY)
   private List<CommentEntity> comments;
   
   @OneToMany(mappedBy = "account", fetch = FetchType.LAZY)
   private List<OrderEntity> orders;

    public AccountEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public ActiveStatus getStatus() {
        return status;
    }

    public void setStatus(ActiveStatus status) {
        this.status = status;
    }

    public List<FavoriteEntity> getFavorites() {
        return favorites;
    }

    public void setFavorites(List<FavoriteEntity> favorites) {
        this.favorites = favorites;
    }

    public List<CommentEntity> getComments() {
        return comments;
    }

    public void setComments(List<CommentEntity> comments) {
        this.comments = comments;
    }

    public List<OrderEntity> getOrders() {
        
            return orders;
        
        
        
    }

    public void setOrders(List<OrderEntity> orders) {
        this.orders = orders;
    }

    public List<AccountRoleEntity> getAccountRoles() {
        return accountRoles;
    }

    public void setAccountRoles(List<AccountRoleEntity> accountRoles) {
        this.accountRoles = accountRoles;
    }
    public String getRoleString(){
        for(AccountRoleEntity role : accountRoles){
            if(role.getRoles() == AccountRole.ROLE_ADMIN){
                return "ROLE_ADMIN";
            }
        }
        for(AccountRoleEntity role : accountRoles){
            if(role.getRoles()== AccountRole.ROLE_SELLER){
                return "ROLE_SELLER";
            }
        }
        return "ROLE_USER";
    }
    public String getBirthdayFormat(){
        if(birthday==null){
            return "";
        }
        return StringUltil.fromDateToUS(birthday);
    }
}
