package com.cn.blog.controller.admin;

import com.cn.blog.entity.Tags;
import com.cn.common.service.CommonService;
import com.cn.utils.HtmlUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTML;
import java.util.List;

@Controller
@RequestMapping(value = "admin/tag")
public class AdminTagController {
    @Autowired
    private CommonService commonService;

    @RequestMapping(value="index")
    public String index(HttpServletRequest request, HttpServletResponse response){
        return "Admin/tags/index";
    }

    @RequestMapping(value="getTagList",method = RequestMethod.POST)
    public void getTagList(HttpServletRequest request, HttpServletResponse response){
        String hql = "from Tags";
        List<Tags> tagsList = commonService.query(hql);
        HtmlUtils.responseOutWithJson(response,tagsList);
    }

    @RequestMapping(value="addTag",method = RequestMethod.POST)
    public String addTag(HttpServletRequest request, HttpServletResponse response,Tags tag){
        String mode = request.getParameter("mode");
        if(mode.equals("add")){
            if(tag != null){
                tag.setArticleNum(0);
                tag.setStatus("1");
                commonService.add(tag);
            }
        }else{
            String id = request.getParameter("id");
            Tags tagTemp = (Tags)commonService.get(Tags.class,id);
            if(tagTemp != null){
                tagTemp.setName(tag.getName());
                tagTemp.setDescription(tag.getDescription());
                commonService.update(tagTemp);
            }
        }
        return "redirect:/admin/tag/index";
    }

    @RequestMapping(value="getTagById",method = RequestMethod.POST)
    public void getTagById(HttpServletRequest request,HttpServletResponse response){
        String tagId = request.getParameter("tagId");
        Tags tag = (Tags)commonService.get(Tags.class,tagId);
        if(tag != null){
            HtmlUtils.responseOutWithJson(response,tag);
        }
    }

    @RequestMapping(value="deleteTag")
    public void deleteTag(HttpServletRequest request, HttpServletResponse response){
        String id = request.getParameter("id");
        Tags tag = (Tags)commonService.get(Tags.class,id);
        if(tag != null){
            commonService.delete(tag);
            HtmlUtils.writerHtml(response,"success");
        }
    }






}
