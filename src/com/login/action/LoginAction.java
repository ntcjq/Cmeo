package com.login.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.entity.User;
import com.login.service.UserService;
import com.util.CreateValidateCode;
import com.util.JdbcMD5;

@Controller
public class LoginAction {

	@Resource(name="userService")
	private UserService userService;
	
	/**
	 * 生成验证码
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value="identifyingCode",method=RequestMethod.GET)
	public String getValidateCode(HttpServletRequest request,HttpServletResponse response,
			Model model) throws ServletException, IOException{
		CreateValidateCode.getValidatePic(request, response);
		return null; 
	}
	/**
	 * 验证验证码
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value="checkValidateCode",method=RequestMethod.GET)
	public String checkValidateCode(HttpServletRequest request,HttpServletResponse response,
			Model model) throws ServletException, IOException{
		String strEnsure = (String)request.getSession().getAttribute("strEnsure");
		String confirmCode = request.getParameter("confirmCode");
		PrintWriter out = response.getWriter();
		if(strEnsure.equals(confirmCode)){
			 out.write("true");
		}else{
			 out.write("true");
		}
		return null; 
	}
	/**
	 * 验证登陆
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value="checkLogin",method=RequestMethod.POST)
	public String checkLogin(HttpServletRequest request,HttpServletResponse response,
			Model model) throws ServletException, IOException{
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		password = JdbcMD5.generatePassword(password);
		Map<String,String> map=new HashMap<String,String>();
		map.put("id",id);
		map.put("password",password );
		PrintWriter out = response.getWriter();
		User user = userService.judgeLogin(map);
		if(user != null){
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			 out.write("true");
		}else{
			 out.write("false");
		}
		return null;
	}
	/**
	 * 登出
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value="loginOut",method=RequestMethod.GET)
	public String loginOut(HttpServletRequest request,HttpServletResponse response,
			Model model) throws ServletException, IOException{
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		response.sendRedirect("jsp/login.jsp");
		return null;
	}
}
