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
function changeDateFormat(cellval,format) {
    var time = new Date(parseInt(cellval.replace("/Date(", "").replace(")/", ""), 10));
    var t = new Date(time);
    var tf = function(i){return (i < 10 ? '0' : '') + i};
    return format.replace(/yyyy|MM|dd|HH|mm|ss/g, function(a){
        switch(a){
            case 'yyyy':
                return tf(t.getFullYear());
                break;
            case 'MM':
                return tf(t.getMonth() + 1);
                break;
            case 'mm':
                return tf(t.getMinutes());
                break;
            case 'dd':
                return tf(t.getDate());
                break;
            case 'HH':
                return tf(t.getHours());
                break;
            case 'ss':
                return tf(t.getSeconds());
                break;
        }
    })
}
function page(upOrDown){
	var currentPage = $("#currentPage").val();
	var currentPageInt = parseInt(currentPage);
	if(upOrDown == "下一页"){
		var pageCount = $("#pageCount").val();
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
	$.ajax({
		url:"getLogListByConditionsUseAjax.do",
		type:"post",
		data:$("#logList").serialize(),
		success:function(data,textStatus){
			var arr = new Array(4);
			arr = data.split(";");
			var list = arr[0];
			var json = eval(list);
			var mapStr = arr[1];
			var map = eval(mapStr);  
			$("#currentPageSpan").html(map[0].currentPage);
			$("#id").val(map[0].id);
			$("#managerId").val(map[0].managerId);
			$("#visitModel").val(map[0].visitModel);
			$("#startTime").val(map[0].startTime);
			$("#endTime").val(map[0].endTime);
			$("#currentPage").val(map[0].currentPage);
			var allCount = arr[2];
			$("#allCountSapn").html("共"+allCount+"条");
			var pageCount = arr[3];
			$("#pageCountSpan").html(pageCount);
			$("#pageCount").val(pageCount);
			var  result = "<tr class='TableDetail1 template'>";
            $.each(json, function (index, obj) {  
              var id = obj['id'];
              var managerId = obj['managerId'];
              var managerName = obj['managerName'];
              var visitModel = obj['visitModel'];
              var action = obj['action'];
              var timeObj = obj['operatetime'];
              var tempTime = timeObj['time'];
              var operatetime = changeDateFormat(tempTime.toString(),'yyyy-MM-dd HH:mm:ss');
              result = result + "<tr><td>"+id+"</td><td>"+managerId+"</td><td>"+managerName+"</td><td>"+visitModel+"</td><td>"+action+"</td><td>"+operatetime+"</td></tr><br/>";
              	
            });  
            result = result + "</tr>";
            $("#Tabledate").html("");
            $("#Tabledate").append(result);
		}
	});
}
	
function pageReduce(){
	var currentPage = $("#currentPage").val();
	var currentPageInt = parseInt(currentPage);
	if(currentPageInt <= 1){
		alert("已经是第一页");
		return false;
	}
	var currentPageInt = parseInt(currentPage) - 1;
	document.getElementById("currentPage").value = currentPageInt;
	$.ajax({
		url:"getLogListByConditionsUseAjax.do",
		type:"post",
		data:$("#logList").serialize(),
		success:function(data,textStatus){
			var arr = new Array(4);
			arr = data.split(";");
			var list = arr[0];
			var json = eval(list);
			var mapStr = arr[1];
			var map = eval(mapStr);  
			$("#currentPageSpan").html(map[0].currentPage);
			$("#id").val(map[0].id);
			$("#managerId").val(map[0].managerId);
			$("#visitModel").val(map[0].visitModel);
			$("#startTime").val(map[0].startTime);
			$("#endTime").val(map[0].endTime);
			$("#currentPage").val(map[0].currentPage);
			var allCount = arr[2];
			$("#allCountSapn").html("共"+allCount+"条");
			var pageCount = arr[3];
			$("#pageCountSpan").html(pageCount);
			$("#pageCount").val(pageCount);
			var  result = "<tr class='TableDetail1 template'>";
            $.each(json, function (index, obj) {  
              var id = obj['id'];
              var managerId = obj['managerId'];
              var managerName = obj['managerName'];
              var visitModel = obj['visitModel'];
              var action = obj['action'];
              var timeObj = obj['operatetime'];
              var tempTime = timeObj['time'];
              var operatetime = changeDateFormat(tempTime.toString(),'yyyy-MM-dd HH:mm:ss');
              result = result + "<tr><td>"+id+"</td><td>"+managerId+"</td><td>"+managerName+"</td><td>"+visitModel+"</td><td>"+action+"</td><td>"+operatetime+"</td></tr><br/>";
              	
            });  
            result = result + "</tr>";
            $("#Tabledate").html("");
            $("#Tabledate").append(result);
		}
	});
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
	<span id="allCountSapn">共${allCount}条</span>
	<input name="" type="button" value="上一页" class="Button_1" id="left" onclick="page(this.value);"/>
	<span id="currentPageSpan">${map.currentPage}</span>/<span id="pageCountSpan">${pageCount}</span>
	<input name="" type="button" value="下一页" class="Button_1" id="right" onclick="page(this.value);"/>
	<input name="" type="button" value="返回" class="Button_1" onclick="location.href='jsp/log/log-query.jsp'"/>	
	</div>
</div>
</form>
</body>
</html>