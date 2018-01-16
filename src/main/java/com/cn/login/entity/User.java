package com.cn.login.entity;

import java.io.Serializable;

/**
 * Created by ddning on 2017/12/23.
 */
// @Entity
//@Table

public class User /* implements Serializable*/ {

    // @Id
    // @GeneratedValue

    private String id;
    private String userName;
    private String password;
    private String lastTime;


    public String getId() {

        return id;
    }

    public void setId(String id) {

        this.id = id;
    }

    public String getUserName() {

        return userName;
    }

    public void setUserName(String username) {

        this.userName = username;
    }

    public String getPassword() {

        return password;
    }

    public void setPassword(String password) {

        this.password = password;
    }

    public String getLastTime() {

        return lastTime;
    }

    public void setLastTime(String lastTime) {

        this.lastTime = lastTime;
    }
}
