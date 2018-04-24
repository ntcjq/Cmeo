<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
<title>日志查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link  rel="stylesheet" type="text/css" href="css/style.css"/>
<script language="JavaScript" src="js/jquery.js"></script>
<script language="JavaScript" src="js/pagecomm.js" charset="utf-8"></script>
<script type="text/javascript" src="js/laydate/laydate.js"></script>
</head>
<body style="margin:0">

	<div id="MainHeader">
		<table border="0" cellspacing="0" cellpadding="0" class="MainTop">
		  <tr>
			<td  height="34"><img src="img/Icon-7.png" class="Icon" /></td>
			<td width="72">日志管理</td>
			<td width="30"><img src="img/Icon-8.png" class="Icon" /></td>
			<th>日志查询</th>
		  </tr>
		</table>
	</div>
<form action="getLogListByConditions.do" method="post">
<div class="MainContent">

	<div class="ItemBlock2">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="dateTable2"> 
		  <tr >
			<th width="11%">日志ID</th>
			<td width="89%"> 
			<input name="id" type="text" class="txt1" value="" /></td>
		  </tr>
		  <tr>
			<th width="11%">人员ID</th>
			<td width="89%"> 
			<input name="managerId" type="text" class="txt1" value="" /></td>
		  </tr>
		  <tr>
			<th>访问的模块</th>
			<td>
			<select name="visitModel" class="SelectTxt" >
			<option value="">—请选择—</option>
			<option value="人员管理">人员管理</option>
			<option value="部门管理">部门管理</option>
			<option value="机房管理">机房管理</option>
			<option value="权限管理">权限管理</option>
			<option value="日志管理">日志管理</option>
			</select>
			</td>
		  </tr>
		  <tr>
			<th width="11%">开始时间</th>
			<td width="89%"> 
			<input name="startTime" type="text" class="txt1" value="" class="laydate-icon" onclick="laydate();"/></td>
		  </tr>
		  <tr>
			<th width="11%">结束时间</th>
			<td width="89%"> 
			<input name="endTime" type="text" class="txt1" value="" class="laydate-icon" onclick="laydate();"/></td>
		  </tr>
		</table>
	</div>
	<div class="buttonback2">
	<input name="" type="submit" value="搜索" class="Button_1" />	
	</div>
</div>
<input type="hidden" name="currentPage" value="1">
</form>

</body>
</html>