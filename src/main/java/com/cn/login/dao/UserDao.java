package com.cn.login.dao;

import com.cn.login.entity.User;

import java.util.List;

/**
 * Created by ddning on 2017/12/23.
 */
public interface UserDao {
    public void save(User u);
    public List<User> findAllUser();
    public List<User> getUserByDeptId(String deptId);
    public User findUser(String userName);
}
