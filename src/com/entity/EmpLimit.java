package com.entity;

import org.springframework.stereotype.Component;

@Component(value="empLimit")
public class EmpLimit {

	private int empno;
	private String allLimit;
	public EmpLimit(){}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getAllLimit() {
		return allLimit;
	}
	public void setAllLimit(String allLimit) {
		this.allLimit = allLimit;
	}
	@Override
	public String toString() {
		return "EmpLimit [empno=" + empno + ", allLimit=" + allLimit + "]";
	}
	public EmpLimit(int empno, String allLimit) {
		super();
		this.empno = empno;
		this.allLimit = allLimit;
	}
	
}
