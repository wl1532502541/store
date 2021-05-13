package com.example.store.entity;

import lombok.Data;
import org.hibernate.annotations.Proxy;

import javax.persistence.*;


@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    public User(){};

    public User(String name,String password){
        this.name=name;
        this.password=password;
        this.address="";
        this.balance=0;
        this.isAdmin=false;
        this.payPwd=password;
    }

    @Column(unique = true)
    private String name;

    private String password;

    private Boolean isAdmin;//是否是管理员

    private String address;//住址

    private String payPwd;//支付密码

    private double balance;//余额

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Boolean getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(Boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPayPwd() {
        return payPwd;
    }

    public void setPayPwd(String payPwd) {
        this.payPwd = payPwd;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }
}
