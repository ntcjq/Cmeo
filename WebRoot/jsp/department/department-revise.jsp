<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
  <title>部门信息修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link  rel="stylesheet" type="text/css" href="css/style.css"/>
<script language="JavaScript" src="js/jquery.js"></script>
<script language="JavaScript" src="js/pagecomm.js" charset="utf-8"></script>
<script language="JavaScript" src="js/DataShowManager.js" charset="utf-8"></script>
<script language="JavaScript" src="js/DemoData.js" charset="utf-8"></script>
</head>
<body style="margin:0">
<form action="modifyDeptInfo.do" method="post">
<input type="hidden"  name="deptno" value="${deptInfo.deptno }"/>
<div id="MainHeader">
		<table border="0" cellspacing="0" cellpadding="0" class="MainTop">
		  <tr>
			<td  height="34"><img src="img/Icon-7.png" class="Icon" /></td>
			<td width="72">部门管理</td>
			<td width="30"><img src="img/Icon-8.png" class="Icon" /></td>
			<th>修改部门信息</th>
		  </tr>
		</table>
</div>

<div class="MainContent">

	<div class="ItemBlock2">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="dateTable2"> 
		  <tr class="dataContainer" datakey="department_Info">
			<th width="10%">部门名称</th>
			<td width="90%" class="TableDetail1 template"> 
			<input name="dname" type="text" class="txt1" value="${deptInfo.dname }" /></td>
		  </tr>
		  <tr class="dataContainer" datakey="department_Info">
			<th>管理人</th>
			<td class="TableDetail1 template">
			<select name="manager" class="SelectTxt" >
			<option value="${deptInfo.manager }">${managerName }</option>
			<c:forEach items="${emplist }" var="emp">
				<option value="${emp.empno}">${emp.ename}</option>
			</c:forEach>
			</select>
			</td>
		  </tr>
		  <tr class="dataContainer" datakey="department_Info">
			<th>电话</th>
			<td class="TableDetail1 template"> <input name="phone" type="text" class="txt1"  value="${deptInfo.phone }"/></td>
		  </tr>
		  <tr class="dataContainer" datakey="department_Info">
			<th>手机</th>
			<td class="TableDetail1 template"> <input name="telephone" type="text" class="txt1" value="${deptInfo.telephone }" /></td>
		  </tr>
		  <tr class="dataContainer" datakey="department_Info">
			<th>传真</th>
			<td class="TableDetail1 template"> <input name="fax" type="text" class="txt1" value="${deptInfo.fax }" /></td>
		  </tr>
		  <tr class="dataContainer" datakey="department_Info">
			<th>备注</th>
			<td class="TableDetail1 template"> <input name="message" type="text" class="txt1" value="${deptInfo.message }" /></td>
		  </tr>
		</table>
	</div>
	<div class="buttonback2">
	<input type="submit" name="" value="提交" class="Button_1" />	
	</div>
</div>
</form>	
</body>
</html>
