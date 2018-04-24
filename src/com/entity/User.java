package com.entity;

import org.springframework.stereotype.Component;

/**
 * 登陆信息表
 * @author cuijiaqi
 *
 */
@Component(value="user")
public class User {

	private int id;
	private String password;
	public User(){
		
	}
	public int getid() {
		return id;
	}
	public void setid(int id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public User(int id, String password) {
		super();
		this.id = id;
		this.password = password;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", password=" + password + "]";
	}
}
