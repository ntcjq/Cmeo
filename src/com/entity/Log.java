package com.entity;

import java.util.Date;

import org.springframework.stereotype.Component;

/**
 * 日志信息表
 * @author cuijiaqi
 *
 */
@Component(value="log")
public class Log {

	private int id;
	private int managerId;
	private String managerName;
	private String visitModel;
	private String action;
	private	Date operatetime;
	public Log(){
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getManagerId() {
		return managerId;
	}
	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public String getVisitModel() {
		return visitModel;
	}
	public void setVisitModel(String visitModel) {
		this.visitModel = visitModel;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public Date getOperatetime() {
		return operatetime;
	}
	public void setOperatetime(Date operatetime) {
		this.operatetime = operatetime;
	}
	public Log(int id, int managerId, String managerName, String visitModel, String action, Date operatetime) {
		super();
		this.id = id;
		this.managerId = managerId;
		this.managerName = managerName;
		this.visitModel = visitModel;
		this.action = action;
		this.operatetime = operatetime;
	}
	@Override
	public String toString() {
		return "Log [id=" + id + ", managerId=" + managerId + ", managerName=" + managerName + ", visitModel="
				+ visitModel + ", action=" + action + ", operatetime=" + operatetime + "]";
	}
	
}
