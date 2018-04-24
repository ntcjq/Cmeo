package com.dept.mapper;

import java.util.List;

import com.entity.Dept;

public interface DeptMapper {

	/**
	 * 查询所有部门信息
	 * @return
	 */
	public List<Dept> selectAllDepts();
	/**
	 * 查询某个部门信息
	 * @param deptno
	 * @return
	 */
	public Dept selectOneDept(int deptno);
	/**
	 * 添加部门
	 * @param dept
	 * @return
	 */
	public int addDept(Dept dept);
	/**
	 * 更新部门信息
	 * @param dept
	 * @return
	 */
	public int updateDept(Dept dept);
	/**
	 * 删除部门信息
	 * @param list
	 * @return
	 */
	public int deleteDept(List<String> list);
}
