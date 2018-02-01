package com.cn.login.service.Impl;

import com.cn.login.dao.DeptDao;
import com.cn.login.entity.Department;
import com.cn.login.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by ddning on 2018/1/20.
 */
@Service("deptService")
@Transactional
public class DeptServiceImpl implements DeptService {
    @Autowired
    private DeptDao deptDao;
    public List<Department> query(String sql) {
        return deptDao.query(sql);
    }
}
