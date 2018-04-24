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
    
    <title>机房查询结果</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link  rel="stylesheet" type="text/css" href="css/style.css"/>
<script language="JavaScript" src="js/jquery.js"></script>
<script language="JavaScript" src="js/pagecomm.js" charset="utf-8"></script>
<script language="JavaScript" src="js/DataShowManager.js" charset="utf-8"></script>
<script language="JavaScript" src="js/DemoData.js" charset="utf-8"></script>
</head>
<body style="margin:0">

<div id="MainHeader">
	<table border="0" cellspacing="0" cellpadding="0" class="MainTop">
	  <tr>
		<td  height="34" ><img src="img/Icon-7.png" class="Icon" /></td>
		<td width="72" >机房管理</td>
		<td width="30"><img src="img/Icon-8.png" class="Icon" /></td>
		<th>查询结果列表</th>
	  </tr>
	</table>
</div>
<div class="MainContent">


	<div class="ItemBlock">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="dateTable">
		  <thead>
			  <tr>
				<th width="12%">ID</th>
				<th width="14%">机房名称</th>
				<th width="12%">负责人</th>
				<th width="14%">所属部门</th>
				<th width="14%">地址</th>
				<th>备注</th>
			  </tr>
		  </thead>
		  <!--显示数据列表-->
		  <tbody  id="Tabledate"  class="dataContainer" datakey="GeneratorRoom_QueryList">
			<tr class="TableDetail1 template">
			<c:forEach items="${generatorList }" var="GeneratorRoom">
			<tr>
				<td>${GeneratorRoom.id}</td>
				<td>${GeneratorRoom.generatorName}</td>
				<td>${GeneratorRoom.managerId}</td>
				<td>${GeneratorRoom.dname}</td>
				<td>${GeneratorRoom.address}</td>
				<td>${GeneratorRoom.message}</td>
			</tr>
			</c:forEach>
				
		  </tr>
		  </tbody>
		</table>
	</div>
	<div class="buttonback2">
	<input name="" type="button" value="返回" class="Button_1" onclick="javascript:history.back()"/>	
	</div>
</div>

</body>
</html>
