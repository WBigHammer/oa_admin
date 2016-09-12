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

		 	<h6>左侧为系统导航区域，有系统菜单列表，在线人员，全部人员列表。
			</h6>
 			

	 		
	 	</div>
	 	<div style="margin-top: 5px"> 
	        <img src="resource/images/user-help/left.png"/> 
	 		<img src="resource/images/user-help/online.png"/> 
	  		<img src="resource/images/user-help/allusers.png"/> 
	  		
	  		
	  		<img src="resource/images/user-help/left1.png"/>
	  		
	 	</div>
	 </div>

</body>
</html>
	   