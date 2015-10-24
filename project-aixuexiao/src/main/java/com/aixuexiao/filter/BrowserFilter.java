package com.aixuexiao.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BrowserFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        /**
         * 获取用户浏览器类型
         */
        String userAgent = req.getHeader("User-Agent");
        /**
         * 判断是否为微信浏览器
         */
        if (userAgent.contains("MicroMessenger")) {
            chain.doFilter(request, response);
        } else {
            resp.setCharacterEncoding("UTF-8");
            /**
             * 输出提示
             */
            PrintWriter pw = resp.getWriter();
            pw.write("请使用微信浏览器访问");
            pw.close();
        }
    }

    @Override
    public void destroy() {
    }

}
