package com.aixuexiao.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.aixuexiao.dao.EMailSenderDao;
import com.aixuexiao.model.EMailSender;

@Service("eMailSenderService")
public class EMailSenderService {

    @Resource(name = "eMailSenderDao")
    private EMailSenderDao eMailSenderDao;

    public List<EMailSender> listEMailSenders(int start, int size, EMailSender eMailSender) {
        return eMailSenderDao.findEMailSenders(start, size, eMailSender);
    }

    public List<EMailSender> listAllEMailSenders() {
        return eMailSenderDao.findAllEMailSenders();
    }
    
    public int saveEMailSender(EMailSender eMailSender) {
        return eMailSenderDao.addEMailSender(eMailSender);
    }
}
