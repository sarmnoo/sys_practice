package com.cn.common.service.Impl;

import com.cn.common.dao.CommonDao;
import com.cn.common.service.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by ddning on 01/04/2018.
 */
@Service("commonService")
@Transactional
public class CommonServiceImpl implements CommonService {
    @Autowired
    private CommonDao commonDao;
    public void add(Object obj) {
        commonDao.add(obj);
    }

    public void delete(Object obj) {
        commonDao.delete(obj);
    }

    public void delete(Class clazz, String id) {
        commonDao.delete(clazz,id);
    }

    public void update(Object obj) {
        commonDao.update(obj);
    }

    public Object get(Class clazz, String id) {
        return commonDao.get(clazz,id);
    }

    public List query(String query) {
        return commonDao.query(query);
    }

    public List query(String query, List<String> parameters) {
        return commonDao.query(query,parameters);
    }

    public List query(String query, List<String> parameters, int count) {
        return commonDao.query(query,parameters,count);
    }

    public List query(String query, List<String> parameters, int start, int count) {
        return commonDao.query(query,parameters,start,count);
    }

    public long countHQL(String totalHql, List parasList) {
        return commonDao.countHQL(totalHql,parasList);
    }
}
