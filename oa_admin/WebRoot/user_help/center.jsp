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
	    
	 	<div class="alert alert-info"   style="margin-top: 5px">

		 	<h6>中间为多标签工作区，可在不关闭当前页的情况下打开新页面，多个标签页之间可切换。	
			</h6>
 			

	 		
	 	</div>
	 	
	 	<div style="margin-top: 5px"> 
	        <img src="resource/images/user-help/center.png"/> 
	 		<img src="resource/images/user-help/center1.png"/> 
	  
	 	</div>
	 </div>

</body>
</html>
	   