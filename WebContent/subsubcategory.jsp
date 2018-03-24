<%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %>
<%@page language="java" import="java.net.*, java.util.ArrayList, com.itgd.utils.*, com.itgd.dto.StoryListDTO"%>
<%@include file="global_include.jsp"%>
<%
int sectionId = 1;
int currentPageNo = 1;
if(request.getAttribute("sectionId")!=null)
	sectionId = (Integer)request.getAttribute("sectionId");
if(request.getAttribute("currentPageNo")!=null)
	currentPageNo = (Integer)request.getAttribute("currentPageNo");
%>
<cache:cache key="<%=SITE_URL+"subsubcategory/"+currentPageNo+"/"+sectionId%>" scope="application " time="300" refresh="t" >

<%
int ctrStart = 0;
int ctrToDisplay=10;
int ctrToFetch=ctrStart+ctrToDisplay;

ArrayList sAL =null;				
//System.out.println("sAL1-->"+sAL);
sAL = CommonFunctions.latestStoriesTemplate(sectionId, ctrToFetch, "0", 4);
//System.out.println("sAL11-->"+sAL);

if(sAL!=null && sAL.size()>0){
	for (int ctr=ctrStart; ctr < sAL.size(); ctr++) {
		StoryListDTO sDTO = (StoryListDTO) sAL.get(ctr);
		if (ctr == ctrStart) {

 %>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<%//@include file="googleanalytics_top.jsp"%>
<html><head>
<%@include file="googleanalytics.jsp"%> 
<base href="<%=SITE_URL%>"/>
<META http-equiv="Content-Type" content="text/html;charset=iso-8859-1">
<title><%=sDTO.getMetaTitle()%></title>
<meta name="description" content="<%=sDTO.getMetaDescription()%>" />
<meta name="keywords" content="<%=sDTO.getMetaKeyword()%> " />
<link rel="stylesheet" href="css/mobile.css" type="text/css">
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<%@include file="zedo-adCode-ros.jsp"%>
</head><body> 
<%@include file="zedo-adCode-ros-logo.jsp"%>
<%@ include file="topnav.jsp"%><%sectionNameforAddDisplay=sDTO.getSubSubCategoryTitle();%>
<div style="height:8px;"></div>
<div align="center"> <%@include file="top_add.jsp" %> </div>
<div style="height:5px;"></div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr><td class="breadcrumb">
	<a href="<%=SITE_URL%>">Home</a> &raquo; <a href="<%=CommonFunctions.sectionURL(sDTO.getSectionSefTitle(),1, sDTO.getSectionId())%>"><%=sDTO.getSectionTitle()%></a> &raquo;  <a href="<%=CommonFunctions.categoryURL(sDTO.getCategorySefTitle(),1, sDTO.getCategoryId())%>"><%=sDTO.getCategoryTitle()%></a> &raquo; <a href="<%=CommonFunctions.subCategoryURL(sDTO.getSubCategorySefTitle(),1, sDTO.getSubCategoryId())%>"><%=sDTO.getSubCategoryTitle()%></a> &raquo; <%=sDTO.getSubSubCategoryTitle()%>

</td></tr>
<tr><td height="7"></td></tr><tr><td bgcolor="#2E3094" class="subheading"><%=sDTO.getSubSubCategoryTitle()%> </td></tr>
<%}%>






<%if(!sDTO.getTitle().contains("http://")){%>
	<tr><td  bgcolor="#FFFFFF" style="border-bottom:1px solid #DBDBDB;"><div style="margin-left:5px; line-height:20px;">
	<%if(sDTO.getImage().trim().length() > 0) {%>
		<a href="<%=CommonFunctions.storyURL(sDTO.getSefTitle(),1, sDTO.getId())%>"><img src="http://media2.intoday.in/indiatoday/images/stories/<%=sDTO.getImage().trim()%>" width="88" height="66" align="left" style="margin:0 8px 0 2px; border:0;"/></a>
	<% } else {%>
		<a href="<%=SITE_BASEPATH+CommonFunctions.storyURL(sDTO.getSefTitle(),1, sDTO.getId())%>"><img src="<%=NO_IMG_88x66%>" width="88" height="66" align="left" style="margin:0 8px 0 2px; border:0;"/></a>
	<% }%>
	<a href="<%=CommonFunctions.storyURL(sDTO.getSefTitle(),1, sDTO.getId())%>"><span class="story-title"><%=sDTO.getTitle()%></span></a>
	</div></td></tr>
<%}}%>			
</table><div style="height:12px;"></div> <%@ include file="othercategories.html"%> <div style="height:12px;"></div>  <%@include file="hotzone.html"%>  <%@include file="ringtones.html"%>  <%@ include file="bottomnav.html"%><%//@include file="googleanalytics_bottom.jsp"%>	
</body>
</html>
<%} else {
	String redirectURL = SITE_BASEPATH + "pagenotfound.jsp";
	response.sendRedirect(redirectURL);
}
%>			

</cache:cache>

