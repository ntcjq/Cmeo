<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page import="com.util.*,java.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
<title>新增角色</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link  rel="stylesheet" type="text/css" href="css/style.css"/>
<script language="JavaScript" src="js/jquery.js"></script>
<script language="JavaScript" src="js/pagecomm.js" charset="utf-8"></script>
<script language="JavaScript" src="js/DataShowManager.js" charset="utf-8"></script>
<script language="JavaScript" src="js/DemoData.js" charset="utf-8"></script>
</head>
<%
	Module module = (Module)CommonUtil.getBean("module");
	List<String> moduleList = module.getModuleList();
%>
<body style="margin:0">
<form action="createRole.do" method="post">
<div id="MainHeader">
	<table border="0" cellspacing="0" cellpadding="0" class="MainTop">
	  <tr>
		<td  height="34"><img src="img/Icon-7.png" class="Icon" /></td>
		<td width="72">角色管理</td>
		<td width="30"><img src="img/Icon-8.png" class="Icon" /></td>
		<th>新增角色</th>
	  </tr>
	</table>
</div>

<div class="MainContent">

	<div class="ItemBlock2">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="dateTable2"> 
		  <tr>
			<th width="10%">角色名称</th>
			<td width="90%"> 
			<input name="roleName" type="text" class="txt1" value="" /></td>
		  </tr>
		  <tr>
			<th>所属模块</th>
			<td>
			<select name="module" class="SelectTxt" >
			<%for(int i = 0;i < moduleList.size();i++ ){ %>
			<option><%=moduleList.get(i) %></option>
			<%} %>
			</select>
			</td>
		  </tr>
		</table>
	</div>
	<div class="buttonback2">
	<input name="" type="submit" value="提交" class="Button_1" />	
	</div>
</div>
</form>
</body>
</html>