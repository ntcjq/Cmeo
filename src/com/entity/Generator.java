package com.entity;

import org.springframework.stereotype.Component;

@Component(value="generator")
public class Generator {

	private int id;
	private	 String generatorName;
	private int managerId;
	private String dname;
	private String address;
	private String message;
	
	public Generator(){
		
	}
	public Generator(int id, String generatorName, int managerId, String dname,
			String address, String message) {
		super();
		this.id = id;
		this.generatorName = generatorName;
		this.managerId = managerId;
		this.dname = dname;
		this.address = address;
		this.message = message;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGeneratorName() {
		return generatorName;
	}
	public void setGeneratorName(String generatorName) {
		this.generatorName = generatorName;
	}
	public int getManagerId() {
		return managerId;
	}
	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	@Override
	public String toString() {
		return "Generator [id=" + id + ", generatorName=" + generatorName
				+ ", managerId=" + managerId + ", dname=" + dname
				+ ", address=" + address + ", message=" + message + "]";
	}
	
}
