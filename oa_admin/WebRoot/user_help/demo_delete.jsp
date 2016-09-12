<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML >
<html lang="en">
<head>
  	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="resource/js/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
    
</head>

<body>
	 <div style="width: 98%;height: 100%;margin: 0 auto;">
	    
	 	<div style="margin-top: 5px"> 
	        
	  		<div  class="well" style="margin-top: 5px">
	       		 <span class="badge badge-warning">6</span> <span class="text-info">删除日志。</span>
	 		</div>
	  		<img src="resource/images/user-help/demo7.png"/>
	 	</div>
	 </div>

</body>
</html>
	   