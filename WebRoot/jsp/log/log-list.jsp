<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
<title>日志管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link  rel="stylesheet" type="text/css" href="css/style.css"/>
<script language="JavaScript" src="js/jquery.js"></script>
<script language="JavaScript" src="js/pagecomm.js" charset="utf-8"></script>
<script language="JavaScript" src="js/DataShowManager.js" charset="utf-8"></script>
<script language="JavaScript" src="js/DemoData.js" charset="utf-8"></script>

<script type="text/javascript">
function page(upOrDown){
	var currentPage = "${map.currentPage}";
	var currentPageInt = parseInt(currentPage);
	if(upOrDown == "下一页"){
		var pageCount = "${pageCount}";
		var pageCountInt = parseInt(pageCount);
		if(currentPageInt >= pageCountInt){
			alert("已经是最后一页");
			return false;
		}
		currentPageInt = parseInt(currentPage) + 1;
	}else{
		if(currentPageInt <= 1){
			alert("已经是第一页");
			return false;
		}
		var currentPageInt = parseInt(currentPage) - 1;
	}
	document.getElementById("currentPage").value = currentPageInt;
	document.getElementById("logList").submit();
}
	
</script>
</head>
<body style="margin:0">
<form id="logList" action="getLogListByConditions.do" method="post">
<div id="MainHeader">
	<table border="0" cellspacing="0" cellpadding="0" class="MainTop">
	  <tr>
		<td  height="34" ><img src="img/Icon-7.png" class="Icon" /></td>
		<td width="72">日志管理</td>
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
				<th width="10%">日志ID</th>
				<th width="10%">管理员编号</th>
				<th width="10%">管理员姓名</th>
				<th width="15%">访问的模块</th>
				<th width="30%">进行的操作</th>
				<th width="25%">时间</th>
			  </tr>
		  </thead>
		  <!--显示数据列表-->
		  <tbody  id="Tabledate"  class="dataContainer" datakey="Daily_List">
			<tr class="TableDetail1 template">
			<c:forEach items="${logList }" var="log">
				<tr>
				<td>${log.id}</td>
				<td>${log.managerId}</td>
				<td>${log.managerName}</td>
				<td>${log.visitModel}</td>
				<td>${log.action}</td>
				<td><fmt:formatDate value="${log.operatetime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				</tr>
			</c:forEach>
		  </tr>
		  </tbody>
		</table>
	</div>
	<input type="hidden" value="${map.id}" name="id" id="id"/>
	<input type="hidden" value="${map.managerId}" name="managerId" id="managerId"/>
	<input type="hidden" value="${map.visitModel}" name="visitModel" id="visitModel"/>
	<input type="hidden" value="${map.startTime}" name="startTime" id="startTime"/>
	<input type="hidden" value="${map.endTime}" name="endTime" id="endTime"/>
	<input type="hidden" value="${map.currentPage}" name="currentPage" id="currentPage"/>
	<input type="hidden" value="${pageCount}"  id="pageCount"/>
	<div class="buttonback">
	共${allCount}条
	<input name="" type="button" value="上一页" class="Button_1" id="left" onclick="page(this.value);"/>
	${map.currentPage}/${pageCount}
	<input name="" type="button" value="下一页" class="Button_1" id="right" onclick="page(this.value);"/>
	<input name="" type="button" value="返回" class="Button_1" onclick="location.href='jsp/log/log-query.jsp'"/>	
	</div>
</div>
</form>
</body>
</html>