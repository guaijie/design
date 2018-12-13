package com.graduation.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class User implements Serializable {

    private long id;
    private String username;
    private String password;
    private String name;
    private String birthDay;
    private String phone;
    private String address;
    private String sessionToken;
}
