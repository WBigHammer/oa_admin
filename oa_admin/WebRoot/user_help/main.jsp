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
	     <div  class="well" style="margin-top: 5px">
	 		<h5>功能说明</h5>
	 		<ol >
	 			<li>顶部左侧为系统Logo。</li>
	 			<li>顶部右侧为系统工具，未读信息数量和当前时间显示区域。</li>
	 			<li>中间左侧有系统各项功能菜单，全部人员和当前在线人员列表。</li>
	 			<li>中间区域为多标签工作区间，默认显示首页。</li>
	 			<li>右下角为消息提醒，有消息时右下角会弹出提醒。</li>
	 		</ol>
	 		
	 		
	 	</div>
	     <div style="margin-top: 5px"> 
	        
	 		<img src="resource/images/user-help/main.png"/> 
	  
	 	</div>
	 	
	 	
	 
	 </div>

</body>
</html>
	   