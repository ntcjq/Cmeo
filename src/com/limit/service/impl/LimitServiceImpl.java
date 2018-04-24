package com.limit.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.entity.EmpLimit;
import com.entity.Role;
import com.entity.RoleDistribute;
import com.entity.RoleLimitMap;
import com.limit.mapper.LimitMapper;
import com.limit.service.LimitService;
import com.util.CommonUtil;

public class LimitServiceImpl implements LimitService{

	private LimitMapper limitMapper;
	
	public LimitMapper getLimitMapper() {
		return limitMapper;
	}

	public void setLimitMapper(LimitMapper limitMapper) {
		this.limitMapper = limitMapper;
	}

	public List<Role> selectAllRoles() {
		return limitMapper.selectAllRoles();
	}
	public boolean addRole(Role role) {
		boolean flag = false;
		if(limitMapper.addRole(role)>0){
			flag = true;
		}
		return flag;
	}
	
	public boolean deleteRoles(List<String> list) {
		boolean flag = false;
		if(limitMapper.deleteRoles(list)>0){
			flag = true;
		}
		return flag;
	}
	
	public boolean deleteEmpRoles(List<String> list){
		boolean flag = false;
		if(limitMapper.deleteEmpRoles(list)>0){
			flag = true;
		}
		return flag;
	}
	
	public boolean addLimitForRole(RoleLimitMap roleLimitMap) {
		boolean flag = false;
		if(limitMapper.addLimitForRole(roleLimitMap)>0){
			flag = true;
		}
		return flag;
	}
	
	
	public boolean deleteRoleLimit(List<String> list){
		boolean flag = false;
		if(limitMapper.deleteRoleLimit(list)>0){
			flag = true;
		}
		return flag;
	}

	
	
	public boolean addRoleForEmp(RoleDistribute roleDistribute){
		boolean flag = false;
		if(limitMapper.addRoleForEmp(roleDistribute)>0){
			flag = true;
		}
		return flag;
	}
	
	public List<String> selectAllEmpLimit(int empno){
		return limitMapper.selectAllEmpLimit(empno);
	}
	
	public EmpLimit selectOneEmpLimit(int empno){
		return limitMapper.selectOneEmpLimit(empno);
	}
	
	public boolean  addLimitForEmp(EmpLimit empLimit){
		boolean flag = false;
		if(limitMapper.addLimitForEmp(empLimit)>0){
			flag = true;
		}
		return flag;
	}
	
	public boolean  updateLimitForEmp(EmpLimit empLimit){
		boolean flag = false;
		if(limitMapper.updateLimitForEmp(empLimit)>0){
			flag = true;
		}
		return flag;
	}
	@Transactional
	public boolean  setUpRoleForEmp(int empno,String listString){
		
		String[] moduleList = listString.split(",");
		for(int i = 0;i<moduleList.length;i++){
			RoleDistribute roleDistribute = (RoleDistribute)CommonUtil.getBean("roleDistribute");
			roleDistribute.setEmpno(empno);
			roleDistribute.setRoleName(moduleList[i]);
			if(limitMapper.addRoleForEmp(roleDistribute) < 0 ){
				return false;
			}
		}
		//查询某个人员的所有权限
		List<String> list = limitMapper.selectAllEmpLimit(empno);
		StringBuffer stringBuffer = new StringBuffer();
		for(int i = 0 ;i<list.size();i++){
			if(i == list.size()-1){
				stringBuffer.append(list.get(i));
			}else{
				stringBuffer.append(list.get(i)+",");
			}
		}
		String allLimit = stringBuffer.toString();
		EmpLimit empLimit = (EmpLimit)CommonUtil.getBean("empLimit");
		empLimit.setEmpno(empno);
		empLimit.setAllLimit(allLimit);
		//新增或更新人员所有权限
		//根据empno判断是否存在
		if(limitMapper.selectOneEmpLimit(empno) != null){
			if(limitMapper.updateLimitForEmp(empLimit) < 0){
				return false;
			}
		}else{
			if(limitMapper.addLimitForEmp(empLimit) < 0){
				return false;
			}
		}
		return true;
	}
}
