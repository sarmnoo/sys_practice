package com.cn.login.service;

import com.cn.login.entity.User;

import java.util.List;

/**
 * Created by ddning on 2017/12/23.
 */
public interface UserService {
    public void saveUsers(List<User> users);
    public void saveUser(User user);
    public List<User> findAllUser();
    public List<User> getUserByDeptId(String deptId);
    public User findUser(String userName);
}
