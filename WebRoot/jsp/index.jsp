<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <TITLE>中国移动电子运维系统</TITLE>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
<FRAMESET ROWS="92,*,18" FRAMESPACING="0" FRAMEBORDER="0" BORDER="0" bordercolor="#ECE9D8">
	<FRAME noresize NAME="TopMenu" SRC="jsp/top.jsp" TARGET="contents"  scrolling="no" />
	<frameset rows="*" cols="196,*" framespacing="0" frameborder="no" border="0" valign=middle>
		<FRAME  NAME="menu" SRC="jsp/left.jsp" TARGET="desktop"scrolling="no" noresize="NORESIZE"/>
		<FRAME noresize NAME="desktop" SRC="jsp/right.jsp" SCROLLING="yes" />
	</FRAMESET>
	<frame noresize name="Bottom" scrolling="no" src="jsp/bottom.jsp" />
</FRAMESET>
 
<NOFRAMES>
<BODY>

</BODY>
</NOFRAMES>

</HTML>
