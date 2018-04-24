package com.util;

import java.io.IOException;  
import javax.servlet.Filter;  
import javax.servlet.FilterChain;  
import javax.servlet.FilterConfig;  
import javax.servlet.ServletException;  
import javax.servlet.ServletRequest;  
import javax.servlet.ServletResponse;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  
  
public class JspFilter  implements Filter  {  
      
    private  String strRedirect = "";  
  
    protected FilterConfig filterConfig;  
  
    public void destroy() {  
        this.filterConfig = null;  
    }  
  
    public void doFilter(ServletRequest req, ServletResponse res,  
            FilterChain chain) throws IOException, ServletException {  
        HttpServletRequest request = (HttpServletRequest) req;  
        HttpServletResponse response = (HttpServletResponse) res;  
        HttpSession session = request.getSession(true);  
        String isLogin = "";  
        String servletPath = request.getServletPath();
        String pathInfo = request.getPathInfo();
        if (pathInfo != null && pathInfo.length() > 0) {
        	servletPath = servletPath + pathInfo;
        }
        strRedirect  =  "http://"  +  request.getServerName()  +  ":"  +  request.getServerPort()  +request.getContextPath()+ "/jsp/login.jsp";    
      //  System.out.println("web  URL  路径:"+strRedirect);  
        try {  
            if (null != session.getAttribute("user")) {  
                isLogin = "true";
            }  
            if ("true".equals(isLogin) || "/jsp/login.jsp".equals(servletPath)) {  
             //   System.out.println("验证通过");  
                chain.doFilter(req, res);  
                return;
            } else {  
            	response.sendRedirect(strRedirect);  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
    public void init(FilterConfig arg0) throws ServletException {  
        this.filterConfig = arg0;  
    }  
}  
