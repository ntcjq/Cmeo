<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<title>导航菜单</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script language="JavaScript" src="script/menu.js"></script>
	<script language="JavaScript" type="text/javascript" src="js/jquery.js"></script>
	<link type="text/css" rel="stylesheet" href="css/menu.css" />
	
	<script type="text/javascript">
		var basePath = "";
		var SubImg = basePath + 'img/MenuIcon-1.jpg';
		var SubImgOpen = basePath + 'img/MenuIcon-2.jpg';
		$(function(){
		   var $level1=$(".level1 .level1Style");
		   var $showlevel1=$(".level1 .MenuLevel2");
		   $level1.each(function(index){
		   $(this).click(function(){
		     if(!$(this).is(":animated")){
		    
		      $showlevel1.eq(index+1).slideToggle("normal").end()
			  .not($showlevel1[index+1]).slideUp("normal");  
			    };
			  });
			
		  });
		});
	</script>

<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".MenuLevel2 li a").click(function(){
		$(".MenuLevel2 li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
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

<body style="margin: 0px;">
<div id="Menu" >
	<ul id="MenuUl">
	
	   <li class="level1">
			<div onClick="menuClick(this);"  class="level1Sty"></div>
			<ul style="display: none;"  class="MenuLevel2">	</ul>
		</li>
		
		<!--人员管理-->
        <li class="level1" >
			<div onClick="menuClick(this);" class="level1Style">
				<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<td width="58px"><img src="img/Icon-3.jpg" class="Icon" /></td>
					<td class="level1Title">人员管理</td>
					<td><img src="img/Icon.jpg" class="_img" /></td>
				  </tr>
				</table>
			</div>
			<ul style="display: none;" class="MenuLevel2">				
				<li class="level2">
					<a target="desktop" href="getAllEmps.do"><div class="level2Style">人员信息</div></a>
				</li>
				<%if(limitStr.indexOf("查询人员")>-1){ %>
				<li class="level2">
					<a target="desktop" href="getDeptListForQueryEmp.do"><div class="level2Style">人员查询</div></a>
				</li>
				<%} %>
			</ul>
		</li>
		
		<!--部门管理-->
        <li class="level1" >
			<div onClick="menuClick(this);" class="level1Style">
				<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<td width="58px"><img src="img/Icon-1.jpg" class="Icon" /></td>
					<td class="level1Title">部门管理</td>
					<td><img src="img/Icon.jpg" class="_img" /></td>
				  </tr>
				</table>
			</div>
			<ul style="display: none;" class="MenuLevel2">				
				<li class="level2">
					<a target="desktop" href="getAllDepts.do"><div class="level2Style">部门信息</div></a>
				</li>
			</ul>
		</li>
		
		<!--机房管理-->
        <li class="level1" >
			<div onClick="menuClick(this);" class="level1Style">
				<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<td width="58px"><img src="img/Icon-2.jpg" class="Icon" /></td>
					<td class="level1Title">机房管理</td>
					<td><img src="img/Icon.jpg" class="_img" /></td>
				  </tr>
				</table>
			</div>
			<ul style="display: none;" class="MenuLevel2">				
				<li class="level2">
					<a target="desktop" href="getAllGenerators.do"><div class="level2Style">机房信息</div></a>
				</li>
				<%if(limitStr.indexOf("查询机房")>-1){ %>
				<li class="level2">
					<a target="desktop" href="getEmpAndDeptListForQueryGenerator.do"><div class="level2Style">机房查询</div></a>
				</li>
				<%} %>
			</ul>
		</li>
		
		
		
		<!--权限管理-->
        <li class="level1" >
			<div onClick="menuClick(this);" class="level1Style">
				<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<td width="58px"><img src="img/Icon-4.jpg" class="Icon" /></td>
					<td class="level1Title">权限管理</td>
					<td><img src="img/Icon.jpg" class="_img" /></td>
				  </tr>
				</table>
			</div>
			<ul style="display: none;" class="MenuLevel2">				
				<li class="level2">
					<a target="desktop" href="getAllRoles.do"><div class="level2Style">角色管理</div></a>
				</li>
				<%if(limitStr.indexOf("权限配置")>-1){ %>
				<li class="level2">
					<a target="desktop" href="getAllEmpsInLimitModule.do"><div class="level2Style">权限配置</div></a>
				</li>
				<%} %>
			</ul>
		</li>
		<%if(limitStr.indexOf("查询日志")>-1){ %>
		<!--日志门管理-->
        <li class="level1" >
			<div onClick="menuClick(this);" class="level1Style">
				<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<td width="58px"><img src="img/Icon-5.jpg" class="Icon" /></td>
					<td class="level1Title">日志管理</td>
					<td><img src="img/Icon.jpg" class="_img" /></td>
				  </tr>
				</table>
			</div>
			<ul style="display: none;" class="MenuLevel2">				
				<li class="level2">
					<a target="desktop" href="jsp/log/log-query.jsp"><div class="level2Style">日志查询</div></a>
				</li>
			</ul>
		</li>
		<%} %>
		<!--字典管理-->
		<!-- 
        <li class="level1" >
			<div onClick="menuClick(this);" class="level1Style">
				<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<td width="58px"><img src="img/Icon-6.jpg" class="Icon" /></td>
					<td class="level1Title">字典管理</td>
					<td><img src="img/Icon.jpg" class="_img" /></td>
				  </tr>
				</table>
			</div>
			<ul style="display: none;" class="MenuLevel2">				
				<li class="level2">
					<a target="desktop" href="Dictionary/DictionaryType_List.html"><div class="level2Style">字典类型管理</div></a>
				</li>
				<li class="level2">
					<a target="desktop" href="Dictionary/DictionaryContent_List.html"><div class="level2Style">字典内容管理</div></a>
				</li>
				<li class="level2">
					<a target="desktop" href="Dictionary/Dictionary-Query.html"><div class="level2Style">字典查询</div></a>
				</li>
			</ul>
		</li>
		 -->
	</ul>

</div>
</body>
</html>
