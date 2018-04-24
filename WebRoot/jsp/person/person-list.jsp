<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    
    <title>人员管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link  rel="stylesheet" type="text/css" href="css/style.css"/>
<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
<script language="JavaScript" src="js/pagecomm.js" charset="utf-8"></script>
<script language="JavaScript" src="js/DataShowManager.js" charset="utf-8"></script>
<script language="JavaScript" src="js/DemoData.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		$("#deleteEmp").click(function(){
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
					url:"removeEmpInfo.do",
					data:{
						"listString":listString
					},
					success:function(data,textStatus)
					{
						var msg = data;
						if(msg == "true"){
							window.location.href="getAllEmps.do";
						}
					}
				});
			}else{
					alert("请选择要删除的人员");
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
		<td width="72">人员管理</td>
		<td width="30" ><img src="img/Icon-8.png" class="Icon" /></td>
		<th>人员列表</th>
	  </tr>
	</table>
</div>
<div class="MainContent">

	<div class="ItemBlock">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="dateTable">
		  <thead>
			  <tr>
				<th width="10%"> </th>
				<th width="18%">ID</th>
				<th width="18%">姓名</th>
				<th width="18%">所属部门</th>
				<th width="18%">人员类型</th>
				<%if(limitStr.indexOf("修改人员")>-1){ %>
				<th width="18%">操作</th>
				<%} %>
			  </tr>
		  </thead>
		  <!--显示数据列表-->
		  <tbody  id="Tabledate"  class="dataContainer" datakey="Person_List">
			<tr class="TableDetail1 template">
			<c:forEach items="${empList }" var="emp">
			<tr>
				<td><input name="checkbox" id="checkbox" type="checkbox" value="${emp.empno }" /></td>
				<td>${emp.empno }</td>
				<td>${emp.ename }</td>
				<td>${emp.dname }</td>
				<td>${emp.emptype }</td>
				<%if(limitStr.indexOf("修改人员")>-1){ %>
				<td><a href="getOneEmp.do?empno=${emp.empno }">修改</a></td>
				<%} %>
			</tr>
			</c:forEach>
			</tr>
		  </tbody>
		</table>
	</div>
	<div class="buttonback">
	<%if(limitStr.indexOf("新增人员")>-1){ %>
	<input name="" type="button" value="新建" class="Button_1" onclick="window.location.href='getDeptListForAddEmp.do'"/>
	<%} 
	if(limitStr.indexOf("删除人员")>-1){ %>
	<input name="" type="button" value="删除" class="Button_1"  id="deleteEmp"/>
	<%} %>
	</div>
</div>
</form>
</body>
</html>