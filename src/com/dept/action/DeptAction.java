package com.dept.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
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

import com.dept.service.DeptService;
import com.emp.service.EmpService;
import com.entity.Dept;
import com.entity.Emp;

@Controller
public class DeptAction {

	//这边是通过注解自动注入
	@Resource(name="deptService")
	private DeptService deptService;
	
	@Resource(name="empService")
	private EmpService empService;
	/**
	 * 获取所有部门
	 * @param model
	 * @return
	 */
	@RequestMapping(value="getAllDepts",method=RequestMethod.GET)
	public String getAllDepts(Model model){
		List<Dept> deptList = deptService.selectAllDepts();
		model.addAttribute("deptList", deptList);
		return "department/department-list";
	}
	/**
	 * 获取某个部门
	 * @param model
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="getOneDept",method=RequestMethod.GET)
	public String getOneDept(@RequestParam("deptno")int deptno,@RequestParam("dname")String dname,Model model) throws UnsupportedEncodingException{
		dname   = new String( dname.getBytes("ISO-8859-1") , "UTF-8");
		Dept dept = deptService.selectOneDept(deptno);
		String managerName = empService.selectOneEmp(dept.getManager()).getEname();
		//获取某个部门下的所有人员
		List<Emp> empList = empService.selectEmpListFromOneDept(dname);
		model.addAttribute("managerName", managerName);
		model.addAttribute("emplist", empList);
		model.addAttribute("deptInfo", dept);
		return "department/department-revise";
	}

	/**
	 * 创建部门
	 * @param dept
	 * @param model
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="createDept",method=RequestMethod.POST)
	public String createDept(Dept dept,Model model) throws UnsupportedEncodingException{
		if(deptService.addDept(dept)){
			List<Dept> deptList = deptService.selectAllDepts();
			model.addAttribute("deptList", deptList);
			return "department/department-list";
		}else{
			return null;
		}
	}
	/**
	 * 修改部门信息
	 * @param model
	 * @return
	 */
	@RequestMapping(value="modifyDeptInfo",method=RequestMethod.POST)
	public String modifyDeptInfo(Dept dept,Model model){
		if(deptService.updateDept(dept)){
			List<Dept> deptList = deptService.selectAllDepts();
			model.addAttribute("deptList", deptList);
			return "department/department-list";
		}else{
			return null;
		}
		
	}
	/**
	 * 删除部门信息
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="removeDeptInfo",method=RequestMethod.POST)
	public String removeDeptInfo(@RequestParam("listString")String listString,Model model,HttpServletResponse resp,HttpServletRequest req) throws IOException{
		String[] deptnoList = listString.split(",");
		List<String> list = new ArrayList<String>();
		for(String  deptno : deptnoList){
			list.add(deptno);
		}
		if(deptService.deleteDept(list)){
			resp.getWriter().write("true");
		}else{
			resp.getWriter().write("false");
		}
		return null;
	}
	
}
