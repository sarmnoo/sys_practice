package com.cn.login.service.Impl;

import com.cn.login.dao.UserDao;
import com.cn.login.entity.User;
import com.cn.login.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service("userService")
@Transactional
/**
 * Created by ddning on 2017/12/23.
 */
public class UserServiceImpl implements UserService{

//    public List<String> getAllUserName() {
//        List<String> userName = new ArrayList<String>();
//        userName.add("ndd");
//        userName.add("qiuqiu");
//        userName.add("kkk");
//        return userName;
//    }
    @Autowired
    private UserDao userDao;

    public void saveUsers(List<User> users) {
        for(User user:users){
            userDao.save(user);
        }
    }

    public void saveUser(User user) {
        userDao.save(user);
    }

    public List<User> findAllUser() {
        return userDao.findAllUser();
    }

    public List<User> getUserByDeptId(String deptId) {
        return userDao.getUserByDeptId(deptId);
    }

    public User findUser(String userName){
        return userDao.findUser(userName);
    }
}
