package com.limit.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.emp.service.EmpService;
import com.entity.Emp;
import com.entity.Role;
import com.entity.RoleLimitMap;
import com.limit.service.LimitService;
import com.util.CommonUtil;

@Controller
public class LimitAction {

		//这边是通过注解自动注入
		@Resource(name="limitService")
		private LimitService limitService;
		
		@Resource(name="empService")
		private EmpService empService;
		
		/**
		 * 获取所有角色模块信息
		 * @param model
		 * @return
		 */
		@RequestMapping(value="getAllRoles",method=RequestMethod.GET)
		public String getAllRoles(Model model){
			List<Role> roleList  = limitService.selectAllRoles();
			model.addAttribute("roleList", roleList);
			return "limit/role-list";
		}
		/**
		 * 添加角色
		 * @param model
		 * @return
		 */
		@RequestMapping(value="createRole",method=RequestMethod.POST)
		public String createRole(Model model,Role role){
			if(limitService.addRole(role)){
				List<Role> roleList  = limitService.selectAllRoles();
				model.addAttribute("roleList", roleList);
				return "limit/role-list";
			}else{
				return null;
			}
		}
		/**
		 * 删除角色
		 * @param model
		 * @return
		 */
		@RequestMapping(value="removeRole",method=RequestMethod.POST)
		public String removeRole(@RequestParam("listString")String listString,Model model,HttpServletResponse resp,HttpServletRequest req) throws IOException{
			String[] roleNameList = listString.split(",");
			List<String> list = new ArrayList<String>();
			for(String  roleName : roleNameList){
				list.add(roleName);
			}
			//删除角色的同时要删除角色权限表和人员角色表里的内容
			if(limitService.deleteRoles(list) && limitService.deleteRoleLimit(list) && limitService.deleteEmpRoles(list)){
				resp.getWriter().write("true");
			}else{
				resp.getWriter().write("false");
			}
			return null;
		}
		
		/**
		 * 为角色配置权限
		 * @param model
		 * @return
		 */
		@RequestMapping(value="setUpLimitForRole",method=RequestMethod.POST)
		public String setUpLimitForRole(@RequestParam("listString")String listString,@RequestParam("roleName")String roleName,Model model,HttpServletResponse resp,HttpServletRequest req) throws IOException{
			String[] moduleList = listString.split(",");
			for(int i = 0;i<moduleList.length;i++){
				RoleLimitMap roleLimitMap = (RoleLimitMap)CommonUtil.getBean("roleLimitMap");
				roleLimitMap.setRoleName(roleName);
				roleLimitMap.setRoleLimit(moduleList[i]);
				if(!limitService.addLimitForRole(roleLimitMap)){
					resp.getWriter().write("false");
				}
			}
			resp.getWriter().write("true");
			return null;
		}
		
		/**
		 * 获取所有人员
		 * @param model
		 * @return
		 */
		@RequestMapping(value="getAllEmpsInLimitModule",method=RequestMethod.GET)
		public String getAllEmpsInLimitModule(Model model){
			List<Emp> empList = empService.selectAllEmps();
			model.addAttribute("empList", empList);
			return "limit/power-list";
		}
		
		/**
		 * 获取所有角色模块信息为配置权限
		 * @param model
		 * @return
		 */
		@RequestMapping(value="getAllRolesForSetUp",method=RequestMethod.GET)
		public String getAllRolesForSetUp(@RequestParam("empno")String empno,@RequestParam("ename")String ename,Model model){
			List<Role> roleList  = limitService.selectAllRoles();
			model.addAttribute("roleList", roleList);
			model.addAttribute("empno", empno);
			model.addAttribute("ename", ename);
			return "limit/power-setup";
		}
		
		/**
		 * 为人员配置角色
		 * @param model
		 * @return
		 */
		@RequestMapping(value="setUpRoleForEmp",method=RequestMethod.POST)
		public String setUpRoleForEmp(@RequestParam("listString")String listString,@RequestParam("empno")int empno,Model model,HttpServletResponse resp,HttpServletRequest req) throws IOException{
			
			if(!limitService.setUpRoleForEmp(empno, listString)){
				resp.getWriter().write("false");
			}
			resp.getWriter().write("true");
			return null;
		}
}
