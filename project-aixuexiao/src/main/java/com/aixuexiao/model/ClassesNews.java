package com.aixuexiao.model;

import java.io.Serializable;
import java.util.Date;

import org.apache.ibatis.type.Alias;

/**
 * 班级动态
 */
@Alias(value = "ClassesNews")
public class ClassesNews implements Serializable {

    private static final long serialVersionUID = 5499170896506267908L;

    /**
     * 公告编号
     */
    private int id;

    /**
     * 班级编号
     */
    private int classid;

    /**
     * 公告内容
     */
    private String content;

    /**
     * 发布时间
     */
    private Date inserttime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getClassid() {
        return classid;
    }

    public void setClassid(int classid) {
        this.classid = classid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getInserttime() {
        return inserttime;
    }

    public void setInserttime(Date inserttime) {
        this.inserttime = inserttime;
    }

}
