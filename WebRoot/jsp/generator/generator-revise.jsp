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
    
    <title>机房信息修改</title>
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
		<th>修改机房信息</th>
	  </tr>
	</table>
</div>
<form action="modifyGeneratorInfo.do" method="post">
<input type="hidden" value="${generatorInfo.id }" name="id" > 
<input type="hidden" value="${generatorInfo.dname }" name="dname" >
<div class="MainContent">
	<div class="ItemBlock2">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="dateTable2"> 
		  <tr class="dataContainer" datakey="GeneratorRoom_Info">
			<th width="10%">机房名称</th>
			<td width="90%" class="TableDetail1 template"> 
			<input name="generatorName" type="text" class="txt1" value="${generatorInfo.generatorName}" /></td>
		  </tr>
		  <tr class="dataContainer" datakey="GeneratorRoom_Info">
			<th>负责人</th>
			<td class="TableDetail1 template">
			<select name="managerId" class="SelectTxt" >
			<option value="${generatorInfo.managerId}">${generatorInfo.managerId == 0 ? "--请选择--" : empinfo.ename}</option>
			<c:forEach items="${empList }" var="emp">
			<option value="${emp.empno }">${emp.ename}</option>
			</c:forEach>
			</select>
			</td>
		  </tr>
		  <%-- <tr class="dataContainer" datakey="GeneratorRoom_Info">
			<th>所属部门</th>
			<td class="TableDetail1 template">
			<select name="dname" class="SelectTxt" >
			<option>${GeneratorRoom.Department}</option>
			<option>财务部</option>
			<option>后勤部</option>
			<option>财务部</option>
			</select>
			</td>
		  </tr> --%>
		  <tr class="dataContainer" datakey="GeneratorRoom_Info">
			<th>地址</th>
			<td class="TableDetail1 template"> <input name="address" type="text" class="txt1"  value="${generatorInfo.address}"/></td>
		  </tr>
		  <tr class="dataContainer" datakey="GeneratorRoom_Info">
			<th>备注</th>
			<td class="TableDetail1 template"> <input name="message" type="text" class="txt1" value="${generatorInfo.message}" /></td>
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
