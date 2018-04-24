<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext,org.springframework.context.ApplicationContext" %>
<%@ page import="com.limit.mapper.LimitMapper,com.entity.*,javax.servlet.http.HttpSession" %>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
<title>权限配置</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link  rel="stylesheet" type="text/css" href="css/style.css"/>
<script language="JavaScript" src="js/jquery.js"></script>
<script language="JavaScript" src="js/pagecomm.js" charset="utf-8"></script>
<script language="JavaScript" src="js/DataShowManager.js" charset="utf-8"></script>
<script language="JavaScript" src="js/DemoData.js" charset="utf-8"></script>
</head>
<%
User user = (User)session.getAttribute("user");
String configPath="classpath:xml/spring/applicationContext.xml";
ApplicationContext ctx=new ClassPathXmlApplicationContext(configPath);
//ApplicationContext ctx = new FileSystemXmlApplicationContext("/WebRoot/WEB-INF/applicationContext.xml"); 
LimitMapper limitMapper=ctx.getBean("limitMapper",LimitMapper.class);
EmpLimit empLimit = limitMapper.selectOneEmpLimit(user.getid());
String limitStr = "";
if(empLimit != null){
	limitStr = empLimit.getAllLimit();
}else{
	response.sendRedirect("jsp/error.jsp");
}
%>
<body style="margin:0">
<form action="">
<div id="MainHeader">
	<table border="0" cellspacing="0" cellpadding="0" class="MainTop">
	  <tr>
		<td  height="34"><img src="img/Icon-7.png" class="Icon" /></td>
		<td width="72">权限配置</td>
		<td width="30"><img src="img/Icon-8.png" class="Icon" /></td>
		<th>管理员列表</th>
	  </tr>
	</table>
</div>

<div class="MainContent">
	
	<div class="ItemBlock">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="dateTable">
		  <thead>
			  <tr>
				<th width="28%">人员ID</th>
				<th width="32%">人员姓名</th>
				<th width="26%">操作</th>
			  </tr>
		  </thead>
		  <!--显示数据列表-->
		  <tbody  id="Tabledate"  class="dataContainer" datakey="Power_List">
		 
				<tr class="TableDetail1 template">
				 <c:forEach items="${empList }" var="emp"> 
				 <tr>
					<td>${emp.empno}</td>
					<td>${emp.ename}</td>
					<td><a href="getAllRolesForSetUp.do?empno=${emp.empno}&ename=${emp.ename}">配置</a></td>
				 </tr>
				 </c:forEach>
		  </tr>
		 
		  </tbody>
		</table>
	</div>
	<div class="buttonback">
	
	</div>
</div>
</form>
</body>
</html>