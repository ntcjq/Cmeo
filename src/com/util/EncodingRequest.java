package com.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncodingRequest  extends HttpServletRequestWrapper{
       private HttpServletRequest req;   
	public EncodingRequest(HttpServletRequest request) {
		super(request);
		this.req = request;
	}
	public String getParameter(String arg0) {	
		String value=req.getParameter(arg0);			
		try {
			value=new String(value.getBytes("ISO-8859-1"),"utf-8");
		} catch (Exception e) {		
			e.printStackTrace();
		}
		return value;
	}

	
}
