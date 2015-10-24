package com.aixuexiao.web.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aixuexiao.email.VelocityTemplateMailMailSender;
import com.aixuexiao.model.EMailSender;
import com.aixuexiao.service.EMailSenderService;
import com.alibaba.fastjson.JSON;

/**
 * 邮件发送服务
 * http://localhost:8080/emailIndex
 */
@Controller
public class EMailSendeController {
    

    @Resource(name = "eMailSenderService")
    private EMailSenderService eMailSenderService;

    @RequestMapping(value = "/emailIndex")
    public ModelAndView emailIndex(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        
        String host = request.getHeader("BAE_ENV_ADDR_SQL_IP");
        String port = request.getHeader("BAE_ENV_ADDR_SQL_PORT");
        String username = request.getHeader("BAE_ENV_AK");
        String password = request.getHeader("BAE_ENV_SK");
        
        System.out.println("主机:"+host);
        System.out.println("端口:"+port);
        System.out.println("用户名:"+username);
        System.out.println("密码:"+password);
        
        List<EMailSender> resultList = eMailSenderService.listAllEMailSenders();
        ModelAndView mv = new ModelAndView("email");
        mv.addObject("resultList", resultList);
        return mv;
    }
    
    @RequestMapping(value = "/emailSender/0",method={RequestMethod.GET,RequestMethod.POST})
    public String emailSender(@RequestParam(value="userName") String userName,
            @RequestParam(value="telephone") String telephone,
            @RequestParam(value="message") String message,
            HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
//        userName=request.getParameter("userName");
//        telephone=request.getParameter("telephone");
//        message=request.getParameter("message");
        
        Map<String, Object> params=new HashMap<String, Object>();
        
        params.put("userName", userName);
        params.put("telephone", telephone);
        params.put("message", message);
        
        System.out.println(JSON.toJSONString(params));
        
        // 返回当前页面即可
        try {
            VelocityTemplateMailMailSender.sendVelocityTemplateMail(params);
            
            EMailSender eMailSender=new EMailSender();
            eMailSender.setMessage(message);
            eMailSender.setTelephone(telephone);
            eMailSender.setUserName(userName);
            //执行数据库信息记录  
            int result = eMailSenderService.saveEMailSender(eMailSender);
            if(result==1){
                System.out.println("邮件保存到数据库成功!!!result="+result);
            }else{
                System.out.println("邮件保存到数据库失败!!!result="+result);
            }
            
        } catch (Exception e) {
            System.out.println("邮件发送失败!!!");
            e.printStackTrace();
        }
        return "redirect:/emailIndex";
    }
    
    
    @RequestMapping(value = "/listAllEmailSenders/0",method={RequestMethod.GET,RequestMethod.POST})
    public @ResponseBody Object listAllEmailSenders(@RequestParam(value="start") Integer start,
            @RequestParam(value="size") Integer size,
            HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        List<EMailSender> resultList=null;
        try {
            start=0;
            size=10;
            //执行数据库信息记录  
            resultList = eMailSenderService.listEMailSenders(start=0, size, null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultList;
    }

}
