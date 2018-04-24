package com.entity;

import org.springframework.stereotype.Component;

/**
 * 角色权限表
 * @author cuijiaqi
 *
 */
@Component(value="roleLimitMap")
public class RoleLimitMap {

	private int id;
	private String roleName;
	private String roleLimit;
	public RoleLimitMap(){
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getRoleLimit() {
		return roleLimit;
	}
	public void setRoleLimit(String roleLimit) {
		this.roleLimit = roleLimit;
	}
	@Override
	public String toString() {
		return "RoleLimitMap [id=" + id + ", roleName=" + roleName + ", roleLimit=" + roleLimit + "]";
	}
	public RoleLimitMap(int id, String roleName, String roleLimit) {
		super();
		this.id = id;
		this.roleName = roleName;
		this.roleLimit = roleLimit;
	}

}
