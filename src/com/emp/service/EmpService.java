package com.emp.service;

import java.util.List;
import java.util.Map;

import com.entity.Emp;
import com.entity.User;

public interface EmpService {

	public List<Emp> selectAllEmps();
	public List<Emp> selectEmpListFromOneDept(String dname);
	public Emp selectOneEmp(int empno);
	public boolean addEmp(Emp emp,User user);
	public boolean updateEmp(Emp emp);
	public boolean deleteEmp(List<String> list);
	public List<Emp> selectEmpListByConditions(Map<String,Object> map);
}
