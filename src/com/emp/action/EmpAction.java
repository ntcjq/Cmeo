package com.emp.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aspect.OperLog;
import com.dept.service.DeptService;
import com.emp.service.EmpService;
import com.entity.Dept;
import com.entity.Emp;
import com.entity.Log;
import com.entity.User;
import com.util.CommonUtil;
import com.util.JdbcMD5;

@Controller
public class EmpAction {
	
	@Resource(name="empService")
	private EmpService empService;
	@Resource(name="deptService")
	private DeptService deptService;
	
	/**
	 * 获取所有人员
	 * @param model
	 * @return
	 */
	@OperLog(operModule="人员管理",operType="查询",operDesc="Controller测试")
	@RequestMapping(value="getAllEmps",method=RequestMethod.GET)
	public String getAllEmps(Model model){
		List<Emp> empList = empService.selectAllEmps();
		model.addAttribute("empList", empList);
		return "person/person-list";
	}
	/**
	 * 获取某个人员
	 * @param model
	 * @return
	 */
	@RequestMapping(value="getOneEmp",method=RequestMethod.GET)
	public String getOneEmp(@RequestParam("empno")int empno,Model model){
		List<Dept> deptList = deptService.selectAllDepts();
		Emp emp = empService.selectOneEmp(empno);
		model.addAttribute("deptlist", deptList);
		model.addAttribute("emp", emp);
		return "person/person-revise";
	}
	
	/**
	 * 获取部门列表以供添加人员时选择
	 * @param model
	 * @return
	 */
	@RequestMapping(value="getDeptListForAddEmp",method=RequestMethod.GET)
	public String getDeptListForAddEmp(Model model){
		List<Dept> deptList = deptService.selectAllDepts();
		model.addAttribute("deptlist", deptList);
		return "person/person-add";
	}
	
	/**
	 * 添加人员（同时要往User表里插入数据用于登录）
	 * @param dept
	 * @param model
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="createEmp",method=RequestMethod.POST)
	public String createEmp(Emp emp,@RequestParam("password")String password,Model model) throws UnsupportedEncodingException{
		User user = (User)CommonUtil.getBean("user");
		user.setid(emp.getEmpno());
		user.setPassword(JdbcMD5.generatePassword(password));
		if(empService.addEmp(emp,user)){
			List<Emp> empList = empService.selectAllEmps();
			model.addAttribute("empList", empList);
			return "person/person-list";
		}else{
			return null;
		}
	}
	
	/**
	 * 修改人员信息
	 * @param model
	 * @return
	 */
	@RequestMapping(value="modifyEmpInfo",method=RequestMethod.POST)
	public String modifyEmpInfo(Emp emp,Model model){
		if(empService.updateEmp(emp)){
			List<Emp> empList = empService.selectAllEmps();
			model.addAttribute("empList", empList);
			return "person/person-list";
		}else{
			return null;
		}
		
	}
	
	/**
	 * 删除人员信息
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="removeEmpInfo",method=RequestMethod.POST)
	public String removeEmpInfo(@RequestParam("listString")String listString,Model model,HttpServletResponse resp,HttpServletRequest req) throws IOException{
		String[] empnoList = listString.split(",");
		List<String> list = new ArrayList<String>();
		for(String  empno : empnoList){
			list.add(empno);
		}
		if(empService.deleteEmp(list)){
			resp.getWriter().write("true");
		}else{
			resp.getWriter().write("false");
		}
		return null;
	}
	
	/**
	 * 获取部门列表以供查询人员时选择
	 * @param model
	 * @return
	 */
	@RequestMapping(value="getDeptListForQueryEmp",method=RequestMethod.GET)
	public String getDeptListForQueryEmp(Model model){
		List<Dept> deptList = deptService.selectAllDepts();
		model.addAttribute("deptlist", deptList);
		return "person/person-query";
	}
	/**
	 * 动态查询人员信息
	 * @param emp
	 * @param model
	 * @return
	 */
	@RequestMapping(value="getEmpListByConditions",method=RequestMethod.POST)
	public String getEmpListByConditions(@RequestParam("empno")String empno,@RequestParam("ename")String ename,
			@RequestParam("dname")String dname,@RequestParam("emptype")String emptype,Model model){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("empno", empno);
		map.put("ename", ename);
		map.put("dname", dname);
		map.put("emptype", emptype);
		List<Emp> empList = empService.selectEmpListByConditions(map);
		model.addAttribute("empList", empList);
		return "person/person-queryList";
	}
	
}
