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
<title>角色管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link  rel="stylesheet" type="text/css" href="css/style.css"/>
<script language="JavaScript" src="js/jquery.js"></script>
<script language="JavaScript" src="js/pagecomm.js" charset="utf-8"></script>
<script language="JavaScript" src="js/DataShowManager.js" charset="utf-8"></script>
<script language="JavaScript" src="js/DemoData.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		$("#deleteRole").click(function(){
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
					url:"removeRole.do",
					data:{
						"listString":listString
					},
					success:function(data,textStatus)
					{
						var msg = data;
						if(msg == "true"){
							window.location.href="getAllRoles.do";
						}
					}
				});
			}else{
					alert("请选择要删除的角色");
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
		<td  height="34"><img src="img/Icon-7.png" class="Icon" /></td>
		<td width="72">角色管理</td>
		<td width="30"><img src="img/Icon-8.png" class="Icon" /></td>
		<th>人员列表</th>
	  </tr>
	</table>
</div>
<div class="MainContent">


	<div class="ItemBlock">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="dateTable">
		  <thead>
			  <tr>
				<th width="14%"> </th>
				<th width="28%">角色名称</th>
				<th width="32%">所属模块</th>
				<%if(limitStr.indexOf("修改权限")>-1){ %>
				<th width="26%">操作</th>
				<%} %>
			  </tr>
		  </thead>
		  <!--显示数据列表-->
		  <tbody>
		  <c:forEach items="${roleList }" var="role">
			<tr >
				<td><input name="checkbox" id="checkbox" type="checkbox" value="${role.roleName }" /></td>
				<td>${role.roleName }</td>
				<td>${role.module }</td>
				<%if(limitStr.indexOf("修改权限")>-1){ %>
				<td><a href="jsp/limit/role-set.jsp?roleName=${role.roleName}&module=${role.module}" >配置</a></td>
				<%} %>
		  </tr>
		  </c:forEach>
		  </tbody>
		</table>
	</div>
	<div class="buttonback">
	<%if(limitStr.indexOf("新增权限")>-1){ %>
	<input name="" type="button" value="新建" class="Button_1" onclick="location.href='jsp/limit/role-add.jsp'"/>
	<%} 
	if(limitStr.indexOf("删除权限")>-1){
	%>
	<input name="" type="button" value="删除" class="Button_1" id="deleteRole" />
	<%} %>
	</div>
</div>
</form>
</body>
</html>