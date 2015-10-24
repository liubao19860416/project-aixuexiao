package com.aixuexiao.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

/**
 * 过滤request请求中的敏感字符<br>
 * 防止Xss/csrf/注入钓鱼网站/SQL等的攻击.
 */
public class XssFilter implements Filter {

    /**
     * {@inheritDoc}
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {
        chain.doFilter(new XssHttpServletRequestWrapper(
                (HttpServletRequest) request), response);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void destroy() {
    }

    
    /**
     * 内部类型
     * 
     */
    class XssHttpServletRequestWrapper extends HttpServletRequestWrapper {
        /** The Constant LOGGER. */
        // private static final Logger LOGGER =
        // LoggerFactory.getLogger(XssHttpServletRequestWrapper.class);

        /**
         * Instantiates a new xss http servlet request wrapper.
         * 
         * @param servletRequest
         *            the servlet request
         */
        public XssHttpServletRequestWrapper(HttpServletRequest servletRequest) {
            super(servletRequest);
        }

        /**
         * {@inheritDoc}
         */
        public String[] getParameterValues(String parameter) {
            String[] values = super.getParameterValues(parameter);
            if (values == null) {
                return null;
            }
            // 用户密码则直接返回
            if ("password".equalsIgnoreCase(parameter)
                    || "newPassword".equalsIgnoreCase(parameter)) {
                return values;
            }

            int count = values.length;
            String[] encodedValues = new String[count];
            // LOGGER.debug("防XSS原字符: {} - {}", parameter,
            // JSONObject.toJSON(values));
            // 替换request中敏感字符
            for (int i = 0; i < count; i++) {
                encodedValues[i] = cleanXSS(values[i]);
            }
            // LOGGER.debug("防XSS新字符: {} - {}", parameter,
            // JSONObject.toJSON(values));
            return encodedValues;
        }

        /**
         * {@inheritDoc}
         */
        public String getParameter(String parameter) {
            String value = super.getParameter(parameter);
            if (value == null) {
                return null;
            }
            // 用户密码则直接返回
            if ("password".equalsIgnoreCase(parameter)
                    || "newPassword".equalsIgnoreCase(parameter)) {
                return value;
            }

            // LOGGER.debug("防XSS原字符: {} - {}", parameter, value);
            // LOGGER.debug("防XSS新字符: {} - {}", parameter, cleanXSS(value));
            return cleanXSS(value);
        }

        /**
         * {@inheritDoc}
         */
        public String getHeader(String name) {
            String value = super.getHeader(name);
            if (value == null) {
                return null;
            }

            // LOGGER.debug("防XSS原字符: {} - {}", name, value);
            // LOGGER.debug("防XSS新字符: {} - {}", name, cleanXSS(value));
            return cleanXSS(value);
        }

        /**
         * 功能描述: 替换敏感字符<br>
         * @param value
         *            需要替换的字串
         * @return 替换好的字串
         */
        private String cleanXSS(String value) {
            value = value
                    .replaceAll("<", "&lt;")
                    .replaceAll(">", "&gt;")
                    .replaceAll("\\(", "&#40;")
                    .replaceAll("\\)", "&#41;")
                    .replaceAll("'", "&#39;")
                    .replaceAll("eval\\((.*)\\)", "")
                    .replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']",
                            "\"\"");
            return value;
        }
    }
}
