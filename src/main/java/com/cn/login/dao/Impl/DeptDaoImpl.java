package com.cn.login.dao.Impl;

import com.cn.login.dao.DeptDao;
import com.cn.login.entity.Department;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ddning on 2018/1/20.
 */
@Repository
public class DeptDaoImpl implements DeptDao {
    @Autowired
    private SessionFactory sessionFactory;


    public List<Department> query(String sql) {
        Session sq = sessionFactory.openSession();
        sq.beginTransaction();
        Query q = sq.createQuery(sql);
        List criteria = q.list();
        sq.getTransaction().commit();
        sq.close();
        return criteria;
    }
}
