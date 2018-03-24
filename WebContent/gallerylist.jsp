<%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %>
<%@page language="java" import="java.net.*, java.util.ArrayList, com.itgd.utils.*, com.itgd.dto.ContentListDTO"%>
<%@include file="global_include.jsp"%>
<%
String wapBaseUrl = request.getRequestURL().substring(0,request.getRequestURL().indexOf(request.getServletPath()))+"/";

int categoryId = 3;
int currentPageNo = 1;
if(request.getAttribute("categoryId")!=null)
	categoryId = (Integer)request.getAttribute("categoryId");
if(request.getAttribute("currentPageNo")!=null)
	currentPageNo = (Integer)request.getAttribute("currentPageNo");
%>

<cache:cache key="<%=SITE_URL+"gallerylist/"+currentPageNo+"/"+categoryId%>" scope="application " time="611" refresh="t" >
<% 
	ArrayList photo = null;
	String currentCatName = null;
	photo = (ArrayList) CommonFunctions.latestGalleries(categoryId, 15, "0");
	if(photo != null && photo.size() > 0) {
		ContentListDTO photoDTO = (ContentListDTO) photo.get(0);
		currentCatName = photoDTO.getCurrentCategoryTitle();
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%//@include file="googleanalytics_top.jsp"%>
<html><head>
<%@include file="googleanalytics.jsp"%> 
<base href="<%=SITE_URL%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Business Today Latest News Photos Union Budget</title>
<meta name="keywords" content="Union Budget, Budget, Budget 2013, Best Finance Ministers, finance minister and india budgets, " />
<meta name="description" content="Business Today brings to you the interesting facts on India's Union Budget." />
<link rel="stylesheet" href="css/mobile.css" type="text/css">
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<% if(currentCatName != null && !"".equalsIgnoreCase(currentCatName)) {		%>
<link rel="alternate" href="http://www.businesstoday.in/photos/<%= currentCatName%>" />
<script type="text/javascript">
function canonicalUrlRedirection() {
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
}
var mobile = (/iphone|vnd.wap.xhtml+xml|sony|symbian|S60|SymbOS|nokia|samsung|mobile|windows ce|epoc|opera mini|nitro|j2me|midp-|cldc-|netfront|mot|up.browser|up.link|audiovox|blackberry|ericsson|panasonic|philips|sanyo|sharp|sie-|portalmmm|blazer|avantgo|danger|palm|series60|palmsource|pocketpc|smartphone|rover|ipaq|au-mic|alcatel|ericy|vodafone|wap1|wap2|teleca|playstation|lge|lg-|android|htc|dream|webos|bolt|nintendo|palm/i.test(navigator.userAgent.toLowerCase()));
if (!mobile) { 	canonicalUrlRedirection();	}
</script>
<% } %>
<%@include file="zedo-adCode-ros.jsp"%>
</head><body> 
<%@include file="zedo-adCode-ros-logo.jsp"%> 
<%
String categoryName="Category";
if(categoryId==187 )
{
 categoryName="Budget 2015-16";
%>
<style>
.budgetnav ul li a {
    color: #707070;
    display: block;
    font-family: Arial,Helvetica,sans-serif;
    font-size: 15px;
    line-height: 15px;
    padding: 10px 0;
}
</style>
<%@include file="budget_topnav.jsp"%>

<%
}
else
{
%>

<%@ include file="topnav.jsp"%>


<%}%>
<div style="height:8px;"></div>
<div align="center"> <%@include file="top_add.jsp" %> </div>
<div style="height:5px;"></div>
<%
if (photo != null && photo.size() > 0) {
	for (int ctr = 0; ctr < photo.size(); ctr++) {
		ContentListDTO pdto = (ContentListDTO) photo.get(ctr);
		if(ctr==0) {
%>
<div class="breadcrumb"><a href="<%=SITE_URL%>">Home</a> &raquo; <a href="<%=SITE_BASEPATH%>galleries">Photos</a> &raquo; <%=categoryName%></div>
<div style="height:5px;"></div><div style="background-color:#2E3094" class="subheading">Photos </div>

<%}%>
	<div style="text-align:center" class="phototxt">
    <div class="simgrepeat">
        <a href="<%=SITE_BASEPATH+CommonFunctions.galleryURL(pdto.getSefTitle(),1, pdto.getId())%>"><img src="<%=PHOTO_BASEPATH+pdto.getSmallImage()%>" width="144" height="130" vspace="3" border="0" ><span class="photoicon"></span></a></div>
    </div>
    <div style="text-align:center; border-bottom:1px solid #6c6c6c; padding-bottom:2px;padding-top:3px;" class="phototxt" ><a href="<%=SITE_BASEPATH+CommonFunctions.galleryURL(pdto.getSefTitle(),1, pdto.getId())%>" ><%=pdto.getTitle()%></a></div>
<%}%>
<div style="height:12px;"></div><div style="float:left; width:100%"><%@ include file="othercategories.html"%></div>
<div style="height:12px;"></div><div style="float:left; width:100%"><%@include file="hotzone.html"%></div>
<div style="float:left; width:100%"><%

if(categoryId==187 )
{
%>

<%@ include file="budget_bottomnav.html"%>

<%
}
else
{
%>

<%@ include file="bottomnav.html"%>


<%}%>
</div><%//@include file="googleanalytics_bottom.jsp"%></body>
</html>	
<%} else {
	String redirectURL = SITE_BASEPATH + "pagenotfound.jsp";
	response.sendRedirect(redirectURL);
}
%>			

</cache:cache>
