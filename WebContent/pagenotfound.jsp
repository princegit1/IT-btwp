<%@page language="java" import="java.net.*, java.util.ArrayList, com.itgd.utils.*, com.itgd.dto.*"%>
<%@include file="global_include.jsp"%>
<%@include file="googleanalytics_top.jsp"%>
<%String baseUrl = request.getRequestURL().substring(0,request.getRequestURL().indexOf(request.getServletPath()))+"/";	%>
<html>
<head>
<base href="<%=baseUrl%>"/>
<META http-equiv="Content-Type" content="text/html;charset=iso-8859-1">
<title>BT WAP</title>
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="css/mobile.css" type="text/css">
</head>
<body>
<%@ include file="topnav.jsp"%>
<div style="height: 12px;"></div>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr><td>Oops! Page not found...</td></tr>
<tr><td><br/>I want to go <a href="javascript:history.back();">BACK</a> from where I came</td></tr>
<tr><td>Open the <a href="<%=SITE_URL%>">homepage</a> for me</td></tr>
   
</table>
<%@ include file="bottomnav.html"%>
<%@include file="googleanalytics_bottom.jsp"%>		
</body>
</html>
