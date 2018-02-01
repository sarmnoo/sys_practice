package com.cn.login.dao.Impl;

import com.cn.login.dao.UserDao;
import com.cn.login.entity.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;
/**
 * Created by ddning on 2017/12/23.
 */
@Repository("userDao")
public class UserDaoImpl extends HibernateDaoSupport implements UserDao{
//    @Autowired
//    private SessionFactory sessionFactory;
    @Resource
    public void setSesstionFactory(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }
    public void save(User u) {
        //return (Integer) sessionFactory.getCurrentSession().save(u);
        this.getHibernateTemplate().getSessionFactory().getCurrentSession().save(u);
    }

    public List<User> findAllUser(){
        //Session sq = sessionFactory.openSession();
        //sq.beginTransaction();
        Query q = this.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery("from User");
        //Query q = sq.createQuery("from User");
        List criteria = q.list();
        //sq.getTransaction().commit();
        //sq.close();
        return criteria;
    }

    public List<User> getUserByDeptId(String deptId) {
        //Session sq = sessionFactory.openSession();
        //sq.beginTransaction();
        Query q = this.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery("from User " +
                "where deptId='"+deptId+"'");
        List result = q.list();
//        sq.getTransaction().commit();
//        sq.close();
        return result;

    }

    public User findUser(String userName) {
        Query q = this.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(
                "from User where userName ='"+userName+"'");
        List result = q.list();
        if(result.isEmpty())
            return null;
        else
            return (User)result.get(0);
    }
}
