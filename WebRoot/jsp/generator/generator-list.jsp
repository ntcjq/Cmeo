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
    
    <title>机房管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link  rel="stylesheet" type="text/css" href="css/style.css"/>
<script language="JavaScript" src="js/pagecomm.js" charset="utf-8"></script>
<script language="JavaScript" src="js/DataShowManager.js" charset="utf-8"></script>
<script language="JavaScript" src="js/DemoData.js" charset="utf-8"></script>
<script language="JavaScript" src="js/jquery-2.1.0.js"></script>
<script type="text/javascript">
	$(function(){
		$("#checkAll").click(function() {
                $('input[name="checkbox"]').prop("checked",this.checked); 
        });
        var $checkbox = $("input[name='checkbox']");
        $checkbox.click(function(){
        $("#checkAll").prop("checked",$checkbox.length == $("input[name='checkbox']:checked").length ? true : false);
        });
		
		$("#generatorDelete").click(function(){
			var i = 0;
			var list = new Array();
			$("#checkbox:checked").each(function(){
				if($(this).is(':checked')){
					list[i] = this.value;
					i++;
				}
			}); 
			var length = list.length;
			alert(length);
			var listString = list.toString();
			alert(listString);
			if(length > 0)
			{
				$.ajax({
					type:"post",
					url:"removeGeneratorInfo.do",
					data:{
						"listString":listString
					},
					success:function(data,textStatus)
					{
						var msg = data;
						if(msg == "true"){
							window.location.href="getAllGenerators.do";
						}
					}
				});
			}else{
					alert("请选择要删除的机房");
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
		<td  height="34" ><img src="img/Icon-7.png" class="Icon" /></td>
		<td width="72" >机房管理</td>
		<td width="30"><img src="img/Icon-8.png" class="Icon" /></td>
		<th>机房列表</th>
	  </tr>
	</table>
</div>
<div class="MainContent">
	<div class="ItemBlock">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="dateTable">
		  <thead>
			  <tr>
				<th width="8%"><input type="checkbox" id="checkAll"> </th>
				<th width="18%">ID</th>
				<th width="22%">机房名称</th>
				<th width="18%">负责人</th>
				<th width="24%">所属部门</th>
				<%if(limitStr.indexOf("修改机房")>-1){ %>
				<th width="10%">操作</th>
				<%} %>
			  </tr>
		  </thead>
		  <!--显示数据列表-->
		  <tbody  id="Tabledate"  class="dataContainer" datakey="GeneratorRoom_List">
			<tr class="TableDetail1 template">
			<c:forEach items="${generatorList }" var="GeneratorRoom">
			<tr>
				<td><input name="checkbox" type="checkbox" id="checkbox" value="${GeneratorRoom.id}" /></td>
				<td>${GeneratorRoom.id}</td>
				<td>${GeneratorRoom.generatorName}</td>
				<td>${GeneratorRoom.managerId == 0 ? "无" : GeneratorRoom.managerId}</td>
				<td>${GeneratorRoom.dname}</td>
				<%if(limitStr.indexOf("修改机房")>-1){ %>
				<td><a href="getOneGenerator.do?id=${GeneratorRoom.id }&dname=${GeneratorRoom.dname}&managerId=${GeneratorRoom.managerId}">修改</a></td>
		 		<%} %>
		 	</tr>
		 	</c:forEach>
		  	</tr>
		  </tbody>
		</table>
	</div>
	<div class="buttonback">
	<%if(limitStr.indexOf("新增机房")>-1){ %>
	<input name="" type="button" value="新建" class="Button_1" onclick="location.href='getDeptListForAddGenerator.do'"/>
	<%} 
	if(limitStr.indexOf("删除机房")>-1){
	%>
	<input name="" type="button" value="删除" class="Button_1" id="generatorDelete"/>
	<%} %>
	</div>
</div>
</form>
</body>
</html>
