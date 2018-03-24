<%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %>
<%@ page language="java" import="java.util.*, java.io.*, com.itgd.dto.ContentChunkDTO, com.itgd.helper.ContentChunkHelper, com.itgd.utils.*" pageEncoding="ISO-8859-1"%><%@include file="global_include.jsp"%>
<% String baseUrl = request.getRequestURL().substring(0,request.getRequestURL().indexOf(request.getServletPath()))+"/"; 
int videoCategoryId = 0;
int currentPageNo = 1;
//System.out.println("videoCategoryId->"+videoCategoryId+" -- currentPageNo->"+currentPageNo);
%>
<cache:cache key="<%=cacheURL+"videos"%>" scope="application " time="612" refresh="t" >
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html><%@include file="topchartbeat.jsp"%>
<head>
<%@include file="googleanalytics.jsp"%> 
<base href="<%=SITE_URL%>"/>
<META http-equiv="Content-Type" content="text/html;charset=iso-8859-1">
<title>Business Today - Latest Videos - News Videos - Online News</title>
<meta name="description" content="Business Today Videos - Videos from Business Today covering news videos, breaking news, politics news videos, business , entertainment, celebrities from Business Today.">
<meta name="keywords" content="Videos on news, latest news videos, breaking news videos, latest developments, controversies videos, entertainment videos from Business Today, India Today Group" />
<link rel="stylesheet" href="css/mobile.css" type="text/css">
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<meta name="viewport" id="viewport" content="width=device-width; initial-scale=1.0; minimum-scale=1.0; maximum-scale=1.0; user-scalable=no;"></meta>

<link rel="canonical" href="http://businesstoday.intoday.in/videos" />
<script type="text/javascript">
function canonicalUrlRedirection() {
	//if (window.innerWidth > 985) {
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
	//}
}
 var mobile = (/iphone|vnd.wap.xhtml+xml|sony|symbian|S60|SymbOS|nokia|samsung|mobile|windows ce|epoc|opera mini|nitro|j2me|midp-|cldc-|netfront|mot|up.browser|up.link|audiovox|blackberry|ericsson|panasonic|philips|sanyo|sharp|sie-|portalmmm|blazer|avantgo|danger|palm|series60|palmsource|pocketpc|smartphone|rover|ipaq|au-mic|alcatel|ericy|vodafone|wap1|wap2|teleca|playstation|lge|lg-|android|htc|dream|webos|bolt|nintendo|palm/i.test(navigator.userAgent.toLowerCase()));
              if (!mobile) {             
                 canonicalUrlRedirection(); 
              }
</script>


<style>
.caption-video{width:23px; height:23px;  position:absolute; bottom:-27px; left:-36px; background:url(http://media2.intoday.in/businesstoday/mobile/vid-cap.png) no-repeat}
</style>
</head>
<body>
<%@ include file="topnav.jsp"%>
<div align="center"><%//@ include file="top_add.jsp"%></div>
 <div class="banner" style="margin-bottom:10px;"> 
		<a href="http://specials.indiatoday.com/survey/coolest-startups2017/registration.jsp" target="_blank">
			<img src="http://media2.intoday.in/businesstoday/1.0.3/resources/cooleststartup/2017/images/coolest-startups2017-banner.gif" alt="COOLEST START-UPS 2017">
		</a>
	</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr><td class="breadcrumb"><a href="<%=SITE_URL%>">Home</a> &raquo; Videos</td></tr>
<tr><td height="7"></td></tr>
<%
int videoCountDisplay = 10;
	ArrayList videoListData = (ArrayList) ContentChunkHelper.alllatestVideo(videoCountDisplay, "");
	String catTitle="";
	
	if (videoListData != null && videoListData.size() > 0) {
	for (int ctr=0; ctr < videoListData.size(); ctr++) {
		ContentChunkDTO catDetail = (ContentChunkDTO) videoListData.get(ctr);		
	 %>          

	<tr><td  bgcolor="#FFFFFF" style="border-bottom:1px solid #DBDBDB;"><div style="margin-left:5px; line-height:20px;">
	<%if(catDetail.getSmallImage().trim().length() > 0) {%>
		<a href="<%=catDetail.getContentURL()%>" class="posrel" style="position:relative"><div class="caption-video"></div><img src="<%=STORY_IMAGE_BASEPATH+catDetail.getSmallImage().trim()%>" width="88" height="66" align="left" style="margin:0 8px 0 2px; border:0;"/><span class="pmedia-play-icon"></span></a>
	<% } else {%>
		<a href="<%=catDetail.getContentURL()%>" class="posrel" style="position:relative"><div class="caption-video"></div><img src="<%=NO_IMG_88x66%>" width="88" height="66" align="left" style="margin:0 8px 0 2px; border:0;"/><span class="pmedia-play-icon"></span></a>
	<% }%>
	<div><a href="<%=catDetail.getCategoryURL()%>"><%=catDetail.getCategoryTitle()%></a></div>
	<a href="<%=catDetail.getContentURL()%>"><span class="story-title"><b><%=catDetail.getTitle()%></b></span></a></div></td></tr>

<% if(ctr == videoListData.size()-1){%>
<!--<tr><td class="more" bgcolor="#ffffff" style="PADDING-LEFT: 2px; BORDER-BOTTOM: #c7c7c7 1px solid"><a href="#down"><a href="/videolist/<%//=catTitle%>/1/<%//=stArray[i]%>.html<%//=catDetail.getCategoryURL()%>">more »</a></td></tr><tr><td height="5"></td></tr> -->
<%}}} else {
	String redirectURL = SITE_BASEPATH + "pagenotfound.jsp";
	response.sendRedirect(redirectURL);
}
//}%>
</table> 
<div style="height:12px;"></div> 
<%@ include file="othercategories.html"%> 
<div style="height:12px;"></div>  
<%@include file="hotzone.html"%> 
<%@include file="ringtones.html"%> 
<tr><td align="center"><%@include file="bottom_add.jsp"%></td></tr>
<%@ include file="bottomnav.html"%>
<jsp:include page="bottomchartbeat.jsp"><jsp:param value="Video Section" name="chartBeatSecName"/> </jsp:include>
</body>
</html> 			
</cache:cache>
