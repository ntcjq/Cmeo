package com.login.service.impl;

import java.util.Map;
import com.entity.User;
import com.login.mapper.UserMapper;
import com.login.service.UserService;

public class UserServiceImpl implements UserService{

	private UserMapper userMapper;
	
	public UserMapper getUserMapper() {
		return userMapper;
	}

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	/**
	 * 验证登陆
	 */
	public User judgeLogin(Map<String,String> map) {
		return userMapper.judgeLogin(map);
	}

}
