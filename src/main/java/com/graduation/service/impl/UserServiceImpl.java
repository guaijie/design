package com.graduation.service.impl;

import com.graduation.dao.IUserDao;
import com.graduation.entity.User;
import com.graduation.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserDao userdao;

    public User searchUser(long id){

        User user= userdao.selectUserById(id);

        return user;
    }

}
