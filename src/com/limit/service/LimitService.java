package com.limit.service;

import java.util.List;
import com.entity.EmpLimit;
import com.entity.Role;
import com.entity.RoleDistribute;
import com.entity.RoleLimitMap;

public interface LimitService {

	/**
	 * 查询角色模块表的所有信息
	 */
	public List<Role> selectAllRoles();
	/**
	 * 新增角色
	 */
	public boolean addRole(Role role);
	
	/**
	 *删除角色
	 */
	public boolean deleteRoles(List<String> list);
	
	/**
	 *（删除角色的同时）删除人员角色
	 */
	public boolean deleteEmpRoles(List<String> list);
	
	/**
	 *  为角色配置权限
	 */
	public boolean addLimitForRole(RoleLimitMap roleLimitMap);
	
	
	/**
	 * （删除角色的同时）删除角色权限
	 */
	public boolean deleteRoleLimit(List<String> list);
	
	/**
	 *  为人员配置角色
	 */
	public boolean addRoleForEmp(RoleDistribute roleDistribute);
	
	/**
	 * 查询某个人员的所有权限
	 */
	public List<String> selectAllEmpLimit(int empno);
	
	/**
	 *查询某个人员的所有权限
	 */
	public EmpLimit selectOneEmpLimit(int empno);
	
	/**
	 *   添加人员权限
	 */
	public boolean  addLimitForEmp(EmpLimit empLimit);
	
	/**
	 *  更新人员权限
	 */
	public boolean  updateLimitForEmp(EmpLimit empLimit);
	
	
	public boolean  setUpRoleForEmp(int empno,String listString);
	
}
