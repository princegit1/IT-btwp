<%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %>
<%@page language="java" import="java.net.*, java.util.ArrayList, com.itgd.utils.*, com.itgd.dto.ContentListDTO"%>
<%@include file="global_include.jsp"%>
<cache:cache key="<%=SITE_URL+"index2.jsp"%>" scope="application" time="300" refresh="t">
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<%@include file="googleanalytics_top.jsp"%> 
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="refresh" content="300" />
<title>Business Today: Business News, Latest Stock Market and Economy News India from Businesstoday.in</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="description" content="latest Business News, Indian economy News, Sensex updates, BSE, NSE, stock exchange news, Mutual Funds, investing in India, new market. Daily stock markets news, insurance, income tax filing information." />
<meta name="keywords" content="Latest Business News - Businesstoday.in one of the best business magazine in India which offers you latest updates about stocks, NSE, BSE, Top Companies, Markets, Sectors, Banking, interviews and money management tips." /><meta name="google-site-verification" content="P2lmnYzIX2lQifvTcbZbYNn5_RBHN3Y2_-h-_POOf68" />
<meta name="msvalidate.01" content="28AD13B9E2353694C455F57D02382A94" />
<link rel="canonical" href="http://businesstoday.intoday.in" />
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
<link rel="stylesheet" href="css/mobile.css" type="text/css">
<style>
.heading{width:100%; background:#2e3094; color:white;}
.heading a{color:white;}
.heading h2{ margin-left:6px;}
.caption-wrapper{width:88px; height:66px; position:relative; float:left; margin-right:12px;}
.caption-video{width:23px; height:23px;  position:absolute; bottom:2px; right:2px; background:url(http://media2.intoday.in/businesstoday/mobile/vid-cap.png) no-repeat}
.subheadings h2{ font-size:15px;}
.subheadings h2:hover{ color:white !important}
.subheading A{color:white !important}
.subheading{background: none repeat scroll 0 0 #2e3094; color:white !important}
</style>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script> 
<script type="text/javascript" src="js/jquery.cycle.all.min.js"></script>
<script type="text/javascript" src="js/jquery.touchwipe.js"></script>
<meta name="viewport" id="viewport" content="width=device-width; initial-scale=1.0; minimum-scale=1.0; maximum-scale=1.0; user-scalable=no;"></meta>
<script type="text/javascript">
  (function() {
    var po = document.createElement("script"); po.type = "text/javascript"; po.async = true;
    po.src = "https://apis.google.com/js/plusone.js?publisherid=117119850068103661951";
    var s = document.getElementsByTagName("script")[0]; s.parentNode.insertBefore(po, s);
  })();
</script>
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script><ins class="adsbygoogle"
    style="display:none"
    data-ad-client="ca-google"
    data-reactive-ad-format="1"
    data-ad-channel=�3679332217�></ins>
<script>(adsbygoogle = window.adsbygoogle || []).push({});</script>
</head><body>  
 <a href="http://m.indiatoday.in/missedcallbt.jsp" target="_blank">
    <img src="http://media2.intoday.in/microsites/promotions/BT_App.jpg" border="0" />
 </a>
<%@include file="topnav.jsp"%>
<div style="height:8px;"></div>
<div align="center" style="width:300px;margin:0px auto"> <%@include file="top_add.jsp" %> </div>

<div id="dispscrolltext" style="width:100%; text-align:center"> 
         <a href="http://goo.gl/YGfJHv" target="_blank" rel="nofollow"><img src="http://media2.intoday.in/aajtak/itg_ucweb.png"/><u><span id="myQuote" style="color:#000; padding-left:7px;"></span></u></a>
        <!--<script src="http://media2.intoday.in/indiatoday/js/jquery.min.1.8.2.js" type="text/javascript"></script>-->
        <script language="javascript">
        var myQuotes = new Array();
        myQuotes[0] = "Download world's Fastest UC Browser-FREE";
        myQuotes[1] = "Catch Live Scores on UC Browser! Download Now!!";
        myQuotes[2] = "Best News Reading Experience! Click to Download UC Browser";
        myQuotes[3] = "Catch latest Bollywood Gossip on UC Browser! Click to Download";
        myQuotes[4] = "Download Free Music & Video! Click to Download UC Browser";
        var myRandom = Math.floor(Math.random()*myQuotes.length);        
        $('#myQuote').html(myQuotes[myRandom]);
        </script> 
	 </div>

<div style="height:8px;"></div>
<%@include file="breakingnews.jsp"%>
<div style="height:8px;"></div>

 <%@include file="market_xml_reader.jsp" %> 
 <div style="height:8px;"></div>
 
 
 <div style="height:8px;"></div>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">


<%
ArrayList contentAL = null;
contentAL = (ArrayList)CommonFunctions.latestStories("99", 2, "0");
if (contentAL != null && contentAL.size() > 0) {
	for (int ctr = 0; ctr < contentAL.size(); ctr++) {
		ContentListDTO cDTO = (ContentListDTO) contentAL.get(ctr);
		if (ctr == 0) {%>
			<tr><td height="22" bgcolor="#2E3094" class="subheading"><a href="<%=SITE_BASEPATH+CommonFunctions.sectionURL(cDTO.getCurrentCategorySefTitle(),1, cDTO.getCurrentCategoryId())%>" class="subheading">BIG STORY</a></td></tr>	<tr><td height="5" bgcolor="#FFFFFF"></td></tr>
		<%}%>
			<tr><td bgcolor="#FFFFFF" style="border-bottom:1px solid #DBDBDB;">
				<%if(cDTO.getImage().trim().length() > 0) {%>
					<a href="<%=SITE_BASEPATH+CommonFunctions.storyURL(cDTO.getSefTitle(),1, cDTO.getId())%>"><img src="<%=STORY_IMAGE_BASEPATH+cDTO.getImage().trim()%>" width="80" height="80" align="left" style="margin:0 8px 0 2px; border:0;"/></a>
			<% } else {%>
					<a href="<%=SITE_BASEPATH+CommonFunctions.storyURL(cDTO.getSefTitle(),1, cDTO.getId())%>"><img src="<%=NO_IMG_88x66%>" width="80" height="80" align="left" style="margin:0 8px 0 2px; border:0;"/></a>
			<% }%>
			<div class="story-title"><a href="<%=SITE_BASEPATH+CommonFunctions.storyURL(cDTO.getSefTitle(),1, cDTO.getId())%>"><%=cDTO.getTitle()%></a></div>
			<br/><div style="font-size:13px; margin-top:2px;"><%=cDTO.getFullDescription()%></div></td></tr>
<%}}%>
<tr>
<td bgcolor="#ffffff" style="PADDING-LEFT: 2px; BORDER-BOTTOM: #c7c7c7 1px solid" class="more"><a href="<%=SITE_BASEPATH%>section/99/1/big-story.html">more &raquo;</a></td> 
<tr>
<tr><td align="center" style="padding-top:5px;"><%//@include file="top_banner.jsp" %><div style="height:8px;"></div></td></tr>

<%contentAL = (ArrayList)CommonFunctions.latestStories("105", 6, "0");
if (contentAL != null && contentAL.size() > 0) {
	for (int ctr = 0; ctr < contentAL.size(); ctr++) {
		ContentListDTO cDTO = (ContentListDTO) contentAL.get(ctr);
if (ctr == 0) {%>
			
        
 <%--<tr>
 	<td align="center"> 
    <a href="http://businesstoday.intoday.in/budget/">
<img src="http://media2.intoday.in/btmt/Vote_on_account.jpg" height="90" width="320" border="0">
</a>
    </td>
 </tr>--%>
  
            
            <tr><td height="22" bgcolor="#2E3094" class="subheading"><a href="<%=SITE_BASEPATH+CommonFunctions.sectionURL(cDTO.getCurrentCategorySefTitle(),1, cDTO.getCurrentCategoryId())%>" class="subheading">LATEST NEWS</a></td></tr>	<tr><td height="5" bgcolor="#FFFFFF"></td></tr>
		<%}%>
			<tr><td bgcolor="#FFFFFF" style="border-bottom:1px solid #DBDBDB;">
							<%if(cDTO.getImage().trim().length() > 0) {%>
					<a href="<%=SITE_BASEPATH+CommonFunctions.storyURL(cDTO.getSefTitle(),1, cDTO.getId())%>"><img src="<%=STORY_IMAGE_BASEPATH+cDTO.getImage().trim()%>" width="80" height="80" align="left" style="margin:0 8px 0 2px; border:0;"/></a>
			<% } else {%>
					<a href="<%=SITE_BASEPATH+CommonFunctions.storyURL(cDTO.getSefTitle(),1, cDTO.getId())%>"><img src="<%=NO_IMG_88x66%>" width="80" height="80" align="left" style="margin:0 8px 0 2px; border:0;"/></a>
			<% }%>
			<div class="story-title"><a href="<%=SITE_BASEPATH+CommonFunctions.storyURL(cDTO.getSefTitle(),1, cDTO.getId())%>"><%=cDTO.getTitle()%></a></div></td></tr>
<%}}%>

<tr>
<td bgcolor="#ffffff" style="PADDING-LEFT: 2px; BORDER-BOTTOM: #c7c7c7 1px solid" class="more"><a href="<%=SITE_BASEPATH%>section/105/1/latest-headlines.html">more &raquo;</a></td> 
<tr>
            <td bgcolor="#F5F8F8" class="grouptxt" style="border-bottom:1px solid #C7C7C7; padding:2px;"><span style="color:#D71920; font-weight:bold ">Others:</span><a href="<%=SITE_BASEPATH+CommonFunctions.categoryURL("economy",1, 67)%>">Economy</a> | <a href="<%=SITE_BASEPATH+CommonFunctions.sectionURL("industry",1, 101)%>">Industry</a> | <a href="<%=SITE_BASEPATH+CommonFunctions.categoryURL("stocks",1, 63)%>">Stocks</a> | <a href="<%=SITE_BASEPATH+CommonFunctions.categoryURL("mutual-funds",1, 62)%>">Mutual funds</a> | <a href="<%=SITE_BASEPATH+CommonFunctions.categoryURL("jobs",1, 41)%>">Jobs</a> | <a href="<%=SITE_BASEPATH%>galleries">Photos</a></td>
  </tr> 


<!--<tr><td align="center"><div style="height:5px;"></div></td></tr>
<tr><td><span style="background-color:#006699; font:bold 12px arial; color:#ffffff;padding:2px 4px; margin-left:3px;"><a style="text-decoration:none; color:#FFFFFF;" href="http://bit.ly/17GAybt" target="_blank" rel="nofollow" >Download UC Browser! Win i-Phone5s</a></span></td></tr>
<tr><td align="center"><div style="height:5px;"></div></td></tr>-->


</table>


<!--From Special  -->
<div style="height:12px;"></div>
<!--<div style="width:300px;margin:0px auto;right:0px;">
<a href="http://bschools.businesstoday.in/" target="_blank">
<img src="http://media2.intoday.in/businesstoday/bschools/B_School_Banner_300.gif" />
</a>
</div>
<div style="height:12px;"></div>
--><!--From The Mag  -->
<jsp:include page="latest_stories_chunk.jsp" flush="true" >
	<jsp:param name="categoryId" value="110" /> 
	<jsp:param name="contentCount" value="3" /> 
	<jsp:param name="storyIdToAvoid" value="0" /> 
</jsp:include>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">

<tr>
            <td bgcolor="#F5F8F8" class="grouptxt" style="border-bottom:1px solid #C7C7C7; padding:2px;"><span style="color:#D71920; font-weight:bold">Others:</span><a href="<%=SITE_BASEPATH+CommonFunctions.categoryURL("news",1, 57)%>">News </a> | <a href="<%=SITE_BASEPATH+CommonFunctions.categoryURL("launches ",1, 58)%>">Launches </a> | <a href="<%=SITE_BASEPATH+CommonFunctions.categoryURL("reviews ",1, 59)%>">Reviews </a> </td>
  </tr> 
<tr><td align="center"><div style="height:5px;"></div></td> </tr>

</table>


<!--Technology chunk  -->

<jsp:include page="latest_stories_chunk.jsp" flush="true" >
	<jsp:param name="categoryId" value="153#672" /> 
	<jsp:param name="contentCount" value="3" /> 
	<jsp:param name="storyIdToAvoid" value="0" /> 
</jsp:include>

<!--Budget chunk  -->
<!--<jsp:include page="latest_stories_chunk.jsp" flush="true" >
	<jsp:param name="categoryId" value="178" />  
	<jsp:param name="contentCount" value="3" /> 
	<jsp:param name="storyIdToAvoid" value="0" /> 
</jsp:include>-->

<!--Gallery   -->
 
<div style="height:12px;"></div>
<div align="center" style="width:300px;margin:0px auto"> <%@include file="middle_add.jsp" %> </div>
<div style="height:8px;"></div>
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
	out.print("<tr><td align='center' valign='top' bgcolor='#FFFFFF' style='border-bottom:1px solid #DBDBDB;'><div class='homegallery'><div class='arr-left'><a id='prev' href=\"#\"><img src=\"images/left-arrow-new.gif\" border='0'></a></div><div class='arr-right'><a id='next' href=\"#\"><img src=\"images/right-arrow-new.gif\" border='0'></a></div><div id='imagegallery' >");
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

<jsp:include page="latest_stories_chunk.jsp" flush="true" >
	<jsp:param name="categoryId" value="109" />  
	<jsp:param name="contentCount" value="3" /> 
	<jsp:param name="storyIdToAvoid" value="0" /> 
</jsp:include>

<!--Money  -->
<!--<jsp:include page="latest_stories_chunk.jsp" flush="true" >
	<jsp:param name="categoryId" value="153#618" /> 
	<jsp:param name="contentCount" value="3" /> 
	<jsp:param name="storyIdToAvoid" value="0" /> 
</jsp:include>-->

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

<tr>
            <td bgcolor="#F5F8F8" class="grouptxt" style="border-bottom:1px solid #C7C7C7; padding:2px;"><span style="color:#D71920; font-weight:bold">Others:</span><a href="<%=SITE_BASEPATH+CommonFunctions.categoryURL("banking ",1, 54)%>">Banking</a> | <a href="<%=SITE_BASEPATH+CommonFunctions.categoryURL("tax",1, 52)%>">Tax </a> | <a href="<%=SITE_BASEPATH+CommonFunctions.categoryURL("insurance ",1, 53)%>">Insurance</a> | <a href="<%=SITE_BASEPATH+CommonFunctions.categoryURL("retirement",1, 55)%>">Retirement</a> | <a href="<%=SITE_BASEPATH+CommonFunctions.categoryURL("reale-state",1, 56)%>">Real Estate </a> </td>
  </tr> 
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
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr height="1">
            <td height="1" bgcolor="#2E3094"></td>
          </tr>
          <tr>
            <td class="copyright"><img src="http://media2.intoday.in/businesstoday/images/logo/footlogo.gif" border="0" align="left" hspace="5" alt="India Today Group" title="India Today Group">Copyright � 2014 Living Media India Limited.</td>
          </tr>
    </table>
	<%@include file="googleanalytics_bottom.jsp"%>
    <script>
         function footerValidateSearch(modsearch)
          {
                   var srchtextvalue = document.getElementById(modsearch);
                   if(srchtextvalue.value=='') {
                             alert('Please enter text to search.');
                             return false;
                   }
                   if(srchtextvalue.value!='') {
                             if(srchtextvalue.value!='') {
                                      var x=srchtextvalue.value;
                                      var y = '';
                                      var iChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ";
                                      for (var i = 0; i < x.length; i++) {
                                                if (!(iChars.indexOf(x.charAt(i)) != -1)) {
                                                } else {
                                                          y += x.charAt(i);
                                                }
                                      }
                               srchtextvalue.value = y;
                             }
                   }
                   return true;
          }
</script>
<script type="text/javascript"><!--
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
// --></script>
</body>
</html>   
</cache:cache>
	




