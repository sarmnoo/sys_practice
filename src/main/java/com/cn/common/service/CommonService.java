package com.cn.common.service;

import java.util.List;

/**
 * Created by ddning on 01/04/2018.
 */
public interface CommonService {
    public void add(Object obj);
    public void delete(Object obj);
    public void delete(Class clazz,String id);
    public void update(Object obj);
    public Object get(Class clazz,String id);
    public List query(String query);
    public List query(String query, List<String> parameters);
    public List query(String query,List<String> parameters,int count);
    public List query(String query,List<String> parameters,int start,int count);
    public long countHQL(String totalHql,List parasList);
}
