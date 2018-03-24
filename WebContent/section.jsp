<%@taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %><compress:html removeIntertagSpaces="true"><%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %><%@page language="java" import="java.net.*, java.util.ArrayList, com.itgd.utils.*, com.itgd.dto.StoryListDTO"%><%@include file="global_include.jsp"%><%
String wapBaseUrl = request.getRequestURL().substring(0,request.getRequestURL().indexOf(request.getServletPath()))+"/";
int sectionId = 120;
int currentPageNo = 1;

if(request.getAttribute("sectionId") != null) {
	sectionId = (Integer)request.getAttribute("sectionId");
} else if(request.getParameter("sectionid") != null) {
	sectionId = Integer.parseInt(request.getParameter("sectionid"));
}
if(request.getAttribute("currentPageNo")!=null)
	currentPageNo = (Integer)request.getAttribute("currentPageNo");
	
%><cache:cache key="<%=SITE_URL+"section/"+currentPageNo+"/"+sectionId%>" scope="application " time="1200" refresh="t" ><%
int ctrStart = 0;
int ctrToDisplay=10;
if(sectionId==4 || sectionId==128 || sectionId==119 || sectionId==67 || sectionId==134) {
	ctrStart = 3;
} 
if(sectionId==192){
	ctrToDisplay=20;
} 
int ctrToFetch=ctrStart+ctrToDisplay;
request.setAttribute("add_categoryid",sectionId);
ArrayList sAL =null;				
sAL = CommonFunctions.latestStoriesTemplate(sectionId, ctrToFetch, "0", 1);
if(sAL!=null && sAL.size()>0){
	StoryListDTO sDTO = null;
	for (int ctr=ctrStart; ctr < sAL.size(); ctr++) {
		sDTO = (StoryListDTO) sAL.get(ctr);
		if (ctr == ctrStart) {	 %>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html><head><%@include file="topchartbeat.jsp"%>
<base href="<%=SITE_URL%>"/>
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1">
<%if(sDTO.getSectionId()==4){%>
<title>Business Today: Business News, Latest Stock Market and Economy News India from Businesstoday.in</title>
<meta name="description" content="latest Business News, Indian economy News, Sensex updates, BSE, NSE, stock exchange news, Mutual Funds, investing in India, new market. Daily stock markets news, insurance, income tax filing information." />
<meta name="keywords" content="Latest Business News - Businesstoday.in one of the best business magazine in India which offers you latest updates about stocks, NSE, BSE, Top Companies, Markets, Sectors, Banking, interviews and money management tips." /><meta name="google-site-verification" content="P2lmnYzIX2lQifvTcbZbYNn5_RBHN3Y2_-h-_POOf68" />

<%}else if(sDTO.getSectionId()==84){%>
<title>Business Today: Business News, Latest Stock Market and Economy News India from Businesstoday.in</title>
<meta name="description" content="latest Business News, Indian economy News, Sensex updates, BSE, NSE, stock exchange news, Mutual Funds, investing in India, new market. Daily stock markets news, insurance, income tax filing information." />
<meta name="keywords" content="Latest Business News - Businesstoday.in one of the best business magazine in India which offers you latest updates about stocks, NSE, BSE, Top Companies, Markets, Sectors, Banking, interviews and money management tips." /><meta name="google-site-verification" content="P2lmnYzIX2lQifvTcbZbYNn5_RBHN3Y2_-h-_POOf68" />

<%}else if(sDTO.getSectionId()==110){%>
<title>Business Today: Business News, Latest Stock Market and Economy News India from Businesstoday.in</title>
<meta name="description" content="latest Business News, Indian economy News, Sensex updates, BSE, NSE, stock exchange news, Mutual Funds, investing in India, new market. Daily stock markets news, insurance, income tax filing information." />
<meta name="keywords" content="Latest Business News - Businesstoday.in one of the best business magazine in India which offers you latest updates about stocks, NSE, BSE, Top Companies, Markets, Sectors, Banking, interviews and money management tips." /><meta name="google-site-verification" content="P2lmnYzIX2lQifvTcbZbYNn5_RBHN3Y2_-h-_POOf68" />

<%}else if(sDTO.getSectionId()==67){%>
<title>Business Today: Business News, Latest Stock Market and Economy News India from Businesstoday.in</title>
<meta name="description" content="latest Business News, Indian economy News, Sensex updates, BSE, NSE, stock exchange news, Mutual Funds, investing in India, new market. Daily stock markets news, insurance, income tax filing information." />
<meta name="keywords" content="Latest Business News - Businesstoday.in one of the best business magazine in India which offers you latest updates about stocks, NSE, BSE, Top Companies, Markets, Sectors, Banking, interviews and money management tips." /><meta name="google-site-verification" content="P2lmnYzIX2lQifvTcbZbYNn5_RBHN3Y2_-h-_POOf68" />

<%}else if(sDTO.getSectionId()==103){%>
<title>Business Today: Business News, Latest Stock Market and Economy News India from Businesstoday.in</title>
<meta name="description" content="latest Business News, Indian economy News, Sensex updates, BSE, NSE, stock exchange news, Mutual Funds, investing in India, new market. Daily stock markets news, insurance, income tax filing information." />
<meta name="keywords" content="Latest Business News - Businesstoday.in one of the best business magazine in India which offers you latest updates about stocks, NSE, BSE, Top Companies, Markets, Sectors, Banking, interviews and money management tips." /><meta name="google-site-verification" content="P2lmnYzIX2lQifvTcbZbYNn5_RBHN3Y2_-h-_POOf68" />

<%}else if(sDTO.getSectionId()==114){%>
<title>Business Today: Business News, Latest Stock Market and Economy News India from Businesstoday.in</title>
<meta name="description" content="latest Business News, Indian economy News, Sensex updates, BSE, NSE, stock exchange news, Mutual Funds, investing in India, new market. Daily stock markets news, insurance, income tax filing information." />
<meta name="keywords" content="Latest Business News - Businesstoday.in one of the best business magazine in India which offers you latest updates about stocks, NSE, BSE, Top Companies, Markets, Sectors, Banking, interviews and money management tips." /><meta name="google-site-verification" content="P2lmnYzIX2lQifvTcbZbYNn5_RBHN3Y2_-h-_POOf68" />

<%}else if(sDTO.getSectionId()==113){%>
<title>Business Today: Business News, Latest Stock Market and Economy News India from Businesstoday.in</title>
<meta name="description" content="latest Business News, Indian economy News, Sensex updates, BSE, NSE, stock exchange news, Mutual Funds, investing in India, new market. Daily stock markets news, insurance, income tax filing information." />
<meta name="keywords" content="Latest Business News - Businesstoday.in one of the best business magazine in India which offers you latest updates about stocks, NSE, BSE, Top Companies, Markets, Sectors, Banking, interviews and money management tips." /><meta name="google-site-verification" content="P2lmnYzIX2lQifvTcbZbYNn5_RBHN3Y2_-h-_POOf68" />

<%}else {%>
<title><%=sDTO.getMetaTitle()%></title>
<meta name="description" content="<%=sDTO.getMetaDescription()%>" />
<meta name="keywords" content="<%=sDTO.getMetaKeyword()%> " />
<%}%>
<link rel="stylesheet dns-prefetch" href="<%=MEDIA_CSS%>mobile-mini.css" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
  (function() {
    var po = document.createElement("script"); po.type = "text/javascript"; po.async = true;
    po.src = "https://apis.google.com/js/plusone.js?publisherid=117119850068103661951";
    var s = document.getElementsByTagName("script")[0]; s.parentNode.insertBefore(po, s);
  })();
</script>
<jsp:include page="ga-comscore.jsp" flush="false"></jsp:include>
<%@include file="zedo-adCode-ros.jsp"%>
</head><body> 
<%@include file="zedo-adCode-ros-logo.jsp"%>
<%@ include file="common-topnav.jsp"%>
<%sectionNameforAddDisplay=sDTO.getSectionTitle();%>
<div style="height:8px;"></div>
<div align="center"> <%@include file="top_add.jsp" %> </div>
<div style="height:5px;"></div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr><td height="8"></td></tr>
<tr><td class="breadcrumb">
<% if(sDTO.getSectionTitle().equals("magazine")) { %>
	<a href="<%=SITE_URL%>">Home</a> &raquo; Magazine
<% } else { %>
	<a href="<%=SITE_URL%>">Home</a> &raquo; <%=sDTO.getSectionTitle()%>
<% } %>
</td></tr>

<tr><td height="7"></td></tr><tr><td bgcolor="#2E3094" class="subheading"><%=sDTO.getSectionTitle()%> </td></tr>
<% }
	if(!sDTO.getTitle().contains("http://")){%>
		<tr><td  bgcolor="#FFFFFF" style="border-bottom:1px solid #DBDBDB;"><div style="margin-left:5px; line-height:20px;">
	<%if(sDTO.getImage().trim().length() > 0) {%>
		<a href="<%=SITE_BASEPATH+CommonFunctions.storyURL(sDTO.getSefTitle(),1, sDTO.getId())%>"><img rel="prefetch" src="<%=STORY_IMAGE_BASEPATH+sDTO.getImage().trim()%>" width="80" height="80" align="left" style="margin:0 8px 0 2px; border:0;"/></a>
	<% } else {%>
		<a href="<%=SITE_BASEPATH+CommonFunctions.storyURL(sDTO.getSefTitle(),1, sDTO.getId())%>"><img rel="prefetch" src="<%=NO_IMG_88x66%>" width="80" height="66" align="left" style="margin:0 8px 0 2px; border:0;"/></a>
	<% }%>
	<a href="<%=SITE_BASEPATH+CommonFunctions.storyURL(sDTO.getSefTitle(),1, sDTO.getId())%>"><span class="story-title"><%=sDTO.getTitle()%></span></a>
	</div></td></tr>
<%}}%>
<tr><td align="center">
</td></tr>
</table><div style="height:12px;"></div> <%@ include file="othercategories.html"%> <div style="height:12px;"></div>  <%@include file="hotzone.html"%>  <%@include file="ringtones.html"%>  <%@ include file="common-bottomnav.html"%>
<script async type="text/javascript" src="<%= MEDIA_JS %>jquery-1.4.2.min.js"></script>
<jsp:include page = "bottomchartbeat.jsp"><jsp:param value="<%=sDTO.getSectionTitle()%>" name="chartBeatSecName"/> </jsp:include> 
</body>
</html>
<% } else {
	String redirectURL = SITE_BASEPATH + "pagenotfound.jsp";
	response.sendRedirect(redirectURL);
}
%>
</cache:cache>
</compress:html>