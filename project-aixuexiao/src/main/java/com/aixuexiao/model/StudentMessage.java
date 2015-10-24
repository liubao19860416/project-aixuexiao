package com.aixuexiao.model;

import java.io.Serializable;
import java.util.Date;

import org.apache.ibatis.type.Alias;

/**
 * 给学生的留言
 */
@Alias(value = "StudentMessage")
public class StudentMessage implements Serializable {

    private static final long serialVersionUID = 8663175783443480434L;

    /**
     * 留言编号
     */
    private int id;

    /**
     * 学生编号
     */
    private int studentid;

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

    public int getStudentid() {
        return studentid;
    }

    public void setStudentid(int studentid) {
        this.studentid = studentid;
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
