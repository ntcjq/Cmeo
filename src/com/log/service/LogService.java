package com.log.service;

import java.util.List;
import java.util.Map;
import com.entity.Log;

public interface LogService {

	/**
	 * 动态查询日志信息（几条）
	 */
	public List<Log> selectLogListByConditions(Map<String,Object> map);
	
	/**
	 * 动态查询日志信息的总数量（所有）
	 */
	public int selectLogListByConditionsAll(Map<String,Object> map);
	
}
