package com.entity;

import org.springframework.stereotype.Component;

/**
 * 部门信息表
 * @author cuijiaqi
 *
 */
@Component(value="dept")
public class Dept {
	
	private int deptno;
	private String dname;
	private int manager;
	private String telephone;
	private String phone;
	private String fax;
	private String message;
	public Dept(){
		
	}
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public int getManager() {
		return manager;
	}
	public void setManager(int manager) {
		this.manager = manager;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Dept(int deptno, String dname, int manager, String telephone,
			String phone, String fax, String message) {
		super();
		this.deptno = deptno;
		this.dname = dname;
		this.manager = manager;
		this.telephone = telephone;
		this.phone = phone;
		this.fax = fax;
		this.message = message;
	}
	@Override
	public String toString() {
		return "Dept [deptno=" + deptno + ", dname=" + dname + ", manager="
				+ manager + ", telephone=" + telephone + ", phone=" + phone
				+ ", fax=" + fax + ", message=" + message + "]";
	}
}
