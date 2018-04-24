package com.login.service;

import java.util.Map;
import com.entity.User;

public interface UserService {

	/**
	 * 验证登陆
	 */
	public User judgeLogin(Map<String,String> map);
}
