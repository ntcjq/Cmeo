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
    
    <title>新增人员信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link  rel="stylesheet" type="text/css" href="css/style.css"/>
<script language="JavaScript" src="js/jquery.js"></script>
<script language="JavaScript" src="js/pagecomm.js" charset="utf-8"></script>
<script language="JavaScript" src="js/DataShowManager.js" charset="utf-8"></script>
<script language="JavaScript" src="js/DemoData.js" charset="utf-8"></script>
</head>
<body style="margin:0">
<form action="createEmp.do" method="post">
<div id="MainHeader">
	<table border="0" cellspacing="0" cellpadding="0" class="MainTop">
	  <tr>
		<td  height="34"><img src="img/Icon-7.png" class="Icon" /></td>
		<td width="72">人员管理</td>
		<td width="30" style="text-align:center"><img src="img/Icon-8.png" class="Icon" /></td>
		<th>新增人员信息</th>
	  </tr>
	</table>
</div>
<div class="MainContent">

	<div class="ItemBlock2">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="dateTable2"> 
		  <tr>
			<th width="10%">人员ID</th>
			<td width="23%"> 
			<input name="empno" type="text" class="txt3" value="" />&nbsp;*</td>
			
			<th width="10%">人员姓名</th>
			<td width="23%"> 
			<input name="ename" type="text" class="txt3" value="" />&nbsp;*</td>

			<th width="6%">密 码</th>
			<td width="28%"> 
			<input name="password" type="password" class="txt3" value="1" />&nbsp;*</td>
		  </tr>
		  <tr>
			<th>所属部门</th>
			<td>
			<select name="dname" class="SelectTxt" >
			<option value="">--请选择--</option>
			<c:forEach items="${deptlist }" var="dept">
				<option value="${dept.dname }">${dept.dname }</option>
			</c:forEach>
			</select>
			</td>

			<th>人员类型</th>
			<td colspan="3">
			<select name="emptype" class="SelectTxt" >
			<option value="">--请选择--</option>
			<option value="管理员">管理员</option>
			<option value="普通员工">普通员工</option>
			</select>
			</td>
		  </tr>
		  <tr>
			<th>电 话</th>
			<td> <input name="phone" type="text" class="txt3"  value=""/></td>

			<th>电子邮件</th>
			<td colspan="3"> <input name="email" type="text" class="txt3"  value=""/></td>
		  </tr>
		  <tr>
			<th>手 机</th>
			<td> <input name="telephone" type="text" class="txt3"  value=""/></td>

			<th>传 真</th>
			<td colspan="3"> <input name="fax" type="text" class="txt3"  value=""/></td>
		  </tr>
		  <tr>
			<th>备 注</th>
			<td colspan="5"><textarea name="message" cols="" rows="5" class="textarea_sty"></textarea></td>
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
