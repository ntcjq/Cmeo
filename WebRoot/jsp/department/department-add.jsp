<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
  	<title>新增部门</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link  rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<body style="margin:0">

<div id="MainHeader">
	<table border="0" cellspacing="0" cellpadding="0" class="MainTop">
	  <tr>
		<td  height="34" style="text-align:right"><img src="img/Icon-7.png" class="Icon" /></td>
		<td width="72" style="text-align:right">部门管理</td>
		<td width="30" style="text-align:center"><img src="img/Icon-8.png" class="Icon" /></td>
		<th>新建部门</th>
	  </tr>
	</table>
</div>
<form action="createDept.do" method="post">
<div class="MainContent">
	
	<div class="ItemBlock2">
		
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="dateTable2">
		  <tr>
			<th width="10%">部门名称</th>
			<td width="90%"> <input value="" name="dname" type="text" class="txt1" />&nbsp;*</td>
		  </tr>
	
		  <tr>
			<th>手机</th>
			<td> <input value="" name="telephone" type="text" class="txt1" /></td>
		  </tr>
		   <tr>
			<th>电话</th>
			<td> <input value="" name="phone" type="text" class="txt1" /></td>
		  </tr>
		  <tr>
			<th>传真</th>
			<td> <input value="" name="fax" type="text" class="txt1" /></td>
		  </tr>
		  <tr>
			<th>备注</th>
			<td> <input value="" name="message" type="text" class="txt1" /></td>
		  </tr>
		</table>
		
	</div>
	<div class="buttonback2" align="center">
	<input type="submit" name="" value="确定" class="Button_1" />	
	</div>
</div>
</form>
</body>
</html>
