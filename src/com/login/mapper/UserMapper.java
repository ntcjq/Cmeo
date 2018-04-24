package com.login.mapper;

import java.util.Map;

import com.entity.User;

public interface UserMapper {

	public User judgeLogin(Map<String,String> map);
	public int addUser(User user);
}
