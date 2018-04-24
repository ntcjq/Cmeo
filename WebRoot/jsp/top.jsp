<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <TITLE>top</TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="css/top.css"/>
	<link type="text/css" rel="stylesheet" href="css/icon.css"/>
	<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
	<script language="javascript" src="js/showtime.js"></script>

<script type="text/javascript">
function getparastr(strname)
{
var hrefstr,pos,parastr,para,tempstr;
hrefstr = window.parent.location.href;
pos = hrefstr.indexOf("?")
parastr = hrefstr.substring(pos+1);
para = parastr.split("&");
tempstr="";
for(i=0;i<para.length;i++)
{
tempstr = para[i];
pos = tempstr.indexOf("=");
if(tempstr.substring(0,pos) == strname)
{
return tempstr.substring(pos+1);
}
}
return null;
}
</script>
<script>
// 获取tr参数
var trs = getparastr("inputStr");
var tr=trs.slice(0,8);
</script>
</HEAD>

<BODY CLASS="PageBody" STYLE="margin: 0" onLoad="startTime()">

<form>
  <div id="Head">
    <div id="HeadTop">
      <div id="Head_logo"></div>
      <div id="Head_right">
      <div id="ShowTime"></div>
        <div id="right_show">
          <table cellpadding="0" cellspacing="0">
            <tr>
              <td align="center" style="width: 16px"><span class="ui-write person"></span></td>
              <td>${sessionScope.user.id}，您好!</td>
              <td align="center" style="width:16px">|</td>
              <td align="center" style="width: 16px"><span class="ui-write power"></span> </td>
              <td align="center"><a  href="loginOut.do" target="_parent">退出系统</a></td>
            </tr>
          </table>
        </div>
      </div>
    </div>
  </div>
</form>
</BODY>
</HTML>
