package com.limit.mapper;

import java.util.List;
import com.entity.EmpLimit;
import com.entity.Role;
import com.entity.RoleDistribute;
import com.entity.RoleLimitMap;

public interface LimitMapper {

	/**
	 * 查询角色模块表的所有信息
	 */
	public List<Role> selectAllRoles();
	/**
	 * 新增角色
	 */
	public int addRole(Role role);
	
	/**
	 *删除角色
	 */
	public int deleteRoles(List<String> list);
	
	/**
	 *（删除角色的同时）删除人员角色
	 */
	public int deleteEmpRoles(List<String> list);
	
	/**
	 *  为角色配置权限
	 */
	public int addLimitForRole(RoleLimitMap roleLimitMap);
	
	
	/**
	 *（删除角色的同时）删除角色权限
	 */
	public int deleteRoleLimit(List<String> list);
	
	/**
	 *  为人员配置角色
	 */
	public int addRoleForEmp(RoleDistribute roleDistribute);
	
	/**
	 * 查询某个人员的所有权限(返回一个权限集合)
	 */
	public List<String> selectAllEmpLimit(int empno);
	
	/**
	 *查询某个人员的所有权限(返回一个权限对象)
	 */
	public EmpLimit selectOneEmpLimit(int empno);
	
	/**
	 *  添加人员权限
	 */
	public int  addLimitForEmp(EmpLimit empLimit);
	
	/**
	 *  更新人员权限
	 */
	public int  updateLimitForEmp(EmpLimit empLimit);
	
	
}
