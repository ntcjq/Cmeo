package com.log.service.impl;

import java.util.List;
import java.util.Map;

import com.emp.mapper.EmpMapper;
import com.entity.Log;
import com.log.mapper.LogMapper;
import com.log.service.LogService;
/**
 * 日志切面类advice
 * @author cuijiaqi
 *
 */
public class LogServiceImpl implements LogService{

	private LogMapper logMapper;
	private EmpMapper empMapper;
	
	public EmpMapper getEmpMapper() {
		return empMapper;
	}


	public void setEmpMapper(EmpMapper empMapper) {
		this.empMapper = empMapper;
	}


	public void setLogMapper(LogMapper logMapper) {
		this.logMapper = logMapper;
	}


	public List<Log> selectLogListByConditions(Map<String, Object> map) {
		return logMapper.selectLogListByConditions(map);
	}

	public int selectLogListByConditionsAll(Map<String, Object> map) {
		return logMapper.selectLogListByConditionsAll(map);
	}
}
