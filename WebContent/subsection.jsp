<%@page language="java" import="com.mobile.dto.SectionDTO, com.mobile.util.*"%>
<%@page import="java.util.ArrayList"%>

<%
	ArrayList result = (ArrayList) session.getAttribute("data");
	if (result != null && result.size() > 0) {
		//for (int j = 0; j < result.size(); j++) {
			//SectionDTO totalStory = (SectionDTO) result.get(j);
			//if(totalStory.getTitle().contains("<a")){
            //result.remove(result.get(j));
            //}
            //}
               int subsectionLimit=8;
            if(result.size()>=8){
            subsectionLimit=8;
            }else{
            subsectionLimit=result.size();
            }
            
            for (int i = 0; i < subsectionLimit; i++) {
			SectionDTO story = (SectionDTO) result.get(i);
			if (i == 0) {
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%//@include file="googleanalytics_top.jsp"%>
<html>
	<head>
    <%@include file="googleanalytics.jsp"%> 
		<META http-equiv="Content-Type" content="text/html;charset=iso-8859-1">
		<title><%=story.getSecName()%></title>
		<meta name="description" content="<%=story.getMetaDesc()%>" />
		<meta name="keywords" content="<%=story.getMetaKey()%> " />
		<meta name="viewport" content="width=device-width" user-scalable="yes" initial-scale="1.0">
<meta name="HandheldFriendly" content="true">
<link rel="icon" href="favicon.ico">
		<link rel="stylesheet" href="css/mobile.css" type="text/css">
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<%@include file="zedo-adCode-ros.jsp"%>
</head><body> 
<%@include file="zedo-adCode-ros-logo.jsp"%>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td  align="left" valign="top"><%@ include file="topnav.jsp"%><%sectionNameforAddDisplay=story.getCatName();%>
				<div align="center" style="margin-top:5px"><%@include file="top_add.jsp" %> </div>
</td>
			</tr>

			<tr>
				<td  align="left" valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="8"></td>
						</tr>
						<tr>
							<td class="breadcrumb">
								<a href="home">Home</a> &raquo; <a href="section?secid=<%=story.getSecId()%>"><%=story.getSecName()%></a> &raquo; <%=story.getCatName()%>
							</td>
						</tr>
						<tr>
							<td align="left" valign="top">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<%
									}
									%>
									<tr>
										<td width="2%" align="center" valign="top">
											<img src="images/blue_squire_bullet.jpg" width="3" height="3"
												vspace="7">
										</td>
										<td width="98%" >
											<a href="story?sid=<%=story.getId()%>&secid=<%=story.getSecId()%>&subsecid=<%=story.getCatId()%>"><%=story.getTitle()%></a>
										</td>
									</tr>
									<%
										}
										}
									%>
									<tr>
										<td height="8" ></td>
									</tr>
									<!-- <tr>
										<td class="more" >
											<a href="#">more &raquo;</a>
										</td>
									</tr> <tr>
										<td align="center" >
											<img src="images/Latest-ad.gif" border="0">
										</td>
									</tr> -->
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="8" ></td>
			</tr>
  <tr><td ><%@ include file="othercategories.html"%></td></tr>
  <tr><td><%@include file="hotzone.html"%></td></tr>
  <tr><td ><%@ include file="bottomnav.html"%></td></tr>
		</table>
<%//@include file="googleanalytics_bottom.jsp"%>
	</body>
</html>

