package com.aspect;

import java.lang.reflect.Method;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.emp.mapper.EmpMapper;
import com.entity.Emp;
import com.entity.Log;
import com.entity.User;
import com.log.mapper.LogMapper;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.Mongo;
import com.util.CommonUtil;

public class LogAspect {

	private LogMapper logMapper;
	private EmpMapper empMapper;
	
	public LogMapper getLogMapper() {
		return logMapper;
	}


	public void setLogMapper(LogMapper logMapper) {
		this.logMapper = logMapper;
	}


	public EmpMapper getEmpMapper() {
		return empMapper;
	}


	public void setEmpMapper(EmpMapper empMapper) {
		this.empMapper = empMapper;
	}


	public Object doAround(ProceedingJoinPoint pjp) throws Throwable {
    	// 获取目标方法名
        String methodName = pjp.getSignature().getName();  
        //获取目标方法所在的类名 
        String className = pjp.getSignature().getDeclaringTypeName();  
        className = className.substring(className.lastIndexOf(".") + 1).trim(); 
        if(className.indexOf("Emp") > -1){
        	className = "人员管理";
        }else if(className.indexOf("Dept") > -1){
        	className = "部门管理";
        }else if(className.indexOf("Generator") > -1){
        	className = "机房管理";
        }else if(className.indexOf("Limit") > -1){
        	className = "权限管理";
        }else if(className.indexOf("Log") > -1){
        	className = "日志管理";
        }
        HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest(); 
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        int id = user.getid();
        Emp emp = empMapper.selectOneEmp(id);
        Date operatetime = new Date();
        Log log = (Log)CommonUtil.getBean("log");
        log.setManagerId(id);
        log.setManagerName(emp.getEname());
        log.setVisitModel(className);
        log.setAction(methodName);
        log.setOperatetime(operatetime);
        logMapper.addLog(log);
        //mongodb记录日志信息
//        Mongo mongo = new Mongo("localhost", 27017);
//		DB db = mongo.getDB("cmeo");
//		DBCollection collection = db.getCollection("log");
//		BasicDBObject document = new BasicDBObject();
//		document.put("ManagerId", id);
//		document.put("ManagerName", emp.getEname());
//		document.put("VisitModel", className);
//		document.put("Action", methodName);
//		document.put("Operatetime", operatetime);
//		collection.insert(document);
		return pjp.proceed();
	}


	
	public void doAfter(JoinPoint jp) {
		//获取目标方法所在的类名  下面两种方式获取的都是一样的值
//        String className = jp.getSignature().getDeclaringTypeName();  
        String targetName = jp.getTarget().getClass().getName();  
		//获取目标方法名
		String methodName = jp.getSignature().getName(); 
        Object[] arguments = jp.getArgs();  
        Class targetClass = null;
        try {
            targetClass = Class.forName(targetName);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }  
        Method[] methods = targetClass.getMethods();
        
        String desc = "";
        String module = "";
        for (Method method : methods) {  
            if (method.getName().equals(methodName)) {  
                Class[] clazzs = method.getParameterTypes();  
                if (clazzs!=null&&clazzs.length == arguments.length&&method.getAnnotation(OperLog.class)!=null) {  
                    desc = method.getAnnotation(OperLog.class).operDesc();
                    module = method.getAnnotation(OperLog.class).operModule();
                    break;  
                }  
            }  
        }
        HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest(); 
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        int id = user.getid();
        Emp emp = empMapper.selectOneEmp(id);
        Date operatetime = new Date();
        Log log = (Log)CommonUtil.getBean("log");
        log.setManagerId(id);
        log.setManagerName(emp.getEname());
        log.setVisitModel(module);
        log.setAction(desc);
        log.setOperatetime(operatetime);
        logMapper.addLog(log);
	}
	public void doBefore(JoinPoint jp) {
		//获取目标方法所在的类名 
        String className = jp.getSignature().getDeclaringTypeName();  
		//获取目标方法名
		String methodName = jp.getSignature().getName(); 
		//获取目标方法的参数
		Object[] obj= jp.getArgs();
		String args = "";
		for(int i = 0;i < obj.length;i++)
		{
			String temp = obj[i].toString();
			args += temp+",";
		}
		System.out.println("当前调用了"+className+"."+methodName+"()方法,参数为"+args);
	}
}
