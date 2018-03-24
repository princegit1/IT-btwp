<%@taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %><compress:html removeIntertagSpaces="true">
<%@taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %>
<%@page language="java" import="java.util.ArrayList, com.itgd.utils.Constants, com.itgd.dto.ContentListDTO, com.itgd.utils.StringUtil "%>
<cache:cache key="<%=Constants.SITE_URL + "index.jsp"%>" scope="application" time="321" refresh="t">
<%@include file="global_include.jsp"%>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html><head><%@include file="topchartbeat.jsp" %>
<title>Business Today: Business News, Latest Stock Market and Economy News India from Businesstoday.in</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="description" content="latest Business News, Indian economy News, Sensex updates, BSE, NSE, stock exchange news, Mutual Funds, investing in India, new market. Daily stock markets news, insurance, income tax filing information." />
<meta name="keywords" content="Latest Business News - Businesstoday.in one of the best business magazine in India which offers you latest updates about stocks, NSE, BSE, Top Companies, Markets, Sectors, Banking, interviews and money management tips." /><meta name="google-site-verification" content="P2lmnYzIX2lQifvTcbZbYNn5_RBHN3Y2_-h-_POOf68" />

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="msvalidate.01" content="28AD13B9E2353694C455F57D02382A94" />
<link rel="canonical" href="http://businesstoday.intoday.in" />
<link rel="stylesheet dns-prefetch" href="<%=MEDIA_CSS%>mobile-mini.css" type="text/css">
<link rel="stylesheet" href="<%=MEDIA_CSS%>mobile-home.css" type="text/css">
<!--<meta name="viewport" id="viewport" content="width=device-width; initial-scale=1.0; minimum-scale=1.0; maximum-scale=1.0; user-scalable=no;"></meta>-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script async type="text/javascript"> (function() { var po = document.createElement("script"); po.type = "text/javascript"; po.async = true;  po.src = "https://apis.google.com/js/plusone.js?publisherid=117119850068103661951";   var s = document.getElementsByTagName("script")[0]; s.parentNode.insertBefore(po, s);  })(); </script>
<jsp:include page="ga-comscore.jsp" flush="false"></jsp:include>
<%@include file="zedo-adCode-home.jsp"%>
<style>
.story-title a {  font-size: 16px;  line-height: 22px;  color: #4e4e4e;	font-family: 'Oxygen', sans-serif; }
.story-title {  margin-top:0px !important; max-width: 220px; font-family: 'Oxygen', sans-serif;	 font-size: 16px;    line-height: 22px;    color: #4e4e4e;  }
#prev{ margin-left:-15px; display:block} #next{ margin-right:-15px; display:block}
</style>
</head><body> 
<%@include file="zedo-adCode-home-logo.jsp"%>
<%@include file="common-topnav.jsp"%>
<div style="height:8px;"></div>
<div align="center"> <%@include file="top_add.jsp" %> </div>

<div style="height:8px;"></div>
<%@include file="breakingnews.jsp"%>
<div style="height:8px;"></div>
           
<%@include file="market_xml_reader.jsp" %> 

<div style="height:8px;"></div>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
<% ArrayList contentAL = null;
contentAL = (ArrayList)CommonFunctions.latestStories("99", 5, "0");
if (contentAL != null && contentAL.size() > 0) {
	for (int ctr = 0; ctr < contentAL.size(); ctr++) {
		ContentListDTO cDTO = (ContentListDTO) contentAL.get(ctr);
		if (ctr == 0) {	%>
			<tr><td height="22" bgcolor="#2E3094" class="subheading"><a href="<%=Constants.SITE_URL + CommonFunctions.sectionURL(cDTO.getCurrentCategorySefTitle(),1, cDTO.getCurrentCategoryId())%>" class="subheading">BIG STORY</a></td></tr><tr><td height="5" bgcolor="#FFFFFF"></td></tr>
	<%	}	%>
			<tr><td bgcolor="#FFFFFF" style="border-bottom:1px solid #DBDBDB;">
		<%	   if(cDTO.getImage() != null && cDTO.getImage().trim().length() > 0) {	%>
					<a href="<%=Constants.SITE_URL+CommonFunctions.storyURL(cDTO.getSefTitle(),1, cDTO.getId())%>"><img rel="prefetch" src="<%=Constants.STORY_IMAGE_BASEPATH + cDTO.getImage().trim()%>" width="80" height="80" align="left" style="margin:0 8px 0 2px; border:0;"/></a>
			<% } else {%>
					<a href="<%=Constants.SITE_URL+CommonFunctions.storyURL(cDTO.getSefTitle(),1, cDTO.getId())%>"><img rel="prefetch" src="<%=Constants.NO_IMG_88x66%>" width="80" height="80" align="left" style="margin:0 8px 0 2px; border:0;"/></a>
			<% }	%>
			<div class="story-title"><a href="<%=Constants.SITE_URL+CommonFunctions.storyURL(cDTO.getSefTitle(),1, cDTO.getId())%>"><%=cDTO.getTitle()%></a></div>
			</td></tr>
<%}}%>
<tr>
<td bgcolor="#ffffff" style="PADDING-LEFT: 2px; BORDER-BOTTOM: #c7c7c7 1px solid" class="more"><a href="<%=Constants.SITE_URL%>section/99/1/big-story.html">more &raquo;</a></td> 
<tr>
<tr><td align="center" style="padding-top:5px;"><div style="height:8px;"></div></td></tr>
<%contentAL = (ArrayList)CommonFunctions.latestStories("105", 8, "0");
if (contentAL != null && contentAL.size() > 0) {
	for (int ctr = 0; ctr < contentAL.size(); ctr++) {
		ContentListDTO cDTO = (ContentListDTO) contentAL.get(ctr);
		if (ctr == 0) {%>
        	<tr><td height="22" bgcolor="#2E3094" class="subheading"><a href="<%=Constants.SITE_URL+CommonFunctions.sectionURL(cDTO.getCurrentCategorySefTitle(),1, cDTO.getCurrentCategoryId())%>" class="subheading">TOP NEWS</a></td></tr>	<tr><td height="5" bgcolor="#FFFFFF"></td></tr>
	<%	}	%>
		<tr><td bgcolor="#FFFFFF" style="border-bottom:1px solid #DBDBDB;">
			<%if(cDTO.getImage().trim().length() > 0) {%>
				<a href="<%=Constants.SITE_URL + CommonFunctions.storyURL(cDTO.getSefTitle(),1, cDTO.getId())%>"><img rel="prefetch" src="<%=Constants.STORY_IMAGE_BASEPATH + cDTO.getImage().trim()%>" width="80" height="80" align="left" style="margin:0 8px 0 2px; border:0;"/></a>
			<% } else {	%>
				<a href="<%=Constants.SITE_URL + CommonFunctions.storyURL(cDTO.getSefTitle(),1, cDTO.getId())%>"><img rel="prefetch" src="<%=Constants.NO_IMG_88x66%>" width="80" height="80" align="left" style="margin:0 8px 0 2px; border:0;"/></a>
			<% }	%>
			<div class="story-title"><a href="<%=Constants.SITE_URL+CommonFunctions.storyURL(cDTO.getSefTitle(),1, cDTO.getId())%>"><%=cDTO.getTitle()%></a></div></td></tr>
<%	}	
}	%>
<tr>
<td bgcolor="#ffffff" style="PADDING-LEFT: 2px; BORDER-BOTTOM: #c7c7c7 1px solid" class="more"><a href="<%=Constants.SITE_URL%>section/105/1/latest-headlines.html">more &raquo;</a></td>
</table>
<div style="height:12px;"></div>
<jsp:include page="latest_stories_chunk.jsp" flush="true" >
	<jsp:param name="categoryId" value="111" /> 
	<jsp:param name="contentCount" value="3" /> 
	<jsp:param name="storyIdToAvoid" value="0" /> 
</jsp:include>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
<tr><td align="center"><div style="height:5px;"></div></td> </tr>
</table> 
<div style="height:12px;"></div>
<%-- Middle Ad removed from Here 09/05/2016 --%>
<div style="height:8px;"></div>
<jsp:include page="latest_stories_chunk.jsp" flush="true" >
	<jsp:param name="categoryId" value="101" />  
	<jsp:param name="contentCount" value="3" /> 
	<jsp:param name="storyIdToAvoid" value="0" /> 
</jsp:include>

<!--Money  -->
<jsp:include page="latest_stories_chunk.jsp" flush="true" >
	<jsp:param name="categoryId" value="103" /> 
	<jsp:param name="contentCount" value="3" /> 
	<jsp:param name="storyIdToAvoid" value="0" /> 
</jsp:include>

<!--<div style="height:12px;"></div>
<div align="center" style="width:300px;margin:0px auto"> <%//@include file="middle_add.jsp" %> </div>-->
<div style="height:8px;"></div>
<table width="100%" border="0" align="center" cellspacing="0" cellpadding="0">
<tbody>
<tr align="center">
<td align="center">
 <!-- Ad Slot 1 tag: --> 
 <!-- begin ZEDO for channel:- BT Homepage Middle 1, Publisher: Bussiness Today WAP, Ad Dimension: Medium Rectangle-300x250 --> 
 <div id="zt_408558_4" style="display:show; width:300px;margin:0px auto"> 
 <script id="zt_408558_4" language="javascript"> 

if(typeof zmt_mtag !='undefined' && typeof zmt_mtag.zmt_render_placement !='undefined')
{
     zmt_mtag.zmt_render_placement(p408558_4);
}
 </script>
 </div>
 <!-- end ZEDO for channel: - BT Homepage Middle 1, Publisher: Bussiness Today WAP, Ad Dimension: Medium Rectangle-300x250 --> 
</td>
</tr>
</tbody>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0"><tr><td height="22" bgcolor="#2E3094" class="subheading"><a href="<%=SITE_BASEPATH+"galleries"%>" class="subheading">Photos</a></td></tr><tr><td height="5" bgcolor="#FFFFFF"></td></tr>
<%
ArrayList photo = (ArrayList)CommonFunctions.latestGalleries(0, 5, "0");
String[][] galleryArray = null;
if (photo != null && photo.size() > 0) {
	galleryArray = new String[photo.size()][4];
	for (int ctr = 0; ctr < photo.size(); ctr++) {
		ContentListDTO pdto = (ContentListDTO) photo.get(ctr);
		galleryArray[ctr][0] = ""+pdto.getId();
		galleryArray[ctr][1] = pdto.getTitle();
		galleryArray[ctr][2] = pdto.getSefTitle();
		galleryArray[ctr][3] = pdto.getImage();
	}
}

if (galleryArray != null && galleryArray.length > 0) {
for (int ctr = 0; ctr < galleryArray.length; ctr++) {
if (ctr == 0) {
//	out.print("<tr><td align='center' valign='top' bgcolor='#FFFFFF' style='border-bottom:1px solid #DBDBDB;'><div class='homegallery'><div class='arr-left'><a id='prev' href=\"#\"><img src=\"images/left-arrow-new.gif\" border='0'></a></div><div class='arr-right'><a id='next' href=\"#\"><img src=\"images/right-arrow-new.gif\" border='0'></a></div><div id='imagegallery' >");
out.print("<tr><td align='center' valign='top' bgcolor='#FFFFFF' style='border-bottom:1px solid #DBDBDB;'><div class='homegallery'><div class='arr-left'><a id='prev' href=\"#\"><img src=\""+MEDIA_CSS+"images/left-arrow-new.gif\" border='0'></a></div><div class='arr-right'><a id='next' href=\"#\"><img src=\""+MEDIA_CSS+"images/right-arrow-new.gif\" border='0'></a></div><div id='imagegallery' >");
}
%>
	<div class="gallerycont">
	<div class="simgrepeat"><a href="<%=SITE_BASEPATH+CommonFunctions.galleryURL(galleryArray[ctr][2],1, Integer.parseInt(galleryArray[ctr][0]))%>"><img src="<%=PHOTO_BASEPATH+galleryArray[ctr][3]%>" width="144" height="130" /><span class="photoicon"></span></a></div>
	<div clear="both"></div>
	<a href="<%=SITE_BASEPATH+CommonFunctions.galleryURL(galleryArray[ctr][2],1, Integer.parseInt(galleryArray[ctr][0]))%>"><%=galleryArray[ctr][1]%></a> 
	</div>
<%
if (ctr == galleryArray.length-1) {
	out.print("</div></div></td></tr><tr><td class='more' bgcolor='#FFFFFF' style='border-bottom:1px solid #C7C7C7; padding-left:2px;'><a href=\""+SITE_BASEPATH+"galleries\">more &raquo;</a></td></tr>");
}
}}%>
</table><div style="height:12px;"></div>
<div style="height:12px;"></div>
<!--From The Mag  -->
<jsp:include page="latest_stories_chunk.jsp" flush="true" >
	<jsp:param name="categoryId" value="110" /> 
	<jsp:param name="contentCount" value="3" /> 
	<jsp:param name="storyIdToAvoid" value="0" /> 
</jsp:include>
<!--Money  -->
<jsp:include page="latest_stories_chunk.jsp" flush="true" >
	<jsp:param name="categoryId" value="102" /> 
	<jsp:param name="contentCount" value="3" /> 
	<jsp:param name="storyIdToAvoid" value="0" /> 
</jsp:include>

<!--Money  -->
<jsp:include page="latest_stories_chunk.jsp" flush="true" >
	<jsp:param name="categoryId" value="125" /> 
	<jsp:param name="contentCount" value="3" /> 
	<jsp:param name="storyIdToAvoid" value="0" /> 
</jsp:include>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">  
<tr><td align="center"><div style="height:5px;"></div></td> </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0"><tr><td height="22" bgcolor="#2E3094" class="subheading"><a href="videosection.jsp" class="subheading">VIDEO</a></td></tr></table>
<div style="height:8px;"></div>
<%@include file="home_video_chunk.jsp"%>
<div style="height:8px;"></div>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
<tr><td height="5"></td></tr><tr><td align="center">
<div align="center"><div align="center" style="width:300px;margin:0px auto"> <%@include file="bottom_add.jsp" %> </div></div>
</td></tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
<tr><td height="8"></td></tr>
<tr><td height="3" bgcolor="#2E3094"></td></tr>
<tr><td height="3"></td></tr>
<tr><td align="center" valign="top" bgcolor="#F7F7F8" style="border-bottom:1px solid #C7C7C7;">
<form name="search" method="get" action="search.jsp" onSubmit="return footerValidateSearch('footersearch');">
<input type="text" maxlength="40" placeholder="Type To search" value="" class="textboxs" id="footersearch" name="searchword">    
<input name="submit" value="GO"  type="submit"></form>
</td></tr>
</table>
<div align="center"><a href="http://m.indiatoday.in/missedcallbt.jsp" target="_blank"><img rel="prefetch" src="<%=MEDIA_CSS%>images/BT_App.jpg" border="0" /></a></div>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr height="1"> <td height="1" bgcolor="#2E3094"></td> </tr>
    <tr><td class="copyright"><img rel="prefetch" src="<%=MEDIA_CSS%>images/footlogo.gif" border="0" align="left" hspace="5" alt="India Today Group" title="India Today Group">Copyright &#169; 2017 Living Media India Limited.</td></tr>
</table>
<script  type="text/javascript" src="<%= MEDIA_JS %>jquery-1.4.2.min.js"></script> 
<script  type="text/javascript" src="<%= MEDIA_JS %>jquery.cycle.all.min.js"></script>
<script  type="text/javascript" src="<%= MEDIA_JS %>jquery.touchwipe.js"></script> 
<script async type="text/javascript" src="<%= MEDIA_JS %>index-page.js"></script> 
<script>
//cycle code begin
$(document).ready(function() {
	$('#imagegallery').cycle({
		timeout: 0,
		fx: 'scrollHorz',
		next: '#next',
		prev: '#prev' 
	});
 
	$("#imagegallery").touchwipe({
 		wipeLeft: function() {
 	 		$("#imagegallery").cycle("next");
 		},
 		wipeRight: function() {
 	 		$("#imagegallery").cycle("prev");
 		}
	});
});
//cycle code end
$(document).ready(function() {
	$('#imagegallery').cycle({ timeout: 0, fx: 'scrollHorz', next: '#next', prev: '#prev' }); 
	$("#imagegallery").touchwipe({ wipeLeft: function() {	$("#imagegallery").cycle("next");	}, wipeRight: function() { $("#imagegallery").cycle("prev"); } });
});
</script><script src="http://tags.crwdcntrl.net/c/9711/cc_af.js"></script>
<%@include file="bottomchartbeat.jsp" %>
</body>
</html>
</cache:cache>
</compress:html>