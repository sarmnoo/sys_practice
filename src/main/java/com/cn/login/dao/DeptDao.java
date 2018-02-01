package com.cn.login.dao;

import com.cn.login.entity.Department;

import java.util.List;

/**
 * Created by ddning on 2018/1/20.
 */
public interface DeptDao {
    public List<Department> query(String sql);
}
