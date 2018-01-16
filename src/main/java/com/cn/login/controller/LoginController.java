package com.cn.login.controller;

import com.cn.login.entity.User;
import com.cn.login.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by ddning on 2017/12/25.
 */
@Controller
@RequestMapping(value="/login")
public class LoginController {
    @Autowired
    private UserService userService;
    @RequestMapping("index")
    public String index(HttpServletRequest request, HttpServletResponse response)
    {
        return "pages/index";
    }

    @RequestMapping(value = "/json")
    public String json(HttpServletRequest request, HttpServletResponse response){

        List<User> result = userService.findAllUser();
        request.setAttribute("result",result);
        return "login";
    }

    @RequestMapping(value="loginUser")
    public String loginUser(HttpServletRequest request,HttpServletResponse response){
        String userName = request.getParameter("userName");
        String password = request.getParameter("passWord");
        return "";
    }
}
