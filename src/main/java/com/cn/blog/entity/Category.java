package com.cn.blog.entity;

/**
 * Created by ddning on 2018/4/18.
 */
public class Category {
    private String id;
    private String pid;
    private String name;
    private String description;
    private Integer sort;
    private String status;
    private String icon;
    private Integer ArticleNum;
    private String pName;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }



    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Integer getArticleNum() {
        return ArticleNum;
    }

    public void setArticleNum(Integer articleNum) {
        ArticleNum = articleNum;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }
}
