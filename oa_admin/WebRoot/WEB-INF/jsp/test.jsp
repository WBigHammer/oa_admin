<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp"%>
<%--
	模块：打印页面
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><c:out value="${requestScope.tableTitle }" />_打印</title>
<link href="favicon.ico" rel="SHORTCUT ICON" />
<style>
.print_table {
	width: 100%;
	font-size: 12px;
	line-height: 28px;
	font-family: "宋体", sans-serif;
	border-bottom: 1px solid #868686;
	border-right: 1px solid #868686;
	overflow-y: visible;
	overflow-x: scroll;
}

.print_title {
	font-size: 13px;
	font-weight: bold;
	line-height: 24px;
	font-family: "宋体";
	color: #000000;
	background-color: #b1b1b0;
	text-align: center;
	white-space: nowrap;
	border-top: 1px solid #868686;
	border-left: 1px solid #868686;
}

.print_result_td {
	color: #000000;
	line-height: 22px;
	white-space: nowrap;
	height: 10px;
	border-top: 1px solid #868686;
	border-left: 1px solid #868686;
}
</style>
</head>
<body>
	<div region="west" title="系统管理" style="width:220px; padding: 1px; ">

		<ul class="ul-menu">
			<li><a style="color: black;"><img
					src="resource/images/menu/yzsz.png" />&nbsp;&nbsp;个人设置</a>
			<ul class="ul-submenu">
					<li><a href="user/my/info.do" target="navTab" rel=""
						external="false" fresh="false" title="个人信息"><img
							src="resource/images/menu/grtxl.png" />&nbsp;&nbsp;个人信息</a></li>
					<li><a href="user/my/loginInfo.do?rel=grsz_dlgl"
						target="navTab" rel="grsz_dlgl" external="false" fresh="false"
						title="登陆管理"><img src="resource/images/menu/30.png" />&nbsp;&nbsp;登陆管理</a></li>
					<li><a href="log/login/my.do?rel=grbg_grse_log"
						target="navTab" rel="grbg_grse_log" external="false" fresh="false"
						title="登录日志"><img src="resource/images/menu/dlrz.png" />&nbsp;&nbsp;登录日志</a></li>
					<li><a href="user/updateMyPwPage.do?rel=grsz_xgmm"
						target="navTab" rel="grsz_xgmm" external="false" fresh="false"
						title="修改密码"><img src="resource/images/menu/18.png" />&nbsp;&nbsp;修改密码</a></li>
				</ul></li>
			<li><a style="color: black;"><img
					src="resource/images/menu/hysz.png" />&nbsp;&nbsp;系统日志</a>
			<ul class="ul-submenu">
					<li><a href="log/login.do?rel=xtrz_login_log" target="navTab"
						rel="xtrz_login_log" external="false" fresh="false" title="登录日志"><img
							src="resource/images/menu/30.png" />&nbsp;&nbsp;登录日志</a></li>
					<li><a href="log/action.do?rel=xtrz_action_log"
						target="navTab" rel="xtrz_action_log" external="false"
						fresh="false" title="操作日志"><img
							src="resource/images/menu/gz.png" />&nbsp;&nbsp;操作日志</a></li>
					<li><a href="tableCustom/load.do?type=1&rel=xtgl_dlrzzdysz"
						target="navTab" rel="xtgl_dlrzzdysz" external="false"
						fresh="false" title="登陆日志设置"><img
							src="resource/images/menu/yzsz.png" />&nbsp;&nbsp;登陆日志设置</a></li>
				</ul></li>
			<li><a style="color: black;"><img
					src="resource/images/menu/flow.gif" />&nbsp;&nbsp;组织机构</a>
			<ul class="ul-submenu">
					<li><a href="dept/load.do?rel=stgl_jg_bmgl" target="navTab"
						rel="stgl_jg_bmgl" external="false" fresh="false" title="部门管理"><img
							src="resource/images/menu/gstxl.png" />&nbsp;&nbsp;部门管理</a></li>
					<li><a href="user/load.do?rel=stgl_jg_yhgl" target="navTab"
						rel="stgl_jg_yhgl" external="false" fresh="false" title="用户管理"><img
							src="resource/images/menu/grsz.png" />&nbsp;&nbsp;用户管理</a></li>
					<li><a href="role/load.do?rel=stgl_jg_jsgl" target="navTab"
						rel="stgl_jg_jsgl" external="false" fresh="false" title="角色管理"><img
							src="resource/images/menu/Icon_10101_s.gif" />&nbsp;&nbsp;角色管理</a></li>
				</ul></li>
			<li><a href="menu/load.do?rel=xtgl_cdgl" target="navTab"
				rel="xtgl_cdgl" external="false" fresh="false" title="菜单管理"><img
					src="resource/images/menu/tpgl.png" />&nbsp;&nbsp;菜单管理</a></li>
			<li><a href="user/importUserPage.do?rel=xtgl_yhdr"
				target="navTab" rel="xtgl_yhdr" external="false" fresh="false"
				title="用户导入"><img src="resource/images/menu/gstxl.png" />&nbsp;&nbsp;用户导入</a></li>
			<li><a href="list/load.do?rel=xtgl_zdgl" target="navTab"
				rel="xtgl_zdgl" external="false" fresh="false" title="字典管理"><img
					src="resource/images/menu/13.png" />&nbsp;&nbsp;字典管理</a></li>
			<li><a href="district/load.do?superId=0&rel=xtgl_dqgl"
				target="navTab" rel="xtgl_dqgl" external="false" fresh="false"
				title="地区管理"><img src="resource/images/menu/31.png" />&nbsp;&nbsp;地区管理</a></li>
			<li><a href="user/onLineUsers/load.do?rel=stgl_zxrygl"
				target="navTab" rel="stgl_zxrygl" external="false" fresh="false"
				title="在线管理"><img src="resource/images/menu/25001_s.gif" />&nbsp;&nbsp;在线管理</a></li>
			<li><a href="database/load.do?rel=xtgl_sjkgl" target="navTab"
				rel="xtgl_sjkgl" external="false" fresh="false" title="数据库管理"><img
					src="resource/images/menu/1.png" />&nbsp;&nbsp;数据库管理</a></li>
			<li><a href="systemSet/updatePage.do?rel=xtgl_xtsz"
				target="navTab" rel="xtgl_xtsz" external="false" fresh="false"
				title="系统设置"><img src="resource/images/menu/22.png" />&nbsp;&nbsp;系统设置</a></li>
			<li><a href="tableCustom/dev/load.do?rel=xtgl_dydczdysz"
				target="navTab" rel="xtgl_dydczdysz" external="false" fresh="false"
				title="打印导出自定义管理"><img src="resource/images/menu/1_open.png" />&nbsp;&nbsp;打印导出自定义管理</a></li>
			<li><a href="servlet/info.do" target="navTab" rel="xtgl_fwqxx"
				external="true" fresh="false" title="服务器信息"><img
					src="resource/images/menu/fwqxx.png" />&nbsp;&nbsp;服务器信息</a></li>
			<li><a href="dataPer/load.do?rel=xtgl_sjqx" target="navTab"
				rel="xtgl_sjqx" external="false" fresh="false" title="数据权限管理"><img
					src="resource/images/menu/gz.png" />&nbsp;&nbsp;数据权限管理</a></li>
		</ul>

	</div>
	<!-- 中间-->
	[Menu [id=402881f73eb50cf5013eb5240c4f0014,
	superId=402881f73e39afbd013e39b48d2e0003, name=个人设置,
	icon=resource/images/menu/yzsz.png, url=, target=navTab, rel=,
	open=false, external=false, fresh=true, childrenMenus=[Menu
	[id=4028819242c5c8db0142c5d6ea840004,
	superId=402881f73eb50cf5013eb5240c4f0014, name=个人信息,
	icon=resource/images/menu/grtxl.png, url=user/my/info.do,
	target=navTab, rel=, open=false, external=false, fresh=false,
	childrenMenus=[]], Menu [id=4028819242c5c8db0142c5d8a9570008,
	superId=402881f73eb50cf5013eb5240c4f0014, name=登陆管理,
	icon=resource/images/menu/30.png,
	url=user/my/loginInfo.do?rel=grsz_dlgl, target=navTab, rel=grsz_dlgl,
	open=false, external=false, fresh=false, childrenMenus=[]], Menu
	[id=402881f73eb50cf5013eb524b30f0016,
	superId=402881f73eb50cf5013eb5240c4f0014, name=登录日志,
	icon=resource/images/menu/dlrz.png,
	url=log/login/my.do?rel=grbg_grse_log, target=navTab,
	rel=grbg_grse_log, open=false, external=false, fresh=true,
	childrenMenus=[]], Menu [id=402880e63f384d56013f384e413a0002,
	superId=402881f73eb50cf5013eb5240c4f0014, name=修改密码,
	icon=resource/images/menu/18.png,
	url=user/updateMyPwPage.do?rel=grsz_xgmm, target=navTab, rel=grsz_xgmm,
	open=false, external=false, fresh=true, childrenMenus=[]]]], Menu
	[id=402881f73e3fbaee013e3fefed61000c,
	superId=402881f73e39afbd013e39b48d2e0003, name=系统日志,
	icon=resource/images/menu/hysz.png, url=, target=navTab, rel=,
	open=false, external=false, fresh=true, childrenMenus=[Menu
	[id=402881f73e3fbaee013e3ff73351000e,
	superId=402881f73e3fbaee013e3fefed61000c, name=登录日志,
	icon=resource/images/menu/30.png, url=log/login.do?rel=xtrz_login_log,
	target=navTab, rel=xtrz_login_log, open=false, external=false,
	fresh=true, childrenMenus=[]], Menu
	[id=402881f73e3fbaee013e3ff7c58f0010,
	superId=402881f73e3fbaee013e3fefed61000c, name=操作日志,
	icon=resource/images/menu/gz.png,
	url=log/action.do?rel=xtrz_action_log, target=navTab,
	rel=xtrz_action_log, open=false, external=false, fresh=true,
	childrenMenus=[]], Menu [id=402881ea3f59ec45013f59ef5dc00004,
	superId=402881f73e3fbaee013e3fefed61000c, name=登陆日志设置,
	icon=resource/images/menu/yzsz.png,
	url=tableCustom/load.do?type=1&rel=xtgl_dlrzzdysz, target=navTab,
	rel=xtgl_dlrzzdysz, open=false, external=false, fresh=true,
	childrenMenus=[]]]], Menu [id=402881f73e3a15ee013e3a18f23b0002,
	superId=402881f73e39afbd013e39b48d2e0003, name=组织机构,
	icon=resource/images/menu/flow.gif, url=, target=, rel=, open=false,
	external=false, fresh=true, childrenMenus=[Menu
	[id=402881f73e3fbaee013e3fe8dae50002,
	superId=402881f73e3a15ee013e3a18f23b0002, name=部门管理,
	icon=resource/images/menu/gstxl.png, url=dept/load.do?rel=stgl_jg_bmgl,
	target=navTab, rel=stgl_jg_bmgl, open=false, external=false,
	fresh=true, childrenMenus=[]], Menu
	[id=402881f73e3fbaee013e3fe9a8e30004,
	superId=402881f73e3a15ee013e3a18f23b0002, name=用户管理,
	icon=resource/images/menu/grsz.png, url=user/load.do?rel=stgl_jg_yhgl,
	target=navTab, rel=stgl_jg_yhgl, open=false, external=false,
	fresh=true, childrenMenus=[]], Menu
	[id=402881f73e3fbaee013e3fedf99f0008,
	superId=402881f73e3a15ee013e3a18f23b0002, name=角色管理,
	icon=resource/images/menu/Icon_10101_s.gif,
	url=role/load.do?rel=stgl_jg_jsgl, target=navTab, rel=stgl_jg_jsgl,
	open=false, external=false, fresh=true, childrenMenus=[]]]], Menu
	[id=402881f73e3fbaee013e3ff93b470016,
	superId=402881f73e39afbd013e39b48d2e0003, name=菜单管理,
	icon=resource/images/menu/tpgl.png, url=menu/load.do?rel=xtgl_cdgl,
	target=navTab, rel=xtgl_cdgl, open=false, external=false, fresh=true,
	childrenMenus=[]], Menu [id=402881e4447b71d701447b7d240a0001,
	superId=402881f73e39afbd013e39b48d2e0003, name=用户导入,
	icon=resource/images/menu/gstxl.png,
	url=user/importUserPage.do?rel=xtgl_yhdr, target=navTab, rel=xtgl_yhdr,
	open=false, external=false, fresh=false, childrenMenus=[]], Menu
	[id=402881f73e3fbaee013e3ff8caf90014,
	superId=402881f73e39afbd013e39b48d2e0003, name=字典管理,
	icon=resource/images/menu/13.png, url=list/load.do?rel=xtgl_zdgl,
	target=navTab, rel=xtgl_zdgl, open=false, external=false, fresh=true,
	childrenMenus=[]], Menu [id=402881ea3f5b1d14013f5b1e92850002,
	superId=402881f73e39afbd013e39b48d2e0003, name=地区管理,
	icon=resource/images/menu/31.png,
	url=district/load.do?superId=0&rel=xtgl_dqgl, target=navTab,
	rel=xtgl_dqgl, open=false, external=false, fresh=true,
	childrenMenus=[]], Menu [id=40288192422c104401422c3f65370004,
	superId=402881f73e39afbd013e39b48d2e0003, name=在线管理,
	icon=resource/images/menu/25001_s.gif,
	url=user/onLineUsers/load.do?rel=stgl_zxrygl, target=navTab,
	rel=stgl_zxrygl, open=false, external=false, fresh=false,
	childrenMenus=[]], Menu [id=402881ef40a50a3e0140a50b5be80002,
	superId=402881f73e39afbd013e39b48d2e0003, name=数据库管理,
	icon=resource/images/menu/1.png, url=database/load.do?rel=xtgl_sjkgl,
	target=navTab, rel=xtgl_sjkgl, open=false, external=false, fresh=true,
	childrenMenus=[]], Menu [id=402881ec3f7960cb013f796260390002,
	superId=402881f73e39afbd013e39b48d2e0003, name=系统设置,
	icon=resource/images/menu/22.png,
	url=systemSet/updatePage.do?rel=xtgl_xtsz, target=navTab,
	rel=xtgl_xtsz, open=false, external=false, fresh=true,
	childrenMenus=[]], Menu [id=402881e63f502ae1013f502d7dff0002,
	superId=402881f73e39afbd013e39b48d2e0003, name=打印导出自定义管理,
	icon=resource/images/menu/1_open.png,
	url=tableCustom/dev/load.do?rel=xtgl_dydczdysz, target=navTab,
	rel=xtgl_dydczdysz, open=false, external=false, fresh=true,
	childrenMenus=[]], Menu [id=402881f73e3fbaee013e3ff9e8300018,
	superId=402881f73e39afbd013e39b48d2e0003, name=服务器信息,
	icon=resource/images/menu/fwqxx.png, url=servlet/info.do,
	target=navTab, rel=xtgl_fwqxx, open=false, external=true, fresh=true,
	childrenMenus=[]], Menu [id=4028819241cac1470141cac992200001,
	superId=402881f73e39afbd013e39b48d2e0003, name=数据权限管理,
	icon=resource/images/menu/gz.png, url=dataPer/load.do?rel=xtgl_sjqx,
	target=navTab, rel=xtgl_sjqx, open=false, external=false, fresh=false,
	childrenMenus=[]]]


</body>
</html>

