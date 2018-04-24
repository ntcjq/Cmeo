<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext,org.springframework.context.ApplicationContext" %>
<%@ page import="com.limit.mapper.LimitMapper,com.entity.*,javax.servlet.http.HttpSession" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
   <title>部门管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link  rel="stylesheet" type="text/css" href="css/style.css"/>
<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
<script language="JavaScript" src="js/pagecomm.js" charset="utf-8"></script>
<script language="JavaScript" src="js/DataShowManager.js" charset="utf-8"></script>
<script language="JavaScript" src="js/DemoData.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		$("#deleteDept").click(function(){
			var i = 0;
			var list = new Array();
			$("#checkbox:checked").each(function(){
				if($(this).is(':checked')){
					list[i] = this.value;
					i++;
				}
			}); 
			var length = list.length;
			var listString = list.toString();
			if(length > 0)
			{
				$.ajax({
					type:"post",
					url:"removeDeptInfo.do",
					data:{
						"listString":listString
					},
					success:function(data,textStatus)
					{
						var msg = data;
						if(msg == "true"){
							window.location.href="getAllDepts.do";
						}
					}
				});
			}else{
					alert("请选择要删除的部门");
			}
		});	
	});
</script>
</head>
<%
User user = (User)session.getAttribute("user");
String configPath="classpath:xml/spring/applicationContext.xml";
ApplicationContext ctx=new ClassPathXmlApplicationContext(configPath);
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
		<td  height="34" ><img src="img/Icon-7.png" class="Icon" /></td>
		<td width="72">部门管理</td>
		<td width="30"><img src="img/Icon-8.png" class="Icon" /></td>
		<th>部门列表</th>
	  </tr>
	</table>
</div>
<div class="MainContent">
	

	<div class="ItemBlock">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="dateTable">
		  <thead>
			  <tr>
				<th width="5%"> </th>
				<th width="19%">ID</th>
				<th width="39%">部门名称</th>
				<th width="23%">管理人</th>
				<%if(limitStr.indexOf("修改部门")>-1){ %>
				<th width="14%">操作</th>
				<%} %>
			  </tr>
		  </thead>
		  <!--显示数据列表-->
		  <tbody  id="Tabledate"  class="dataContainer" datakey="department_List">
			<tr class="TableDetail1 template">
			<c:forEach items="${deptList }" var="dept">
			<tr>
				<td><input name="checkbox" id="checkbox" type="checkbox" value="${dept.deptno}" /></td>
				<td>${dept.deptno}</td>
				<td>${dept.dname}</td>
				<td>${dept.manager}</td>
				<%if(limitStr.indexOf("修改部门")>-1){ %>
				<td><a href="getOneDept.do?deptno=${dept.deptno}&dname=${dept.dname}">修改</a></td>
				<%} %>
		  	</tr>
		  	</c:forEach>
		  	</tr>
		  </tbody>
		</table>
	</div>
	<div class="buttonback">
	<%if(limitStr.indexOf("新增部门")>-1){ %>
	<input name="" type="button" value="新建" class="Button_1" onclick="location.href='jsp/department/department-add.jsp'"/>
	<%}
	if(limitStr.indexOf("删除部门")>-1){
	%>
	<input name="" type="button" value="删除" class="Button_1" id="deleteDept" />
	<%} %>
	</div>
</div>
</form>
</body>
</html>
