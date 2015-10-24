package com.aixuexiao.model;

import java.io.Serializable;
import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

/**
 * 邮件发送人
 */
@Alias(value = "EMailSender")
public class EMailSender implements Serializable {

    private static final long serialVersionUID = 2008584433057353890L;

    private int id;
    private String userName;
    private String telephone;
    private String message;
    private Timestamp inserttime;
    
    public Timestamp getInserttime() {
        return inserttime;
    }

    public void setInserttime(Timestamp inserttime) {
        this.inserttime = inserttime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return "EMailSender [id=" + id + ", userName=" + userName
                + ", telephone=" + telephone + ", message=" + message
                + ", inserttime=" + inserttime + "]";
    }
    
    

}
