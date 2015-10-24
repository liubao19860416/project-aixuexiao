package com.aixuexiao.model;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

/**
 * 学生实体
 */
@Alias(value = "Student")
public class Student implements Serializable {

    private static final long serialVersionUID = 2008584433057353890L;

    /**
     * 学生编号
     */
    private int id;

    /**
     * 班级编号
     */
    private int classid;

    /**
     * 学生姓名
     */
    private String name;

    /**
     * 备注
     */
    private String remark;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

}
