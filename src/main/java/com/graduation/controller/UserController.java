package com.graduation.controller;

import com.graduation.entity.User;
import com.graduation.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    IUserService userService;

    @RequestMapping("/searchUser")
    public Map<String,Object> searchUser(HttpServletRequest req, HttpServletResponse res) throws IOException {
        req.setCharacterEncoding("UTF-8");
        res.setCharacterEncoding("UTF-8");
        String id_str=req.getParameter("id");
        Map<String,Object> map= new HashMap<String,Object>();

        if(id_str.equals("")){
            map.put("isSuccessful",false);
            map.put("msg","Id不能为空！");
        }else{
            User user =userService.searchUser(Integer.parseInt(id_str));
            if(user ==null){
                map.put("isSuccessful",false);
                map.put("msg","用户不存在！");
            }else{
                map.put("isSuccessful",true);
                map.put("userInfo", user);
            }
        }

        return map;

    }


}
