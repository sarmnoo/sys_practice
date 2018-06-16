package com.cn.blog.controller.admin;

import com.cn.blog.entity.Blog;
import com.cn.common.service.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.List;

/**
 * Created by ddning on 2018/5/6.
 */
@Controller
@RequestMapping("admin/blog")
public class adminBlogController {
    @Autowired
    private CommonService commonService;
    @RequestMapping(value = "/index")
    public String getBlogList(HttpServletRequest request,HttpServletResponse response){

        return "Admin/blog/index";
    }

    @RequestMapping(value = "insert")
    public String insertBlog(HttpServletRequest request,HttpServletResponse response){
        return "Admin/blog/insert";
    }

    @RequestMapping(value = "addBlog")
    public void addBlog(HttpServletRequest request,HttpServletResponse response,Blog blog){
        if(blog != null){
            commonService.add(blog);
        }
    }

    @RequestMapping(value = "uploadImg",method = RequestMethod.POST)
    public void uploadImg(HttpServletRequest request,HttpServletResponse response){
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        List<MultipartFile> multipartFiles = multipartRequest.getFiles("file");
        MultipartFile mf = null;
        if (null != multipartFiles && multipartFiles.size() > 0) {
            mf = multipartFiles.get(0);

//            String realPath = StringUtils.mergeStringWithSeparator("",mf.getOriginalFilename());
//            File source = new File(realPath);
        }
        }
}
