package com.cn.utils;

import net.sf.json.JSONArray;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by ddning on 2018/1/30.
 */
public class HtmlUtils {
    public static void responseOutWithJson(HttpServletResponse response,
                                       Object responseObject) {
        //将实体对象转换为JSON Object转换
        JSONArray responseJSONObject = JSONArray.fromObject(responseObject);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=utf-8");
        writer(response,responseJSONObject.toString());
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
    }

    public static void writerHtml(HttpServletResponse response,String htmlStr){
        writer(response,htmlStr);
    }

    public static void writer(HttpServletResponse response,String str){
        response.setHeader("Pragma","No-cache");
        response.setHeader("Cache-Control","no-cache");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = null;
        try{
            out = response.getWriter();
            out.print(str);
            out.flush();
        }catch (IOException e){
            e.printStackTrace();
        }finally {
            if(out != null){
                out.close();
            }
        }
    }
}
