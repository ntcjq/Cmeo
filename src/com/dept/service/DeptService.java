package com.dept.service;

import java.util.List;

import com.entity.Dept;

public interface DeptService {

	public List<Dept> selectAllDepts();
	public Dept selectOneDept(int deptno);
	public boolean addDept(Dept dept);
	public boolean updateDept(Dept dept);
	public boolean deleteDept(List<String> list);
}
