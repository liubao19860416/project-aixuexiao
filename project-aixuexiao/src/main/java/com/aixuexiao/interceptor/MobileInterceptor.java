package com.aixuexiao.interceptor;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 移动设备拦截器<br>
 * 拦截非移动设备.
 */
public class MobileInterceptor extends HandlerInterceptorAdapter {
    private static final Logger LOGGER = LoggerFactory.getLogger(MobileInterceptor.class);
    private static final String USER_AGENT_HEADER = "User-Agent";

    /** The mobile agents. */
    private List<String> mobileUserAgents;
    /** The ua patterns. */
    private List<Pattern> uaPatterns;
    /** The non mobile view name. */
    private String nonMobileUrl;

    /**
     * 功能描述: 初始化配置文件中的移动设备关键字.<br>
     */
    public void init() {
        uaPatterns = new ArrayList<Pattern>();
        // 预编译配置文件中user-agent的正则
        for (final String ua : mobileUserAgents) {
            try {
                uaPatterns.add(Pattern.compile(ua, Pattern.CASE_INSENSITIVE));
            } catch (PatternSyntaxException e) {
                LOGGER.debug("预编译配置文件中user-agent的正则出错");
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public boolean preHandle(HttpServletRequest request,
            HttpServletResponse response, Object handler) throws Exception {
        final String userAgent = request.getHeader(USER_AGENT_HEADER);
        LOGGER.debug("User-Agent: {}", userAgent);

        if (userAgent != null) {
            // 非移动设备跳转页面
            if (!isMobile(userAgent)) {
                String contextPath = request.getContextPath();
                if (StringUtils.isBlank(contextPath)) {
                    response.sendRedirect(nonMobileUrl);
                } else {
                    response.sendRedirect(contextPath + nonMobileUrl);
                }
                return false;
            }
        }
        return true;
    }

    /**
     * 功能描述: 根据配置文件匹配是否移动设备.<br>
     */
    private final boolean isMobile(final String agent) {
        boolean isMobile = false;
        for (final Pattern p : uaPatterns) {
            final Matcher m = p.matcher(agent);
            if (m.find()) {
                isMobile = true;
                break;
            }
        }
        return isMobile;
    }

    /**
     * 功能描述: 设置agent.<br>
     */
    public void setMobileUserAgents(List<String> mobileUserAgents) {
        this.mobileUserAgents = mobileUserAgents;
    }

    /**
     * 功能描述: 设置非移动页面名称<br>
     */
    public void setNonMobileUrl(String viewName) {
        this.nonMobileUrl = viewName;
    }
}
