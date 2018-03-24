<%@ page language="java" import="java.util.*, com.mobile.util.*,java.sql.*, com.mobile.util.dbConn" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="googleanalytics_top.jsp"%>
<html>
<head>
<META http-equiv="Content-Type" content="text/html;charset=iso-8859-1">
<title>IT WAP site</title>
<link rel="stylesheet" href="css/mobile.css" type="text/css">
</head>
<body>
<%@ include file="topnav.jsp"%>
	<table cellpadding="0" cellspacing="0" width="100%" style="margin:10px 0 0 0;">
    <tr><td height="8"></td></tr>
    <tr><td class="breadcrumb"> <a href="home">HOME</a> &raquo; Comment</td></tr>
 <%
String storyId = request.getParameter("storyid");	
String secId = request.getParameter("secid");	
String name = request.getParameter("NAME");
String email = request.getParameter("EMAIL");
int displayEmail = Integer.parseInt(request.getParameter("disp_email"));
String location = request.getParameter("Location");
String comment = request.getParameter("message");
int insertStatus1 = 0;
String url = request.getHeader("referer");
String spath=request.getServerName();
int val=0;
val= spath.indexOf("www.");
if(val != -1)
{
   spath=spath.replaceFirst("www.","");
}
int domain=url.indexOf(spath); 
if(domain != -1)
{
	Connection cn=null;
	PreparedStatement pstmt1 = null;
	ResultSet rs = null;
	dbConn adminConn = null;
	adminConn = dbConn.getInstance();
	cn = adminConn.getConnection();
	try
	{
		String sql1="INSERT INTO itoday.quinfo (name,email,answer,ques,status,date) VALUES(?,?,?,?,'N',now())";
		PreparedStatement pstmt = cn.prepareStatement(sql1);
		pstmt.setString(1,name);
		pstmt.setString(2,email);
		pstmt.setString(3,comment);
		pstmt.setString(4,storyId);
			
		//out.println(sql1);
		insertStatus1=pstmt.executeUpdate();
		if(insertStatus1 > 0 )
		{
%>
			<tr><td style="font:bold 12px arial;line-height: 16px; text-transform: uppercase;" align="center">have your say</td></tr><tr><td valign="top"  style="font:normal 12px arial;line-height: 14px;"><center><br><br><font color='#D71D11' style='font-family:Arial; font-size:12px'><b>Thank you for sharing your comments with us.</b></font><br><br>Please note that all your comments, feedback and suggestions are published on our <br />websites unless found libellous, inciteful, defamatory, vulgar, pornographic and <br/>abusive.<br /> <br/>We also like to specify that the comments are views of the surfers alone and do not<br/> necessarily reflect those of the India Today Group.<br><br></td></tr>
<%
		}
		else {
%>
			<tr><td style="font:bold 12px arial;line-height: 16px; text-transform: uppercase;" align="center">have your say</td></tr><tr><td valign="top"  style="font:normal 12px arial;line-height: 14px;">There is some problem in inserting the comment, please try after some time.<br><br></td></tr>
<%
		}
	}
	catch(Exception e)
	{
		System.out.println("Mobile Save Comment -"+e.toString());
	}
	finally
	{
		if(pstmt1 != null)
			pstmt1.close();
		if(rs != null)
			rs.close();
		if(cn != null)
			cn.close();
	}
} else {%>
			<tr><td style="font:bold 12px arial;line-height: 16px; text-transform: uppercase;" align="center">have your say</td></tr><tr><td valign="top"  style="font:normal 12px arial;line-height: 14px;"><b>Not a Vaild Domain</b><br><br></td></tr>
<% 
}
%>
	<tr><td height="15px"></td></tr>
	<tr><td align="center"><a href="story?sid=<%=storyId%>&secid=<%=secId%>" class="storynormaltxt">Go Back to Story Page</a></td></tr>
	<tr><td align="center"><a href="section?secid=<%=secId%>" class="storynormaltxt">Go Back to Section Page</a></td></tr>
	<tr><td align="center"><a href="home" class="storynormaltxt">Go Back to HOME Page</a></td></tr>
      <tr><td height="8"></td></tr>
      </table>
      <div style="height:12px;"></div>
  <%@ include file="othercategories.html"%>
  <%@include file="hotzone.html"%>
  <%@ include file="bottomnav.html"%>
<%@include file="googleanalytics_bottom.jsp"%></body>
</html>