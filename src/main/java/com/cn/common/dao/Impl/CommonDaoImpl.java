package com.cn.common.dao.Impl;

import com.cn.common.dao.CommonDao;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ddning on 01/04/2018.
 */
@Repository
public class CommonDaoImpl extends HibernateDaoSupport implements CommonDao {
//    @Autowired
//    private SessionFactory sessionFactory;

    //private Logger logger = Logger.getLogger(CommonDaoImpl.class);

    @Resource(name = "sessionFactory")
    public void setSessionFactoryOverride(SessionFactory sessionFactory)
    {
        super.setSessionFactory(sessionFactory);

    }

    public void add(Object obj) {
        this.getHibernateTemplate().getSessionFactory().getCurrentSession().save(obj);
    }

    public void delete(Object obj) {
        try{
            this.getHibernateTemplate().getSessionFactory().getCurrentSession().delete(obj);
        }catch (DataAccessException e){
            logger.error(e);
        }
    }

    public void delete(Class clazz,String id){
        if(clazz == null || id == null || id.trim().equals("")){
            return;
        }
        delete(get(clazz,id));
    }

    public void update(Object obj) {
        if(obj != null){
            this.getHibernateTemplate().getSessionFactory().getCurrentSession().update(obj);
        }
    }

    public Object get(Class clazz, String id) {
        if(clazz != null && id != null && id.length() != 0){
            return this.getHibernateTemplate().getSessionFactory().getCurrentSession().get(clazz,id);
        }
        else
            return null;
    }

    public List query(String query, List<String> parameters) {

        return query(query,parameters,0);
    }

    public List query(String query) {
        return query(query,null);
    }

    public List query(String query,List<String> parameter,int count){
        Query query1 = this.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(query);
        if(parameter != null){
            for(int i = 0; i < parameter.size(); i++){
                if(parameter.get(i) != null)
                    query1.setParameter(i,parameter.get(i));
            }
        }
        if(count != 0){
            query1.setMaxResults(count);
        }
        return query1.list();
    }

    public List query(String query, List<String> parameters, int start, int count) {
        Query query1 = this.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(query);
        query1.setFirstResult(start);
        query1.setMaxResults(count);
        if(parameters != null && parameters.size() != 0){
            for(int i = 0; i < parameters.size(); i++){
                query1.setParameter(i,parameters.get(i));
            }
        }
        return query1.list();
    }

    public long countHQL(String totalHql, List parasList) {
        if(totalHql == null || totalHql.trim().equals("")){
            return -1;
        }
        Object[] parasListTemp = null;
        if(parasList == null){
            parasListTemp = new Object[]{};
        }else{
            parasListTemp = parasList.toArray();
        }
        return ((Long) getHibernateTemplate().iterate(totalHql,parasListTemp).next()).intValue();
    }

}
