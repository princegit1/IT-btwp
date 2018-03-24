<%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %>
<%@page language="java" import="java.net.*, java.util.ArrayList, com.itgd.utils.*, com.itgd.dto.ContentListDTO"%>
<%@include file="global_include.jsp"%>
<cache:cache key="<%=SITE_URL+"gallerysection.jsp/"%>" scope="application " time="612" refresh="t" >
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%@include file="googleanalytics_top.jsp"%>
<html><head>
<base href="<%=SITE_URL%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Business Today: Latest Business News, India economy News, Stock Markets, Sensex, Mutual Funds and Indian Tax </title>
<meta name="keywords" content="Business news, India business news today, stock markets news, financial news, business news headlines, business news online site, BSE new, NSE new top business news, stock news, latest finance news india, top companies, Sensex, Mutual Funds, India Tax, Ta" />
<meta name="description" content="Latest Business News from top companies in India or World, Indian economy News, Sensex updates, BSE, NSE, stock exchange news. All about Mutual Funds, investing in India, new market. Daily stock markets news, insurance, income tax filing information from " />
<link rel="stylesheet" href="css/mobile.css" type="text/css">
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="canonical" href="http://m.businesstoday.in/galleries" />
<%if(request.getAttribute("javax.servlet.forward.request_uri")!=null){ %>
<link rel="alternate" href="http://www.businesstoday.in/photos" />
<script type="text/javascript">
function canonicalUrlRedirection() {
	//if (window.innerWidth > 985) {
		var canonicalUrl = "";
		var links = document.getElementsByTagName("link");
		for (var i = 0; i < links.length; i ++) {
			if (links[i].getAttribute("rel") == "alternate") {
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

<%} %>
<%@include file="ga-comscore.jsp"%>
<%@include file="zedo-adCode-ros.jsp"%>
</head><body> 
<%@include file="zedo-adCode-ros-logo.jsp"%>
<%@include file="topnav.jsp"%>
<div style="height:8px;"></div>
<div align="center"> <%@include file="top_add.jsp" %> </div>

<div style="height:5px;"></div>

<div class="breadcrumb"><a href="<%=SITE_URL%>">Home</a> &raquo; Photos</div>
<div style="height:5px;"></div><div style="background-color:#2E3094" class="subheading">Photos </div>
<%
ArrayList photo = (ArrayList)CommonFunctions.latestGalleries(0, 5, "0");
if (photo != null && photo.size() > 0) {
	for (int ctr = 0; ctr < photo.size(); ctr++) {
		ContentListDTO pdto = (ContentListDTO) photo.get(ctr);
%>
	<div style="text-align:center" class="phototxt">
    <div class="simgrepeat">
    <a href="<%=SITE_BASEPATH+CommonFunctions.galleryURL(pdto.getSefTitle(),1, pdto.getId())%>"><img src="<%=PHOTO_BASEPATH+pdto.getImage()%>" width="144" height="130" vspace="3" border="0" ><span class="photoicon"></span></a></div>
    <div style="text-align:center; border-bottom:1px solid #6c6c6c; padding-bottom:2px; padding-top:3px;" class="phototxt" ><a href="<%=SITE_BASEPATH+CommonFunctions.galleryURL(pdto.getSefTitle(),1, pdto.getId())%>" ><%=pdto.getTitle()%></a></div></div>
<%}}%>
<div style="height:12px;"></div><div style="float:left; width:100%"><%@ include file="othercategories.html"%></div>
<div style="height:12px;"></div><div style="float:left; width:100%"><%@include file="hotzone.html"%></div>
<div style="float:left; width:100%"><%@ include file="bottomnav.html"%></div><%@include file="googleanalytics_bottom.jsp"%></body>
</html>	
</cache:cache>