package com.emp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.aspect.OperLog;
import com.emp.mapper.EmpMapper;
import com.emp.service.EmpService;
import com.entity.Emp;
import com.entity.User;
import com.login.mapper.UserMapper;

public class EmpServiceImpl implements EmpService{

	private EmpMapper empMapper;
	private UserMapper userMapper;
	
	public UserMapper getUserMapper() {
		return userMapper;
	}
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	public EmpMapper getEmpMapper() {
		return empMapper;
	}
	public void setEmpMapper(EmpMapper empMapper) {
		this.empMapper = empMapper;
	}

	@OperLog(operModule="人员管理",operType="查询",operDesc="获取所有人员信息")
	public List<Emp> selectAllEmps() {
		return empMapper.selectAllEmps();
	}

	public List<Emp> selectEmpListFromOneDept(String dname){
		return empMapper.selectEmpListFromOneDept(dname);
	}
	
	public Emp selectOneEmp(int empno) {
		return empMapper.selectOneEmp(empno);
	}
	@Transactional
	public boolean addEmp(Emp emp,User user) {
		int flag  = empMapper.addEmp(emp);
		int flag2 = userMapper.addUser(user);
		if(flag > 0 && flag2 > 0){
			return true;
		}else{
			return false;
		}
	}

	public boolean updateEmp(Emp emp) {
		int flag  = empMapper.updateEmp(emp);
		if(flag > 0){
			return true;
		}else{
			return false;
		}
	}

	public boolean deleteEmp(List<String> list) {
		int flag  = empMapper.deleteEmp(list);
		if(flag > 0){
			return true;
		}else{
			return false;
		}
	}
	
	public List<Emp> selectEmpListByConditions(Map<String,Object> map) {
		return empMapper.selectEmpListByConditions(map);
	}

}
