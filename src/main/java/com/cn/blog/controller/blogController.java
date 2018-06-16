package com.cn.blog.controller;

import com.cn.blog.entity.Blog;
import com.cn.common.service.CommonService;
import com.cn.login.entity.User;
import com.cn.utils.HtmlUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.List;

/**
 * Created by ddning on 01/04/2018.
 */
@Controller
@RequestMapping("blog")
public class blogController {
    @Autowired
    private CommonService commonService;

    @RequestMapping(value = "getBlogsList",method = RequestMethod.POST)
    public void getBlogsList(HttpServletRequest request, HttpServletResponse response){
        String userId = request.getParameter("userId");
        String hql = "from Blog order by userId,inputTime desc";
//        List<String> parameter = Arrays.asList(userId);
        List<Blog> blogList = commonService.query(hql);
        HtmlUtils.responseOutWithJson(response,blogList);
    }
    @RequestMapping(value = "getBlogs")
    public String getBlogs(HttpServletRequest request, HttpServletResponse response, String userId) {
        if (userId == null) {
            User user = (User) request.getSession().getAttribute("USER_INFO");
            userId = user.getId();
        }
        String hql = "from Blog where userId=? and flag = '0' order by inputTime desc";
        String hql2 = "from Blog where userId=? and flag = '1' order by inputTime desc";
        List<String> parameter = Arrays.asList(userId);
        List<Blog> blogList = commonService.query(hql, parameter);
        List<Blog> excellentBlog = commonService.query(hql2, parameter);
        //HtmlUtils.responseOutWithJson(response,blogList);
        request.setAttribute("blogList", blogList);
        request.setAttribute("excellentBlog", excellentBlog);
        return "pages/main";
    }


    @RequestMapping(value = "resume")
    public String resume(HttpServletRequest request, HttpServletResponse response,String userId) {
        if (userId == null) {
            User user = (User) request.getSession().getAttribute("USER_INFO");
            userId = user.getId();
        }
        /**
         * get resume
         */
        return "pages/blog/aboutMe";
    }

    @RequestMapping(value = "life")
    public String life(HttpServletRequest request, HttpServletResponse response,String userId) {
        if (userId == null) {
            User user = (User) request.getSession().getAttribute("USER_INFO");
            userId = user.getId();
        }
        /**
         * get resume
         */
        return "pages/blog/life";
    }

    @RequestMapping(value = "talk")
    public String talk(HttpServletRequest request, HttpServletResponse response,String userId) {
        if (userId == null) {
            User user = (User) request.getSession().getAttribute("USER_INFO");
            userId = user.getId();
        }
        /**
         * get resume
         */
        return "pages/blog/learn";
    }

    @RequestMapping(value = "modelShare")
    public String modelShare(HttpServletRequest request, HttpServletResponse response,String userId) {
        if (userId == null) {
            User user = (User) request.getSession().getAttribute("USER_INFO");
            userId = user.getId();
        }
        /**
         * get resume
         */
        return "pages/blog/share";
    }

    @RequestMapping(value = "learn")
    public String learn(HttpServletRequest request, HttpServletResponse response,String userId) {
        if (userId == null) {
            User user = (User) request.getSession().getAttribute("USER_INFO");
            userId = user.getId();
        }
        /**
         * get resume
         */
        return "pages/blog/learn";
    }

    @RequestMapping(value = "message")
    public String message(HttpServletRequest request, HttpServletResponse response,String userId) {
        if (userId == null) {
            User user = (User) request.getSession().getAttribute("USER_INFO");
            userId = user.getId();
        }
        /**
         * get resume
         */
        return "pages/blog/message";
    }
}