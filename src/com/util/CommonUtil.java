package com.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;



public class CommonUtil implements ApplicationContextAware{

	
	public static ApplicationContext applicationContext = null;
	@SuppressWarnings("resource")
	public static Object getBean(String beanId){
//		String configPath="classpath:xml/spring/applicationContext.xml";
//		ApplicationContext ctx=new ClassPathXmlApplicationContext(configPath);
		return applicationContext.getBean(beanId);
	}

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.applicationContext = applicationContext;
		
	}
}
