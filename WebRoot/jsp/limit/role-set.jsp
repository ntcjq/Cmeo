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
<title>角色配置</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link  rel="stylesheet" type="text/css" href="css/style.css"/>
<script language="JavaScript" src="js/jquery.js"></script>
<script language="JavaScript" src="js/pagecomm.js" charset="utf-8"></script>
<script language="JavaScript" src="js/DataShowManager.js" charset="utf-8"></script>
<script language="JavaScript" src="js/DemoData.js" charset="utf-8"></script>

</head>
<%
String roleName=request.getParameter("roleName");
String module = request.getParameter("module");
module = module.substring(0,2);
%>
<body style="margin:0">
<input type="hidden" id="roleName" value="<%=roleName%>"/>
<div id="MainHeader">
	<table border="0" cellspacing="0" cellpadding="0" class="MainTop">
	  <tr>
		<td  height="34"><img src="img/Icon-7.png" class="Icon" /></td>
		<td width="72">角色管理</td>
		<td width="30"><img src="img/Icon-8.png" class="Icon" /></td>
		<th>角色配置</th>
	  </tr>
	</table>
</div>

<div class="MainContent">
	<div class="ItemBlock2">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="dateTable2"> 
		  <tr>
			<th width="80px">角色名称</th>
			<td width=""> 
			<input name="" type="text" class="txt1" value="<%=roleName %>" /></td>
		  </tr>
		  <tr class="TableStyle"><td colspan="2" style="text-align:center;">权限配置</td></tr>
		  <tr>
			<th><%=module %>管理</th>
			<td style="padding-left:8px; line-height:2.8em">
			<%if(!"日志".equals(module)){ %>
		    <input name="" type="checkbox" id="checkbox" value="新增<%=module %>" />新增<%=module %><br />
			<input name="" type="checkbox" id="checkbox" value="修改<%=module %>" />修改<%=module %><br />
			<input name="" type="checkbox" id="checkbox" value="删除<%=module %>" />删除<%=module %><br />
			<%} %>
			<%if("日志".equals(module) || "人员".equals(module) || "机房".equals(module)) {%>
			<input name="" type="checkbox" id="checkbox" value="查询<%=module %>" />查询<%=module %><br />
			<%} %>
			<%if("权限".equals(module)){ %>
			<input name="" type="checkbox" id="checkbox" value="权限配置" />权限配置<br />
			<%} %>
			</td>
		  </tr>
		</table>
	</div>
	<div class="buttonback2">
	<input name="" type="button" value="提交" id="setUp" class="Button_1" />	
	</div>
</div>

</body>
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
					url:"setUpLimitForRole.do",
					data:{"listString":listString,
						"roleName":$("#roleName").val()
					},
					success:function(data,textStatus)
					{
						var msg = data;
						if(msg == "true"){
							window.location.href="getAllRoles.do";
						}
					}
				});
			}else{
					alert("请选择要配置的权限");
			}
		});	
	});
	
</script>
</html>