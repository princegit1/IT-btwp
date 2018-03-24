<%@taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %><compress:html removeIntertagSpaces="true"><%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %><%@ page language="java" import="java.util.ArrayList, com.itgd.dto.ContentTemplateDTO,com.itgd.helper.ContentTemplateHelper, com.itgd.utils.Constants" pageEncoding="ISO-8859-1"%><%@include file="global_include.jsp"%>
<% 
String baseUrl = request.getRequestURL().substring(0,request.getRequestURL().indexOf(request.getServletPath()))+"/"; 
int videoCategoryId = 634;
int currentPageNo = 1;
if(request.getAttribute("videoCategoryId")!=null) {
	videoCategoryId = (Integer)request.getAttribute("videoCategoryId");
} else if(request.getParameter("videocatid")!=null) {
	videoCategoryId = Integer.parseInt(request.getParameter("videocatid"));
}
if(request.getAttribute("currentVideoCategoryPageNo")!=null)
	currentPageNo = (Integer)request.getAttribute("currentVideoCategoryPageNo");
%><cache:cache key="<%=cacheURL+"videolist-speedtest.jsp?videocatid="+videoCategoryId%>" scope="application " time="10" refresh="t" ><%
int videoCountDisplay = 10;
int totalVideoCount = 0;
String categoryMetaTitle = "";
String categoryMetaKeywords = "";
String categoryMetaDescription = "" ;
int videoId = 0;
String categoryTitle  = "" ;
String categorySefTitle  = "" ;
String headerImage = "";
ArrayList videoListData = (ArrayList) ContentTemplateHelper.latestVideo(videoCategoryId, currentPageNo, videoCountDisplay, "0");
if (videoListData != null && videoListData.size() > 0) {
	for (int ctr=0; ctr < videoListData.size(); ctr++) {
		ContentTemplateDTO catDetail = (ContentTemplateDTO) videoListData.get(ctr);
		if (ctr == 0) {  %>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html>
<head><meta content="NOINDEX, NOFOLLOW" name="ROBOTS">
<base href="<%=SITE_URL%>"/>
<META http-equiv="Content-Type" content="text/html;charset=iso-8859-1">
<title><%=catDetail.getMetaTitle()%></title>
<meta name="description" content="<%=catDetail.getMetaDescription()%>" />
<meta name="keywords" content="<%=catDetail.getMetaKeyword()%> " />
<link rel="stylesheet dns-prefetch" href="css/mobile.css" type="text/css">
<script type="text/javascript" src="js/jquery-1.4.2.min.js" async></script>
<meta name="viewport" id="viewport" content="width=device-width; initial-scale=1.0; minimum-scale=1.0; maximum-scale=1.0; user-scalable=no;"></meta>
<style>.caption-video{width:23px; height:23px;  position:absolute; bottom:-27px; left:-36px; background:url(http://media2.intoday.in/businesstoday/mobile/vid-cap.png) no-repeat}</style>
<jsp:include page="ga-comscore.jsp" flush="false"></jsp:include>
<jsp:include page="common-adcode.jsp" flush="false"></jsp:include>
</head>
<body>
<!-- Ad Slot 3 tag: --><!-- begin ZEDO for channel: BT WAP Richmedia ROS, Publisher: Bussiness Today WAP, Ad Dimension: Logo-1x1 --> 
<div id="zt_477283_3" style="display:show"><script id="zt_477283_3" language="javascript">if(typeof zmt_mtag !='undefined' && typeof zmt_mtag.zmt_render_placement !='undefined') {    zmt_mtag.zmt_render_placement(p477283_3); } </script></div>
<!-- end ZEDO for channel:  BT WAP Richmedia ROS, Publisher: Bussiness Today WAP, Ad Dimension: Logo-1x1 -->
<%@ include file="common-topnav.jsp"%>
<div style="height:8px;"></div>
<div align="center"> <%@include file="common-topad.jsp" %> </div>
<div style="height:5px;"></div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr><td class="breadcrumb"><a href="<%=SITE_URL%>">Home</a>&raquo;<a href="/videosection.jsp">Videos</a> &raquo; <%=catDetail.getCategoryTitle()%></td></tr>
<%--<tr><td height="7"></td></tr><tr><td bgcolor="#2e3094" class="subheading"><%=catDetail.getCategoryTitle()%> </td></tr> --%>
<% }	%>
	<tr><td  bgcolor="#FFFFFF" style="border-bottom:1px solid #DBDBDB;"><div style="margin-left:5px; line-height:20px;">
	<% if(catDetail.getSmallImage() != null && catDetail.getSmallImage().trim().length() > 0) {%>
		<a href="<%=catDetail.getContentURL()%>" class="posrel" style="position:relative"><div class="caption-video"></div><img rel="prefetch" src="<%=STORY_IMAGE_BASEPATH+catDetail.getSmallImage().trim()%>" width="88" height="66" align="left" style="margin:0 8px 0 2px; border:0;"/><span class="pmedia-play-icon"></span></a>
	<% } else {%>
		<a href="<%=catDetail.getContentURL()%>" class="posrel" style="position:relative"><div class="caption-video"></div><img rel="prefetch" src="<%=NO_IMG_88x66%>" width="88" height="66" align="left" style="margin:0 8px 0 2px; border:0;"/><span class="pmedia-play-icon"></span></a>
	<% }	%>
	<a href="<%=catDetail.getContentURL()%>"><span class="story-title"><%=catDetail.getTitle()%></span></a>
	</div></td></tr>
<%}} else {
	String redirectURL = SITE_BASEPATH + "pagenotfound.jsp";
	response.sendRedirect(redirectURL);
}%>
<!--	
<tr><td height="2" style="PADDING-BOTTOM: 2px; PADDING-TOP: 2px; BORDER-BOTTOM: #c7c7c7 1px solid"><strong>Others: </strong><a href="<%=SITE_URL%>videolist/india/1/42.html">India</a>&nbsp;|&nbsp;<a href="<%=SITE_URL%>videolist/entertainment/1/39.html">Entertainment </a>&nbsp;|&nbsp;<a href="<%=SITE_URL%>videolist/movies/1/414.html">Movies</a>&nbsp;|&nbsp;<a href="<%=SITE_URL%>videolist/lifestyle/1/415.html">Lifestyle</a>&nbsp;|&nbsp;<a href="<%=SITE_URL%>videolist/cricket/1/557.html">Cricket</a>&nbsp;|&nbsp;<a href="<%=SITE_URL%>videolist/sports/1/44.html">Sports</a>&nbsp;|&nbsp;<a href="<%=SITE_URL%>videolist/world/1/43.html">World</a>&nbsp;|&nbsp;<a href="<%=SITE_URL%>videolist/so-sorry/1/705.html">So Sorry</a></td></tr>	
-->
</table><div style="height:12px;"></div> <%@ include file="othercategories.html"%> <div style="height:12px;"></div>  <%@include file="hotzone.html"%>  <%@include file="ringtones.html"%>  <tr><td align="center">
<%--
<%@include file="bottom_add.jsp"%>
 --%>
</td></tr>
<tr><td height="8"></td></tr><%@ include file="common-bottomnav.html"%><%//@include file="googleanalytics_bottom.jsp"%>	
</body></html>  
</cache:cache>
</compress:html>