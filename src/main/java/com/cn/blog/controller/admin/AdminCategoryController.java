package com.cn.blog.controller.admin;

import com.cn.blog.entity.Category;
import com.cn.common.service.CommonService;
import com.cn.utils.HtmlUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * Created by ddning on 2018/5/21.
 */
@Controller
@RequestMapping(value="admin/category")
public class AdminCategoryController {
    @Autowired
    private CommonService commonService;

    @RequestMapping(value = "/index")
    public String toCategoryIndex(HttpServletRequest request, HttpServletResponse response){

        return "Admin/category/index";
    }

    @RequestMapping(value = "getCategoryList")
    public void getCategoryList(HttpServletRequest request,HttpServletResponse response){
        String hql = "from Category";
        List<Category> categoryList = commonService.query(hql);
        List<Category> groupCategoryList = new ArrayList<Category>();
        Map<String,List<Category>> map = new LinkedHashMap<String,List<Category>>();
        for(Category category:categoryList){
            if(category.getPid().equals("0")){
                String id = category.getId();
                map.put(id,new ArrayList<Category>());
                List<Category> temp = map.get(id);
                temp.add(category);
            }else{
                String id = category.getPid();
                List<Category> temp = map.get(id);
                temp.add(category);
            }
        }

        for(Map.Entry<String,List<Category>> entry:map.entrySet()){
            groupCategoryList.addAll(entry.getValue());
        }

        HtmlUtils.responseOutWithJson(response,groupCategoryList);
    }

    @RequestMapping(value = "getSuperCategoryList")
    public void getSuperCategoryList(HttpServletRequest request,HttpServletResponse response){
        String hql = "from Category where pid = 0";
        List<Category> categoryList = commonService.query(hql);
        HtmlUtils.responseOutWithJson(response,categoryList);
    }

    @RequestMapping(value = "getChildCategoryList")
    public void getChildCategoryList(HttpServletRequest request,HttpServletResponse response){
        String hql = "from Category where pid = ?";
        String pid = request.getParameter("pid");
        List<String> parameter = Arrays.asList(new String[]{pid});
        List<Category> categoryChildList = commonService.query(hql,parameter);
        HtmlUtils.responseOutWithJson(response,categoryChildList);
    }


    @RequestMapping(value = "addCategory")
    public String addCategory(HttpServletRequest request, HttpServletResponse response,Category category){
        String mode = request.getParameter("mode");
        if(mode.equals("add")){
            String maxId = (String)commonService.query("select max(id) from Category").get(0);
            int integerId = Integer.parseInt(maxId)+1;
            category.setId(Integer.toString(integerId));


            Integer maxSort = (Integer)commonService.query("select max(sort) from Category").get(0);
            int sort = maxSort+1;
            category.setSort(sort);
            category.setStatus("1");
            commonService.add(category);
        }else{
            String id = request.getParameter("id");
            Category categoryTemp = (Category)commonService.get(Category.class,id);
            if(categoryTemp != null){
                categoryTemp.setName(category.getName());
                categoryTemp.setDescription(category.getDescription());
                categoryTemp.setPid(category.getPid());
                categoryTemp.setIcon(category.getIcon());
                commonService.update(categoryTemp);
            }
        }

        return "redirect:/admin/category/index";
    }

    @RequestMapping(value = "deleteCategory")
    public void deleteCategory(HttpServletRequest request, HttpServletResponse response){
        String categoryId = request.getParameter("id");
        String hql = "from Category where pid = ?";
        List<String> parameter = Arrays.asList(categoryId);
        List<Category> subCategory = commonService.query(hql,parameter);
        if(subCategory != null && subCategory.size() != 0){
            HtmlUtils.writerHtml(response,"error");
            return;
        }
        Category category = (Category) commonService.get(Category.class,categoryId);
        if(category != null){
            commonService.delete(category);
            HtmlUtils.writerHtml(response,"success");
        }
    }

    @RequestMapping(value = "editCategory")
    public void editCategory(HttpServletRequest request, HttpServletResponse response){
        String categoryId = request.getParameter("id");
        Category category = (Category) commonService.get(Category.class,categoryId);
        if(category != null){
            HtmlUtils.responseOutWithJson(response,category);
        }
    }
}
