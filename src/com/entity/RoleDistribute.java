package com.entity;

import org.springframework.stereotype.Component;

/**
 * 人员角色表
 * @author cuijiaqi
 *
 */
@Component(value="roleDistribute")
public class RoleDistribute {

	private int id;
	private int empno;
	private String roleName;
	public RoleDistribute(){
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public RoleDistribute(int id, int empno, String roleName) {
		super();
		this.id = id;
		this.empno = empno;
		this.roleName = roleName;
	}
	@Override
	public String toString() {
		return "RoleDistribute [id=" + id + ", empno=" + empno + ", roleName=" + roleName + "]";
	}
	
}
