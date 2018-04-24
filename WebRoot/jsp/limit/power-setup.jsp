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
<head>
<title>权限配置</title>
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
		<td  height="34"><img src="img/Icon-7.png" class="Icon" /></td>
		<td width="72">权限配置</td>
		<td width="30"><img src="img/Icon-8.png" class="Icon" /></td>
		<th>角色配置</th>
	  </tr>
	</table>
</div>

<div class="MainContent">
	<div class="ItemBlock2">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="dateTable2"> 
		  <tr>
			<th width="80px">用户ID</th>
			<td> <input name="" id="empno" type="text" class="txt1" value="${empno }" /></td>
		  </tr>
		  <tr>
			<th>用户名称</th>
			<td> <input name="" type="text" class="txt1" value="${ename }" /></td>
		  </tr>
		  <tr class="TableStyle"><td colspan="2" style="text-align:center;">角色列表</td></tr>
		  <tr>
			  <td colspan="2" style="padding-left:8px; line-height:2.8em">
			  <c:forEach items="${roleList }" var="role"> 
			  <input name="" id="checkbox"  type="checkbox" value="${role.roleName } " />&nbsp;${role.roleName }<br />
			  </c:forEach>
			  </td>
		  </tr>
		  
		</table>
	</div>
	<div class="buttonback2">
	<input name="" type="button" value="提交" class="Button_1" id="setUp"/>	
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$("#setUp").click(function(){
			var i = 0;
			var list = new Array();
			$("#checkbox:checked").each(function(){
				if($(this).is(':checked')){
					list[i] = this.value;
					i++;
				}
			}); 
			var length = list.length;
			var listString = list.toString();
			if(length > 0)
			{
				$.ajax({
					type:"post",
					url:"setUpRoleForEmp.do",
					data:{"listString":listString,
						"empno":$("#empno").val()
					},
					success:function(data,textStatus)
					{
						var msg = data;
						if(msg == "true"){
							window.location.href="getAllEmpsInLimitModule.do";
						}
					}
				});
			}else{
					alert("请选择要配置的角色");
			}
		});	
	});
	
</script>
</body>
</html>