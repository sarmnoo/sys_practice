package com.cn.login.controller;

import com.cn.blog.entity.Blog;
import com.cn.common.service.CommonService;
import com.cn.utils.HtmlUtils;
import com.cn.utils.UUIDGenerator;
import com.cn.utils.VerifyCodeUtils;
import com.cn.login.entity.Department;
import com.cn.login.entity.User;
import com.cn.login.service.DeptService;
import com.cn.login.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

/**
 * Created by ddning on 2017/12/25.
 */
@Controller
@RequestMapping(value="/login")
public class LoginController {
    @Autowired
    private UserService userService;
    @Autowired
    private DeptService deptService;
    @Autowired
    private CommonService commonService;
    private UUIDGenerator uuidGenerator = new UUIDGenerator();

    @RequestMapping("index")
    public String index(HttpServletRequest request, HttpServletResponse response)
    {
        return "pages/index1";
    }

    @RequestMapping(value = "/json")
    public String json(HttpServletRequest request, HttpServletResponse response){

        List<User> result = userService.findAllUser();
        request.setAttribute("result",result);
        return "login";
    }

    @RequestMapping(value="checkUser",method = RequestMethod.POST)
    public String checkUser(HttpServletRequest request,HttpServletResponse response,User user,String verifyCode){
        String userName = user.getUserName();
        User findUser = userService.findUser(user.getUserName());
        HttpSession session = request.getSession();
        String sessionVerifyCode = (String)session.getAttribute("verifyCode");

        String loginError = "";
        if(findUser == null){
            loginError = "该用户不存在,请注册后登陆！";
            request.setAttribute("loginError",loginError);
            return "login";
        }
        else if(!findUser.getPassword().equals(user.getPassword())){
            loginError = "密码错误！";
            request.setAttribute("loginError",loginError);
            return "login";
        }
        if(!verifyCode.toLowerCase().equals(sessionVerifyCode.toLowerCase())){
            loginError = "验证码错误！";
            request.setAttribute("loginError",loginError);
            return "login";
        }
        request.getSession().setAttribute("USER_INFO",findUser);


        String userId = findUser.getId();
        String hql = "from Blog where userId=? and flag = '0' order by inputTime desc";
        String hql2 = "from Blog where userId=? and flag = '1' order by inputTime desc";
        List<String> parameter = Arrays.asList(userId);
        List<Blog> blogList = commonService.query(hql,parameter);
        List<Blog> excellentBlog = commonService.query(hql2,parameter);
        //HtmlUtils.responseOutWithJson(response,blogList);
        request.setAttribute("blogList",blogList);
        request.setAttribute("excellentBlog",excellentBlog);
        return "Admin/blog/index";
    }

    @RequestMapping(value="loginUser")
    public String loginUser(HttpServletRequest request,HttpServletResponse response,User user){
        //String userName = request.getParameter("userName");
        //String password = request.getParameter("password");
        String code = (String)request.getSession().getAttribute("verifyCode");

        User findUser = userService.findUser(user.getUserName());
        if(findUser == null){
            request.setAttribute("message","wrong");
            return "login";
        }
        return "/pages/main";
    }

    @RequestMapping(value="goRegister")
    public String goRegister(HttpServletRequest request,HttpServletResponse response){
        String userName = request.getParameter("userName");
        request.setAttribute("userName",userName);
        return "pages/register";
    }

    @RequestMapping(value="registerUser")
    public String registerUser(HttpServletRequest request,HttpServletResponse response,User user){
        if(user != null){
            User findUser = userService.findUser(user.getUserName());
            if(findUser != null){
                request.setAttribute("registerError","用户名已存在！");
                return "pages/register";
            }else{
                Serializable id = uuidGenerator.generate();
                user.setId(id.toString());
                //userService.saveUser(user);
                commonService.add(user);
            }
            request.setAttribute("userName",user.getUserName());
            request.setAttribute("loginError","注册成功，请登录！");
            return "login";
        }
        else{
            return "pages/register";
        }

    }

    @RequestMapping(value="getDept")
    public void getDept(HttpServletRequest request,HttpServletResponse response){
        try{
            List<Department> deptList = deptService.query("from Department");
            HtmlUtils.responseOutWithJson(response,deptList);
            //List<User> userList = userService.findAllUser();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    @RequestMapping(value="getDeptUser",method = RequestMethod.POST)
    public void getDeptUser(HttpServletRequest request,HttpServletResponse response){
        try{
            String deptId = request.getParameter("deptId");
            List<User> userList = userService.getUserByDeptId(deptId);
            HtmlUtils.responseOutWithJson(response,userList);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

//    protected void responseOutWithJson(HttpServletResponse response,
//                                       Object responseObject) {
//        //将实体对象转换为JSON Object转换
//        JSONArray responseJSONObject = JSONArray.fromObject(responseObject);
//        response.setCharacterEncoding("UTF-8");
//        response.setContentType("application/json; charset=utf-8");
//        PrintWriter out = null;
//        try {
//            out = response.getWriter();
//            out.append(responseJSONObject.toString());
////            logger.debug("返回是\n");
////            logger.debug(responseJSONObject.toString());
//        } catch (IOException e) {
//            e.printStackTrace();
//        } finally {
//            if (out != null) {
//                out.close();
//            }
//        }
//    }

    @RequestMapping(value = "getSelectUser",method = RequestMethod.POST)
    public void getSelectUser(HttpServletRequest request,HttpServletResponse response,
                              String[] deptList,String[] userList){
        System.out.print(deptList.length);
        HtmlUtils.writerHtml(response,"success");
    }

    @RequestMapping(value="genVerify")
    public void genVerify(HttpServletRequest request,HttpServletResponse response) throws IOException{
        response.setHeader("Pragma","No-cache");
        response.setHeader("Cache-Control","no-cache");
        response.setDateHeader("Expires",0);
        response.setContentType("image/jpeg");

        String verifyCode = VerifyCodeUtils.genVerifyCodes(4);
        HttpSession session = request.getSession();
        session.removeAttribute("verifyCode");
        session.setAttribute("verifyCode",verifyCode);
//        request.setAttribute("verifyCode",verifyCode);
        int w = 100,h = 30;
        VerifyCodeUtils.outputImage(w,h,response.getOutputStream(),verifyCode);
        //return "login";
    }
}
