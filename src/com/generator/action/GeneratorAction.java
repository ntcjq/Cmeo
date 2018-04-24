package com.generator.action;

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

import com.dept.service.DeptService;
import com.emp.service.EmpService;
import com.entity.Dept;
import com.entity.Emp;
import com.entity.Generator;
import com.generator.service.GeneratorService;
@Controller
public class GeneratorAction {

	@Resource(name="generatorService")
	private GeneratorService generatorService;
	@Resource(name="deptService")
	private DeptService deptService;
	@Resource(name="empService")
	private EmpService empService;
	
	/**
	 * 获取所有机房
	 * @param model
	 * @return
	 */
	@RequestMapping(value="getAllGenerators",method=RequestMethod.GET)
	public String getAllGenerators(Model model){
		List<Generator> generatorList = generatorService.selectAllGenerators();
		model.addAttribute("generatorList", generatorList);
		return "generator/generator-list";
	}
	/**
	 * 获取某个机房
	 * @param model
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="getOneGenerator",method=RequestMethod.GET)
	public String getOneGenerator(@RequestParam("id")int id,@RequestParam("dname")String dname,@RequestParam("managerId")int managerId,Model model) throws UnsupportedEncodingException{
		dname   = new String( dname.getBytes("ISO-8859-1") , "UTF-8");
		List<Emp> empList = empService.selectEmpListFromOneDept(dname);
		Generator generator = generatorService.selectOneGenerator(id);
		Emp empinfo = empService.selectOneEmp(managerId);
		model.addAttribute("empinfo", empinfo);
		model.addAttribute("empList", empList);
		model.addAttribute("generatorInfo", generator);
		return "generator/generator-revise";
	}

	/**
	 * 获取部门列表以供添加机房时选择
	 * @param model
	 * @return
	 */
	@RequestMapping(value="getDeptListForAddGenerator",method=RequestMethod.GET)
	public String getDeptListForAddGenerator(Model model){
		List<Dept> deptList = deptService.selectAllDepts();
		model.addAttribute("deptList", deptList);
		return "generator/generator-add";
	}
	
	/**
	 * 创建机房
	 * @param generator
	 * @param model
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="createGenerator",method=RequestMethod.POST)
	public String createGenerator(Generator generator,Model model) throws UnsupportedEncodingException{
		if(generatorService.addGenerator(generator)){
			List<Generator> generatorList = generatorService.selectAllGenerators();
			model.addAttribute("generatorList", generatorList);
			return "generator/generator-list";
		}else{
			return null;
		}
	}
	/**
	 * 修改机房信息
	 * @param generator
	 * @param model
	 * @return
	 */
	@RequestMapping(value="modifyGeneratorInfo",method=RequestMethod.POST)
	public String modifyGeneratorInfo(Generator generator,Model model){
		if(generatorService.updateGenerator(generator)){
			List<Generator> generatorList = generatorService.selectAllGenerators();
			model.addAttribute("generatorList", generatorList);
			return "generator/generator-list";
		}else{
			return null;
		}
		
	}
	/**
	 * 删除机房信息
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="removeGeneratorInfo",method=RequestMethod.POST)
	public String removeGeneratorInfo(@RequestParam("listString")String listString,Model model,HttpServletResponse resp,HttpServletRequest req) throws IOException{
		String[] idList = listString.split(",");
		List<String> list = new ArrayList<String>();
		for(String  id : idList){
			list.add(id);
		}
		if(generatorService.deleteGenerator(list)){
			resp.getWriter().write("true");
		}else{
			resp.getWriter().write("false");
		}
		return null;
	}
	
	/**
	 * 获取部门列表以及人员列表以供查询机房时选择
	 * @param model
	 * @return
	 */
	@RequestMapping(value="getEmpAndDeptListForQueryGenerator",method=RequestMethod.GET)
	public String getEmpAndDeptListForQueryGenerator(Model model){
		List<Dept> deptList = deptService.selectAllDepts();
		List<Emp> empList = empService.selectAllEmps();
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);
		return "generator/generator-query";
	}
	/**
	 * 动态查询人员信息
	 * @param emp
	 * @param model
	 * @return
	 */
	@RequestMapping(value="getGeneratorListByConditions",method=RequestMethod.POST)
	public String getGeneratorListByConditions(@RequestParam("generatorName")String generatorName,
			@RequestParam("managerId")String managerId,@RequestParam("dname")String dname,@RequestParam("address")String address,Model model){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("generatorName", generatorName);
		map.put("managerId", managerId);
		map.put("dname", dname);
		map.put("address", address);
		List<Generator> generatorList = generatorService.selectGeneratorListByConditions(map);
		model.addAttribute("generatorList", generatorList);
		return "generator/generator-queryList";
	}
}
