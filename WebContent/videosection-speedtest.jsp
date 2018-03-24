<%@taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %><compress:html removeIntertagSpaces="true"><%@taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %><%@ page language="java" import="java.util.List, java.util.ArrayList, com.itgd.dto.ContentChunkDTO, com.itgd.helper.ContentChunkHelper, com.itgd.utils.Constants" pageEncoding="ISO-8859-1"%><%@include file="global_include.jsp"%>
<% String baseUrl = request.getRequestURL().substring(0,request.getRequestURL().indexOf(request.getServletPath()))+"/"; 
int videoCategoryId = 0;
int currentPageNo = 1; %>
<cache:cache key="<%=cacheURL+"videos-speedtest.jsp"%>" scope="application " time="10" refresh="t" >
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html><head><meta content="NOINDEX, NOFOLLOW" name="ROBOTS"> 
<base href="<%=SITE_URL%>"/>
<META http-equiv="Content-Type" content="text/html;charset=iso-8859-1">
<title>Business Today - Latest Videos - News Videos - Online News</title>
<meta name="description" content="Business Today Videos - Videos from Business Today covering news videos, breaking news, politics news videos, business , entertainment, celebrities from Business Today.">
<meta name="keywords" content="Videos on news, latest news videos, breaking news videos, latest developments, controversies videos, entertainment videos from Business Today, India Today Group" />
<link rel="stylesheet dns-prefetch" href="css/mobile.css" type="text/css">
<script type="text/javascript" src="js/jquery-1.4.2.min.js" async></script>
<meta name="viewport" id="viewport" content="width=device-width; initial-scale=1.0; minimum-scale=1.0; maximum-scale=1.0; user-scalable=no;"></meta>
<link rel="canonical" href="http://businesstoday.intoday.in/videos" />
<script type="text/javascript" async>
function canonicalUrlRedirection() {
var canonicalUrl = "";
var links = document.getElementsByTagName("link");
for (var i = 0; i < links.length; i ++) {
	if (links[i].getAttribute("rel") == "canonical") {
		canonicalUrl = links[i].getAttribute("href");
		break;
	}
}
if (canonicalUrl != "") {
	window.location.href = canonicalUrl;
}
}
var mobile = (/iphone|vnd.wap.xhtml+xml|sony|symbian|S60|SymbOS|nokia|samsung|mobile|windows ce|epoc|opera mini|nitro|j2me|midp-|cldc-|netfront|mot|up.browser|up.link|audiovox|blackberry|ericsson|panasonic|philips|sanyo|sharp|sie-|portalmmm|blazer|avantgo|danger|palm|series60|palmsource|pocketpc|smartphone|rover|ipaq|au-mic|alcatel|ericy|vodafone|wap1|wap2|teleca|playstation|lge|lg-|android|htc|dream|webos|bolt|nintendo|palm/i.test(navigator.userAgent.toLowerCase()));
if (!mobile) {  canonicalUrlRedirection(); }
</script>
<style>.caption-video{width:23px; height:23px;  position:absolute; bottom:-27px; left:-36px; background:url(http://media2.intoday.in/businesstoday/mobile/vid-cap.png) no-repeat}</style>
<jsp:include page="ga-comscore.jsp" flush="false"></jsp:include>
<jsp:include page="common-adcode.jsp" flush="false"></jsp:include>
</head>
<body>
<!-- Ad Slot 3 tag: --><!-- begin ZEDO for channel: BT WAP Richmedia ROS, Publisher: Bussiness Today WAP, Ad Dimension: Logo-1x1 --> 
<div id="zt_477283_3" style="display:show"><script id="zt_477283_3" language="javascript">if(typeof zmt_mtag !='undefined' && typeof zmt_mtag.zmt_render_placement !='undefined') {    zmt_mtag.zmt_render_placement(p477283_3); } </script></div>
<!-- end ZEDO for channel:  BT WAP Richmedia ROS, Publisher: Bussiness Today WAP, Ad Dimension: Logo-1x1 -->
<%@ include file="common-topnav.jsp"%>
<div align="center"><%@include file="common-topad.jsp" %></div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr><td class="breadcrumb"><a href="<%=SITE_URL%>">Home</a> &raquo; Videos</td></tr>
<tr><td height="7"></td></tr>
<%
	int videoCountDisplay = 10;
	ArrayList videoListData = (ArrayList) ContentChunkHelper.alllatestVideo(videoCountDisplay, "");
	String catTitle="";
	
	if (videoListData != null && videoListData.size() > 0) {
	for (int ctr=0; ctr < videoListData.size(); ctr++) {
		ContentChunkDTO catDetail = (ContentChunkDTO) videoListData.get(ctr);	%>
	<tr><td  bgcolor="#FFFFFF" style="border-bottom:1px solid #DBDBDB;"><div style="margin-left:5px; line-height:20px;">
	<%if(catDetail.getSmallImage().trim().length() > 0) {%>
		<a href="<%=catDetail.getContentURL()%>" class="posrel" style="position:relative"><div class="caption-video"></div><img rel="prefetch" src="<%=STORY_IMAGE_BASEPATH+catDetail.getSmallImage().trim()%>" width="88" height="66" align="left" style="margin:0 8px 0 2px; border:0;"/><span class="pmedia-play-icon"></span></a>
	<% } else {%>
		<a href="<%=catDetail.getContentURL()%>" class="posrel" style="position:relative"><div class="caption-video"></div><img rel="prefetch" src="<%=NO_IMG_88x66%>" width="88" height="66" align="left" style="margin:0 8px 0 2px; border:0;"/><span class="pmedia-play-icon"></span></a>
	<% }%>
	<div><a href="<%=catDetail.getCategoryURL()%>"><%=catDetail.getCategoryTitle()%></a></div>
	<a href="<%=catDetail.getContentURL()%>"><span class="story-title"><b><%=catDetail.getTitle()%></b></span></a></div></td></tr>

<% }} else {
	String redirectURL = SITE_BASEPATH + "pagenotfound.jsp";
	response.sendRedirect(redirectURL);
} %>
</table> 
<div style="height:12px;"></div> 
<%@ include file="othercategories.html"%> 
<div style="height:12px;"></div>  
<%@include file="hotzone.html"%> 
<%@include file="ringtones.html"%> 
<%--
<tr><td align="center"><%@include file="bottom_add.jsp"%></td></tr>
 --%>
<%@ include file="common-bottomnav.html"%>
</body>
</html> 			
</cache:cache>
</compress:html>