package com.cn.login.dao.Impl;

import com.cn.login.dao.UserDao;
import com.cn.login.entity.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
/**
 * Created by ddning on 2017/12/23.
 */
@Repository
public class UserDaoImpl implements UserDao{
    @Autowired
    private SessionFactory sessionFactory;
    public int save(User u) {
        return (Integer) sessionFactory.getCurrentSession().save(u);
    }

    public List<User> findAllUser(){
        Session sq = sessionFactory.openSession();
        sq.beginTransaction();
        Query q = sq.createQuery("from User");
        List criteria = q.list();
        sq.getTransaction().commit();
        sq.close();
        return criteria;
    }
}
