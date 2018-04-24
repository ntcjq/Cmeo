package com.entity;

import org.springframework.stereotype.Component;

/**
 * 员工信息表
 * @author cuijiaqi
 *
 */
@Component(value="emp")
public class Emp {

	private int empno;
	private String ename;
	private String dname;
	private String emptype;
	private String telephone;
	private String email;
	private String phone;
	private String fax;
	private String message;
	public Emp(){
		
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getEmptype() {
		return emptype;
	}
	public void setEmptype(String emptype) {
		this.emptype = emptype;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public Emp(int empno, String ename, String dname, String emptype,
			String telephone, String email, String phone, String fax,
			String message) {
		super();
		this.empno = empno;
		this.ename = ename;
		this.dname = dname;
		this.emptype = emptype;
		this.telephone = telephone;
		this.email = email;
		this.phone = phone;
		this.fax = fax;
		this.message = message;
	}
	@Override
	public String toString() {
		return "Emp [empno=" + empno + ", ename=" + ename + ", dname=" + dname
				+ ", emptype=" + emptype + ", telephone=" + telephone
				+ ", email=" + email + ", phone=" + phone + ", fax=" + fax
				+ ", message=" + message + "]";
	}
	
}
