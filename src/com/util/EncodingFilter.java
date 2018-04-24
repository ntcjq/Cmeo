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
/**
 * 防止乱码的过滤器
 *
 */
public class EncodingFilter implements Filter {
	public void destroy() {
	

	}
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
        /**
         * 设置response编码集
         */
		 HttpServletResponse res=(HttpServletResponse)response;
         res.setCharacterEncoding("utf-8");
         res.setHeader("content-type", "text/html;charset=utf-8");
		 
         HttpServletRequest req=(HttpServletRequest)request; 
		/**
		 * 判断请求方式，更具请求方式选择操作
		 */
		if(req.getMethod().equals("GET")){
			EncodingRequest er=new EncodingRequest(req);
			chain.doFilter(er, response);
		}else if(req.getMethod().equals("POST")){
			request.setCharacterEncoding("utf-8");
			chain.doFilter(request, response);
		}     
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

}
