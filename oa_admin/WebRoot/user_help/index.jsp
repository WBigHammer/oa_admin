<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<%@include file="/WEB-INF/jsp/commons/jstl_message_tld.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"	+ request.getServerName() + ":" + request.getServerPort()	+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title><fmt:message key="app.name" bundle="${commonBundle}"/>--使用说明</title>
	<link href="favicon.ico" rel="SHORTCUT ICON" />
	
	<link href="resource/js/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
	
	<%-- jquery --%>
	<script type="text/javascript" src="resource/js/jquery/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="resource/js/jquery/jquery.cookie.js"></script>
	
	<%-- easyui  --%>
	<link href="resource/js/easyui/themes/icon.css"  rel="stylesheet" type="text/css" media="screen" />
	<link id="easyuiTheme" href="resource/js/easyui/themes/<c:out value="${cookie.easyuiThemeName.value}" default="default"/>/easyui.css"  rel="stylesheet" type="text/css" media="screen" />
	<script type="text/javascript" src="resource/js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="resource/js/easyui/locale/easyui-lang-zh_CN.js"></script>
	
</head>
<body >
	<div id="sy_layout" class="easyui-layout" fit="true">
	
		<!-- 顶部-->
		<div  region="north" border="false"  style="height: 25px;overflow: hidden;" >
			<div  style="text-align: center;font-weight: bold;font-size: 14px;background-color: #3F9FD9;height: 100%;color: white;background-image: -moz-linear-gradient(center top , #61B0DF, #369BD7);vertical-align: middle;">
				系统使用帮助
			</div>
		</div>
		<!-- 左侧-->
		<div region="west" split="true"  title="" style="width:180px;">
			
				<ul class="nav nav-list" style="margin-left: 5px">
	               <li class="nav-header">功能概括</li>
	               <li ><a href="user_help/main.jsp" target="main">主界面</a></li>
	               <li ><a href="user_help/left.jsp" target="main">左侧菜单</a></li>
	               <li ><a href="user_help/center.jsp" target="main">工作区</a></li>
	             
	               <li >点播管理
	                 <ul>
	                   <li>视频管理
	                     <ul>
	                       <li>基本信息
	                         <ul>
	                           <li>电影</li>
                               <li>电视剧</li>
	                           <li>动漫</li>
	                           <li>纪录片</li>
	                         </ul>
	                       </li>
                           <li>海报管理</li>
	                     </ul>
	                   </li>
                       <li>信息合并</li>
	                   <li>综艺审核</li>
	                   <li>搜索热词</li>
	                   <li>专题管理
	                     <ul>
	                       <li>新建专题</li>
                           <li>专题维护</li>
	                     </ul>
	                   </li>
                     </ul>
	               </li>
	               <li>直播管理</li>
	               <li>推荐管理</li>
	               <li>网站管理</li>
	               <li>客户端</li>
	               <li>看客用户管理</li>
	               <li>系统管理</li>
	               <li class="nav-header">操作演示(以工作日志为例)</li>
	               <li ><a href="user_help/demo.jsp" target="main">1.打开日志</a></li>
	                <li ><a href="user_help/demo_jieshao.jsp" target="main">2.页面介绍</a></li>
	               <li ><a href="user_help/demo_add.jsp" target="main">3.添加日志</a></li>
	               <li ><a href="user_help/demo_show.jsp" target="main">4.查看日志</a></li>
	               <li ><a href="user_help/demo_update.jsp" target="main">5.修改日志</a></li>
	               <li ><a href="user_help/demo_delete.jsp" target="main">6.删除日志</a></li>
	            </ul>
			
	  </div>
		<!-- 中间-->
		<div id="mainPanle" region="center" style="overflow: hidden;" >
				
			<iframe width="100%" height="100%" src="user_help/main.jsp" name="main" frameborder="0"></iframe>
			
		</div>
		
		
		
	
	</div>
</body>
</html>