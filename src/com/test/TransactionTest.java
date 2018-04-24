package com.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.limit.service.LimitService;
import com.util.CommonUtil;
import com.util.Module;



public class TransactionTest {

	public static void main1(String[] args) {
		String configPath="classpath:xml/spring/applicationContext.xml";
		ApplicationContext ctx=new ClassPathXmlApplicationContext(configPath);
		//ApplicationContext ctx = new FileSystemXmlApplicationContext("/WebRoot/WEB-INF/applicationContext.xml"); 
		LimitService limitService=ctx.getBean("limitService",LimitService.class);
		System.out.println("begin.....");
		int empno = 10001;
		String listString = "角色五";
		limitService.setUpRoleForEmp(empno, listString);
		System.out.println("end....");
	}
	public static void main(String[] args) {
		String configPath="classpath:xml/spring/applicationContext.xml";
		ApplicationContext ctx=new ClassPathXmlApplicationContext(configPath);
		//ApplicationContext ctx = new FileSystemXmlApplicationContext("/WebRoot/WEB-INF/applicationContext.xml"); 
		LimitService limitService=ctx.getBean("limitService",LimitService.class);
		
		Module module = (Module)CommonUtil.getBean("module");
		List<String> moduleList = module.getModuleList();
	}
}
