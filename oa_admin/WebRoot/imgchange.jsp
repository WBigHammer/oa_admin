<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.vstartek.dp.util.*" %>
<%@ page import="com.vstartek.dp.junit.*" %>
<%
 String type=request.getParameter("type");
 String vid=request.getParameter("vid");
 String sourcePath=request.getParameter("sourcePath");
 String picKey=request.getParameter("picKey");
 int isHander = Integer.parseInt(request.getParameter("isHander")==null?"0":request.getParameter("isHander"));
 boolean input= Boolean.parseBoolean(request.getParameter("input")==null?"false":request.getParameter("input"));
HandlerData hand   = new  HandlerData();
 %>
<%=hand.handerPoster(type,vid,sourcePath,picKey,isHander,input)%>
