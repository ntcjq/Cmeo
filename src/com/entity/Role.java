package com.entity;

import org.springframework.stereotype.Component;

/**
 * 角色模块表
 * @author cuijiaqi
 *
 */
@Component(value="role")
public class Role {

	private String roleName;
	private String module;
	public Role(){
		
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getModule() {
		return module;
	}
	public void setModule(String module) {
		this.module = module;
	}
	public Role(String roleName, String module) {
		super();
		this.roleName = roleName;
		this.module = module;
	}
	@Override
	public String toString() {
		return "Role [roleName=" + roleName + ", module=" + module + "]";
	}
	
}
