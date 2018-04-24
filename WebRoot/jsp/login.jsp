<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>中国移动电子运维系统_用户登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link type="text/css" rel="stylesheet" href="css/login.css" />
<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
<script type="text/javascript">
// 	function checkNum(confirmCode){
// 		if(confirmCode.length == 4){
// 			$.ajax({
// 			    url: "checkValidateCode.do",
// 			    data: {confirmCode:confirmCode},
// 			    type:"get",
// 			    cache: false,
// 			    success: function (data) {
// 			        var msg = data;
// 			    	if(msg=="true"){
// 			    		$("#nike").css('display','');
// 			    		$("#tebu").css('display','none');
// 			    	}
// 			    	else{
// 			    		$("#tebu").css('display','');
// 			    		$("#nike").css('display','none');
// 			    	}
// 			    }
// 			});
// 		}
// 	}
	$(function(){
		$("#submit").click(function(){
			var confirmCode = $("#confirmCode").val();
			var id = $("#id").val();
			var password = $("#password").val();
			if(id == null || id ==""){
				alert("请输入用户名");
				return false;
			}
			if(password == null || password ==""){
				alert("请输入密码");
				return false;
			}
			if(confirmCode.length != 4){
				alert("请输入验证码");
			}else{
				$.ajax({
				    url: "checkValidateCode.do",
				    data: {confirmCode:confirmCode},
				    type:"get",
				    cache: false,
				    success: function (data) {
				        var msg = data;
				    	if(msg=="true"){
				    		$.ajax({
							    url: "checkLogin.do",
							    data: {'id':id,'password':password},
							    type:"post",
							    cache: false,
							    success: function (data) {
							        var msg = data;
							    	if(msg=="true"){
							    		window.location.href="jsp/index.jsp";
							    	}else{
							    		alert("用户名或密码错误");
							    	}
							    }
							});
				    	}
				    	else{
				    		alert("验证码错误");
				    	}
				    }
				});
			}
		});	
	});
</script>

</head>

<body>

<div class="LoginBack">

	<div class="loginpic"><img src="img/LoginBack2.png" /></div>
	
	<div class="LoginBox">
	<form>
			<table cellpadding="0" cellspacing="0" class="LoginBox_tab">
			   <tr>
				   <th>用户名</th>
				   <td colspan="2"><input type="text" id="id" name="id" value="1" class="textfield">	 </td>
				</tr>
				<tr>
					<th>密&nbsp;码</th>
				    <td colspan="2"><input type="password" id="password" name="password" value="1" class="textfield"></td>
				</tr>
				<tr>
					<th>验证码</th>
			      	<td><input type="text" id="confirmCode" value="abcd" name="confirmCode" class="textfield2" maxlength="4" /></td>
					<td><img alt="验证码" title="看不清,换一张" src="identifyingCode.do"
    					style="cursor: pointer;" onclick="this.src=this.src+'?'"/>
    				</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
					<input type="button" value=""  id="submit" class="Loginbotton">
					</td>
			  </tr>
		 </table>
	</form>
	</div>
</div>

</body>
</html>
