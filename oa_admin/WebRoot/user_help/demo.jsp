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

		 	<h6>
		 		以工作日志的为例，演示系统的使用。
		 		其他功能模块操作相似，可参照此说明。
			</h6>
 			

	 		
	 	</div>
	 	<div style="margin-top: 5px"> 
	        <div  class="well" style="margin-top: 5px">
	       		 <span class="badge badge-warning">1</span> <span class="text-info">打开工作日志操作页面。</span>
	 		</div>
	  		<img src="resource/images/user-help/demo1.png"/>
	  		
	 	</div>
	 </div>

</body>
</html>
	   