package com.aixuexiao.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.aixuexiao.model.EMailSender;

@Component("eMailSenderDao")
public class EMailSenderDao extends BaseDao {

    public List<EMailSender> findAllEMailSenders() {
        return this.readSqlSession
                .selectList("com.aixuexiao.dao.EMailSenderDao.selectAllEMailSenders");
    }

    public List<EMailSender> findEMailSenders(int start, int size, EMailSender eMailSender) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("start", start);
        map.put("size", size);
        map.put("classes", eMailSender);
        return this.readSqlSession.selectList(
                "com.aixuexiao.dao.EMailSenderDao.selectEMailSenders", map);
    }

    public int addEMailSender(EMailSender eMailSender) {
        return this.writerSqlSession.insert("com.aixuexiao.dao.EMailSenderDao.addEMailSender",
                eMailSender);
    }

}
