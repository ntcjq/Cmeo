<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Right</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link  rel="stylesheet" type="text/css" href="css/style.css"/>
<style type="text/css">
h1{
color:#025099;font-family:"Microsoft YaHei","微软雅黑","SimSun","宋体"; letter-spacing:2px;
}
</style>
	
</head>
<body style="margin:0">
<div id="MainHeader">
	<table border="0" cellspacing="0" cellpadding="0" class="MainTop">
	  <tr>
		<td  height="34"><img src="img/Icon-7.png" class="Icon" /></td>
		<td width="" >&nbsp;&nbsp;首页</td>
	  </tr>
	</table>
	
</div>
<div style=" padding:48px 8px">
	<marquee style="WIDTH: 100%;" onMouseOver="this.stop()" onMouseOut="this.start()" 
		scrollamount=3 scrolldelay=30 direction=left>
		<h1>欢迎登录中国电子运维系统</h1>
	</marquee>
</div>
<!--<div class="MainContent"></div>-->

</body>
</html>
