<%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %>
<%@page language="java" import="java.util.*, java.sql.*, java.net.*, java.util.ArrayList, com.itgd.utils.*, com.itgd.dto.*"%>
<%@include file="../global_include.jsp"%>
<%@include file="global_include_budget.jsp"%>
<%
String contentId="";
if(request.getParameter("id")!=null) {
	contentId = request.getParameter("id");
}	
%>
<cache:cache key="<%=SITE_URL+"budget/story_highlights.jsp?id="+contentId%>" scope="application" time="600" refresh="t">
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<%@include file="../googleanalytics_top.jsp"%>
<html>
<head>
<meta name="robots" content="index, follow" />
<META http-equiv="Content-Type" content="text/html;charset=iso-8859-1">
<title>Business Today Budget 2014</title>
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="../css/mobile.css" type="text/css">
</head>
<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0"><tr>
	<td style="background-color: #d71920; height: 5px">
	</td>
</tr><tr><td align="left" valign="top" bgcolor="#FFFFFF"><a href="http://m.businesstoday.in/"><img src="http://media2.intoday.in/businesstoday/mobile/logo.jpg"  border="0" align="left" ></a></td></tr>      
<tr>



<td align="left" valign="middle" height="28px" background="images/bg.gif" style="padding: 0 0 0 5px; color: #FFFFFF" class="dtime">

<div style="float:left; margin-top:1px; line-height: 28px;">
<%	
java.util.Calendar currentDate = java.util.Calendar.getInstance();
java.text.SimpleDateFormat formatter=   new  java.text.SimpleDateFormat("MMM d | HH:mm");
String dateNow = formatter.format(currentDate.getTime());
out.println(dateNow+" IST"); %>
</div>

<div align="right" style="float:right">
<script type="text/javascript">
function toggleDiv(divId) { 
	$("#"+divId).toggle();
}
</script>
<div id="myContent" style="float: left;">
	<form action="http://m.businesstoday.in/search.jsp" method="get" name="search">
	<input class="sear" type="text" maxlength="40" onfocus="if(this.value=='search...') this.value='';" onblur="if(this.value=='') this.value='search...';" value="search..." class="textboxs" alt="search" name="searchword">        
	<input type="submit" value="" class="searchtop" name="submit">
	</form>
</div>


</tr></table>

<div style="height:8px;"></div>
<table cellpadding="0" cellspacing="0" width="100%">
<tr><td height="8" colspan="2"></td></tr>
<tr><td class="breadcrumb" colspan="2"><a href="<%=SITE_URL%>">HOME</a> &raquo; <a href="index.jsp">Budget 2014-15</a> &raquo; <%if(contentId.equals("207884")){	 out.print("Railway Budget");	} else if (contentId.equals("207984")){	out.print("Union Budget");	} %></td></tr>   
<tr><td class="storystrap">          
<%
int count=0;
StoryListDTO topobj = getHighlightsData(contentId);
int counter=0; 
int articleId=0;
String completeNews="";
try{
if (topobj!= null) {	
	articleId = topobj.getId();	
	//System.out.println(contentId);
	String words[]=topobj.getFullDescription().replaceAll("\\<.*?>","").split(" ");	
	for (int ii=0 ; ii < words.length ; ii++){ 
	   if (words[ii].contains("Highlight")) 
		  count += 1; 
	}  
	//System.out.println(count);
	for (int j=1 ; j <=count ; j++){ 
		String str=topobj.getFullDescription();    	
		int a1 = str.indexOf("Highlight"+j+":");		
		String aa = str.substring(a1, str.length());
		int a2 = aa.indexOf("#");
		String ab = aa.substring(0, a2);
		String tempStr = "Highlight "+j+":";		
		if (tempStr.equals("Highlight "+j+":")) {
			completeNews = ab.substring(ab.indexOf(tempStr)+ tempStr.length());	
			//out.println("<li>"+completeNews);
%> 
          <tr><td height="8"></td></tr>
          <tr><td width="2%" align="center" valign="top"><img src="../images/blue_squire_bullet.jpg" width="3" height="3" style="margin-top:7px;" /></td><td class="storytext"><%=completeNews.replaceAll("\\<.*?>","")%></td></tr>
<%	}}} }catch(Exception e){}%>
<tr><td height="8"></td></tr>
<tr><td class="more" colspan="2"><%if(contentId.equals("207884")){ %>Highlights from &raquo; <a href="story_highlights.jsp?id=207884">Railway Budget</a><% }else if (contentId.equals("207984")){%>Highlights from &raquo; <a href="story_highlights.jsp?id=207984">Union Budget</a><%} %>
</td></tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr height="1">
            <td height="1" style="border-top: solid 2px #c6c6c6"></td>
          </tr>
          <tr>
            <td class="copyright"><img src="http://media2.intoday.in/businesstoday/images/logo/footlogo.gif" border="0" align="left" hspace="5" alt="India Today Group" title="India Today Group">Copyright © 2014 Living Media India Limited.</td>
          </tr>
		  <tr height="1">
            <td height="1" bgcolor="#d71a20"></td>
          </tr>
</table>
<div style="float:left; width:100%"><%@include file="../googleanalytics_bottom.jsp"%></div>
</body>
</html>
</cache:cache> 