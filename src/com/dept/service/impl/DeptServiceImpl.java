package com.dept.service.impl;

import java.util.List;
import com.dept.mapper.DeptMapper;
import com.dept.service.DeptService;
import com.entity.Dept;

public class DeptServiceImpl implements DeptService{

	/**
	 * deptMapper是通过在applicationContext.xml中注入的
	 * （注意：只需要且必须要get方法来获取对象，然后才能调用其方法）
	 */
	private DeptMapper deptMapper;
	public DeptMapper getDeptMapper() {
		return deptMapper;
	}
	public void setDeptMapper(DeptMapper deptMapper) {
		this.deptMapper = deptMapper;
	}
	
	public List<Dept> selectAllDepts() {
		return deptMapper.selectAllDepts();
	}
	
	public Dept selectOneDept(int deptno) {
		return deptMapper.selectOneDept(deptno);
	}
	
	public boolean addDept(Dept dept) {
		int flag = deptMapper.addDept(dept);
		if(flag > 0){
			return true;
		}else{
			return false;
		}
	}
	
	public boolean updateDept(Dept dept) {
		int flag = deptMapper.updateDept(dept);
		if(flag > 0){
			return true;
		}else{
			return false;
		}
	}
	
	public boolean deleteDept(List<String> list) {
		int flag = deptMapper.deleteDept(list);
		if(flag > 0){
			return true;
		}else{
			return false;
		}
	}
}
