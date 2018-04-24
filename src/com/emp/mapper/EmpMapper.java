package com.emp.mapper;

import java.util.List;
import java.util.Map;

import com.entity.Emp;

public interface EmpMapper {

	/**
	 * 查询所有人员信息
	 * @return
	 */
	public List<Emp> selectAllEmps();
	/**
	 * 查询某个部门下的所有人员信息
	 * @param dname
	 * @return
	 */
	public List<Emp> selectEmpListFromOneDept(String dname);
	/**
	 * 查询某个人员的信息
	 * @param empno
	 * @return
	 */
	public Emp selectOneEmp(int empno);
	/**
	 * 添加人员
	 * @param emp
	 * @return
	 */
	public int addEmp(Emp emp);
	/**
	 * 更新人员信息
	 * @param emp
	 * @return
	 */
	public int updateEmp(Emp emp);
	/**
	 * 删除人员信息
	 * @param list
	 * @return
	 */
	public int deleteEmp(List<String> list);
	
	/**
	 * 动态查询人员信息
	 * @param emp
	 * @return
	 */
	public List<Emp> selectEmpListByConditions(Map<String,Object> map);
}
