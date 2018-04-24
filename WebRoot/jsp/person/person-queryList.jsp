


<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>人员查询结果</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link  rel="stylesheet" type="text/css" href="css/style.css"/>
<script language="JavaScript" src="js/jquery.js"></script>
<script language="JavaScript" src="js/pagecomm.js" charset="utf-8"></script>
<script language="JavaScript" src="js/DataShowManager.js" charset="utf-8"></script>
<script language="JavaScript" src="js/DemoData.js" charset="utf-8"></script>
</head>
<body style="margin:0">
<form action="">
<div id="MainHeader">
	<table border="0" cellspacing="0" cellpadding="0" class="MainTop">
	  <tr>
		<td  height="34"><img src="img/Icon-7.png" class="Icon" /></td>
		<td width="72">人员管理</td>
		<td width="30"><img src="img/Icon-8.png" class="Icon" /></td>
		<th>查询结果列表</th>
	  </tr>
	</table>
</div>
<div class="MainContent"> 
	<div class="ItemBlock" style=" overflow: scroll;">
		<table  border="0" cellspacing="0" cellpadding="0" class="dateTable"  style="width:992px">
		  <thead>
			  <tr>
				<th width="60px">ID</th>
				<th width="100px">姓名</th>
				<th width="100px">所属部门</th>
				<th width="100px">人员类型</th>
				<th width="120px">电话</th>
				<th width="120px">电子邮件</th>
				<th width="120px">手机</th>
				<th width="120px">传真</th>
				<th width="120px">备注</th>
			  </tr>
		  </thead>
		  <!--显示数据列表-->
		  <tbody  id="Tabledate"  class="dataContainer" datakey="Person_QueryLIst">
			<tr class="TableDetail1 template">
			<c:forEach items="${empList }" var="Person">
				<tr>
					<td>${Person.empno}</td>
					<td>${Person.ename}</td>
					<td>${Person.dname}</td>
					<td>${Person.emptype}</td>
					<td>${Person.telephone}</td>
					<td>${Person.email}</td>
					<td>${Person.phone}</td>
					<td>${Person.fax}</td>
					<td>${Person.message}</td>
			   </tr>
		  </c:forEach>
		  </tr>
		  </tbody>
		</table>
	</div>
</div>
</form>
</body>
</html>
