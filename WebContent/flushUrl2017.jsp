<%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %><%@page language="java" import="com.itgd.utils.StringUtil"%>
<meta name="robots" content="noindex, nofollow" >
<%
	String chunksGet = StringUtil.isEmpty(request.getParameter("chunks"));
	
	if(!StringUtil.isBlank(chunksGet)) {		%>		
		<cache:flush scope="application" key="<%=chunksGet%>" />
		200
<%	} else {	%>
		Here is the URL: <%=chunksGet%> 
<%	}	%>