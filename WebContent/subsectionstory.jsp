<%@page language="java" import="java.util.*,com.mobile.dto.StoryDTO, com.mobile.util.*"%>


	<%
	String city="";
	ArrayList result = (ArrayList) session.getAttribute("data");
	if (result != null && result.size() > 0) {
	for (int i = 0; i < result.size(); i++) {
	StoryDTO story = (StoryDTO) result.get(i);
	city=story.getCity();	
	%>

	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%//@include file="googleanalytics_top.jsp"%>
<html>
<head>
<%@include file="googleanalytics.jsp"%> 
<META http-equiv="Content-Type" content="text/html;charset=iso-8859-1">

<title><%=story.getTitle()%></title>
<meta name="description" content="<%=story.getMetaDesc()%>" />
<meta name="keywords" content="<%=story.getMetaKey()%> " />
<link rel="stylesheet" href="css/mobile.css" type="text/css">
<%@include file="zedo-adCode-ros.jsp"%>
</head><body> 
<%@include file="zedo-adCode-ros-logo.jsp"%>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr><td align="left" valign="top"><%@ include file="topnav.jsp"%>
  <div align="center" style="margin-top:5px"> <%@include file="top_add.jsp" %> </div>

  </td></tr>
  
  
      <tr><td><table cellpadding="0" cellspacing="0" width="99%"><tr><td height="8"></td></tr>
      <tr><td class="breadcrumb"> <a href="home">HOME</a> &raquo; <a href="section?secid=<%=story.getSecId()%>"><%=story.getSecName()%></a> &raquo; Story</td></tr>
          <tr><td class="storyHeadline"><%= story.getTitle()%></td></tr>
          <tr><td height="5"></td></tr>
          <tr><td class="storystrap"><%=story.getByline()%><br>
          <%if(city!=null||!city.equals("")){ %>
          <%=story.getCreatedDate()%></td></tr>
          <%}else{ %>
           <%=story.getCity()%>, <%=story.getCreatedDate()%></td></tr>         
          <%} %>
          <tr><td height="8"></td></tr>
          <tr><td><%=story.getFulltext()%></td></tr>
  <tr><td height="8"></td></tr>
      <tr><td> More Stories from <a href="section?secid=<%=story.getSecId()%>" class="mobnormaltxt"><strong><%=story.getSecName()%></strong></a></td></tr><tr><td height="8"></td></tr></table></td></tr>

       <tr><td><%@ include file="othercategories.html"%></td></tr>
  <tr><td><%@include file="hotzone.html"%></td></tr>
  <tr><td><%@ include file="bottomnav.html"%></td></tr>

</table>
<%//@include file="googleanalytics_bottom.jsp"%>
</body>
</html>
	
	
	
	<%
		}
		}
	%>

