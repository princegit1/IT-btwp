<%@taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %><compress:html removeIntertagSpaces="true">
<%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %><%@page language="java" import="java.net.*, java.util.ArrayList, com.itgd.utils.*, com.itgd.dto.GalleryDTO, com.itgd.dto.ContentListDTO, com.itgd.helper.GalleryHelper"%>
<%@include file="global_include.jsp"%>
<%
String wapBaseUrl = request.getRequestURL().substring(0,request.getRequestURL().indexOf(request.getServletPath()))+"/";
int galleryId = 0;
int currentPhotoNo = 1;
int navigationFlag=0;
if(request.getAttribute("galleryId")!=null)
	galleryId = (Integer)request.getAttribute("galleryId");
if(request.getAttribute("currentPhotoNo")!=null)
	currentPhotoNo = (Integer)request.getAttribute("currentPhotoNo");
if(request.getParameter("nav")!=null)
	navigationFlag= Integer.parseInt(request.getParameter("nav").toString());
%><cache:cache key="<%=SITE_URL+"gallery/"+currentPhotoNo+"/"+galleryId%>" scope="application " time="7" refresh="t" ><%
int totalPhotoCount = 0;

String galleryTitle = "";
String galleryMetaTitle = "";
String galleryMetaKeywords = "";
String galleryMetaDescription = "" ;
String gallerySefTitle = "";
int backNo = 1;
int nextNo = 1;
int categoryId=0;
String galleryUrl="";
String imageUrl="";

ArrayList photoDetails = GalleryHelper.photoDetail(galleryId);
if (photoDetails != null && photoDetails.size() > 0) {
	GalleryDTO galleryDTO = null;
	for (int pCtr = 0; pCtr < photoDetails.size(); pCtr++) {
		galleryDTO = (GalleryDTO) photoDetails.get(pCtr);
		categoryId=galleryDTO.getCategoryId();
		if (pCtr == 0) {
			galleryMetaTitle=galleryDTO.getGalleryTitle();
			galleryMetaKeywords = galleryDTO.getMetaKeyword();
			if(galleryDTO.getPhotoMetaKeyword().trim().length() > 0)
				galleryMetaKeywords = galleryMetaKeywords + ", "+ galleryDTO.getPhotoMetaKeyword();
			galleryMetaDescription = galleryDTO.getMetaDescription();
			totalPhotoCount = galleryDTO.getPhotoCount();
		} 
	}
if(currentPhotoNo==1) {
	backNo = totalPhotoCount;
	nextNo = currentPhotoNo+1;
} else if(currentPhotoNo > 1 && currentPhotoNo <totalPhotoCount ) {
	backNo = currentPhotoNo-1;
	nextNo = currentPhotoNo+1;
} else if(currentPhotoNo==totalPhotoCount) {
	backNo = currentPhotoNo-1;
	nextNo = 1;
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%//@include file="googleanalytics_top.jsp"%>
<html><head><%@include file="topchartbeat.jsp"%>
<%@include file="googleanalytics.jsp"%> 
<base href="<%=SITE_URL%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title><%=galleryMetaTitle%></title>
<meta name="description" content="<%=galleryMetaDescription%>" />
<meta name="keywords" content="<%=galleryMetaKeywords%> " />
<link rel="stylesheet dns-prefetch" href="<%=MEDIA_CSS%>mobile-mini.css" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<%if(request.getAttribute("javax.servlet.forward.request_uri")!=null){ %>
<link rel="canonical" href="http://www.businesstoday.in<%=request.getAttribute("javax.servlet.forward.request_uri").toString().replace("/gallery/","/photoplay/")%>" />
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


<%} %>
<script type="text/javascript">
  (function() {
    var po = document.createElement("script"); po.type = "text/javascript"; po.async = true;
    po.src = "https://apis.google.com/js/plusone.js?publisherid=117119850068103661951";
    var s = document.getElementsByTagName("script")[0]; s.parentNode.insertBefore(po, s);
  })();
</script>
<script type="text/javascript">
window._taboola = window._taboola || [];
_taboola.push({photo:'auto'});
!function (e, f, u) {
e.async = 1;
e.src = u;
f.parentNode.insertBefore(e, f);
}(document.createElement('script'), document.getElementsByTagName('script')[0], 'http://cdn.taboola.com/libtrc/indiatoday-network/loader.js');
</script>
<script>
var $ImpulseID ="IMPL-ITDG-BUSINESSTODAY-WAP-GALLERY";
(function() {
var _Impulser = document.createElement('script'); _Impulser.type = 'text/javascript';
_Impulser.async = true;
_Impulser.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'impulse.forkcdn.com/impulse3/config/impulse.js';
var _scripter = document.getElementsByTagName('script')[0];
_scripter.parentNode.insertBefore(_Impulser, _scripter);
})();
</script>
<%@include file="zedo-adCode-ros.jsp"%>
</head><body> 
<%@include file="zedo-adCode-ros-logo.jsp"%>
<%
if(navigationFlag==1){}else{
if(categoryId==187 )
{
%>

<%@include file="budget_topnav.jsp"%>

<%
}
else
{
%>

<%@include file="topnav.jsp"%>


<%}}%>
<div style="height:8px;"></div>
<div align="center"> <%@include file="top_add.jsp" %> </div>
<div style="height:5px;"></div>

<%
if (photoDetails != null && photoDetails.size() > 0 && currentPhotoNo>=1 && currentPhotoNo <= totalPhotoCount) {
	for (int pCtr = 0; pCtr < photoDetails.size(); pCtr++) {
		GalleryDTO galleryDTo = (GalleryDTO) photoDetails.get(pCtr);
		galleryUrl=SITE_BASEPATH+CommonFunctions.galleryURL(galleryDTo.getGallerySefTitle(),1, galleryDTO.getGalleryId());
		imageUrl=PHOTO_BASEPATH + galleryDTo.getPhotoTitle();
		if (pCtr == currentPhotoNo-1) {
%>
<div class="breadcrumb adblock_container"> <a href="<%=SITE_URL%>">Home</a> &raquo; <a href="<%=SITE_BASEPATH%>galleries">Photos</a> &raquo; <a href="<%=SITE_BASEPATH+CommonFunctions.galleryListURL(galleryDTo.getCategorySefTitle(),1, galleryDTo.getCategoryId())%>"><%=galleryDTo.getCategoryTitle()%></a> &raquo; <%=galleryDTo.getGalleryTitle() %></div>

<div style="height:5px;"></div>
<div class="phototxt adblock_container" style=" background-color:#333333">
<div style="width:100%; text-align:center"><b><%=galleryDTo.getGalleryTitle() %></b><div style="height:5px;"></div>
<div style="clear:both"></div>
<div style="width:100%; text-align:center;margin:3px auto;">
<%if(currentPhotoNo > 1) {%>
<span><a href="<%=SITE_BASEPATH+CommonFunctions.galleryURL(galleryDTo.getGallerySefTitle(),backNo, galleryDTo.getGalleryId())%>"><img src="<%=MEDIA_CSS%>images/back.gif" alt="Back" width="27" height="27" hspace="5" border="0" align="absmiddle" style="padding-left:15px;padding-right:5px;"></a></span>
<%}%>
<span><B><%=currentPhotoNo%> of <%=galleryDTo.getPhotoCount()%></B></span>
<%if(currentPhotoNo < totalPhotoCount) {%>
<span><a href="<%=SITE_BASEPATH+CommonFunctions.galleryURL(galleryDTo.getGallerySefTitle(),nextNo, galleryDTo.getGalleryId())%>"><img src="<%=MEDIA_CSS%>images/next.gif" alt="Next" width="27" height="27" hspace="5" border="0" align="absmiddle" style="padding-right:15px; padding-left:5px;"></a></span>
<%}%>
</div>
<div style="height:5px;"></div>
</div>
<div class="phototxt" style="text-align:center"><img src="<%=PHOTO_BASEPATH+galleryDTo.getPhotoTitle() %>" width="300" border="0" id="photoid" ></div>
<div class="phototxt" id="photocap"  style="text-align:center"><%=galleryDTo.getPhotoCaption() %></div>
<div style="height:5px;"></div>
<div style="clear:both"></div>
<div style="width:100%; text-align:center; margin:3px auto;">
<%if(currentPhotoNo > 1) {%>
<span style=""><a href="<%=SITE_BASEPATH+CommonFunctions.galleryURL(galleryDTo.getGallerySefTitle(),backNo, galleryDTo.getGalleryId())%>"><img src="<%=MEDIA_CSS%>images/back.gif" alt="Back" width="27" height="27" hspace="5" border="0" align="absmiddle" style="padding-left:15px;padding-right:5px;"></a></span>
<%}%>
<span><B><%=currentPhotoNo%> of <%=galleryDTo.getPhotoCount()%></B></span>
<%if(currentPhotoNo < totalPhotoCount) {%>
<span><a href="<%=SITE_BASEPATH+CommonFunctions.galleryURL(galleryDTo.getGallerySefTitle(),nextNo, galleryDTo.getGalleryId())%>"><img src="<%=MEDIA_CSS%>images/next.gif" alt="Next" width="27" height="27" hspace="5" border="0" align="absmiddle" style="padding-right:15px; padding-left:5px;"></a></span>
<%}%>
</div>
</div>
<%}}}%>

 <div style="height:5px;"></div>
<table width="100%"  border="0" cellpadding="0" cellspacing="0"><tr><td height="5" bgcolor="#FFFFFF"></td></tr><tr><td>
<div id="taboola-mobile-below-gallery-thumbnails"></div>
<script type="text/javascript">
  window._taboola = window._taboola || [];
  _taboola.push({
    mode: 'thumbs-mobile-2r',
    container: 'taboola-mobile-below-gallery-thumbnails',
    placement: 'Mobile Below Gallery Thumbnails',
    target_type: 'mix'
  });
</script>
<div id="taboola-organic-mobile-below-gallery-thumbnails"></div>
<script type="text/javascript">
  window._taboola = window._taboola || [];
  _taboola.push({
    mode: 'organic-thumbs-mobile-2r',
    container: 'taboola-organic-mobile-below-gallery-thumbnails',
    placement: 'Mobile Below Gallery Thumbnails - Organic',
    target_type: 'mix'
  });
</script>
</td></tr></table>
 <div style="height:5px;"></div>

 <div align="center" style="width:300px;margin:0px auto"> <%@include file="story_bottom_add.jsp" %> </div>     
<div style="float:left; width:100%">
<%
ArrayList photo = (ArrayList)CommonFunctions.latestRelatedGalleries(categoryId, 5, ""+galleryId);
if (photo != null && photo.size() > 0) {
for (int ctr = 0; ctr < photo.size(); ctr++) {
ContentListDTO pdto = (ContentListDTO) photo.get(ctr);
if (ctr == 0) {%>
<table width="100%"  border="0" cellpadding="0" cellspacing="0">
<tr><td height="5" bgcolor="#FFFFFF"></td></tr>
<tr><td bgcolor="#333333" class="subheading">More Galleries </td></tr>
<tr><td height="5" bgcolor="#F5F5F5"></td></tr>
<%}%>
<tr><td  bgcolor="#FFFFFF" style="border-bottom:1px solid #DBDBDB;"><div style="margin-left:5px; line-height:20px;"><a href="<%=SITE_BASEPATH+CommonFunctions.galleryURL(pdto.getSefTitle(),1, pdto.getId())%>"><%=pdto.getTitle()%></a></div></td></tr>
<%
if (ctr == photo.size()-1) {
	out.print("<tr><td height='15'></td></tr></table>");
}
}}%>

</div>

<div style="float:left; width:100%"><%@ include file="othercategories.html"%></div>
<div style="float:left; width:100%"><%@include file="hotzone.html"%></div>
<div style="float:left; width:100%"><%@include file="ringtones.html"%></div>
<%
if(navigationFlag==1){}else{
if( categoryId==187 )
{
%>


<div style="float:left; width:100%"><%@include file="budget_bottomnav.html"%></div>

<%
}
else
{
%>
<div style="float:left; width:100%"><%@ include file="bottomnav.html"%></div>

<%}}%>
<%//@include file="googleanalytics_bottom.jsp"%>
<script src="http://media2.intoday.in/indiatoday/resources/js/jquery1.8.js" type="text/javascript"></script>
<script src="http://media2.intoday.in/indiatoday_wap/1.0.1/resources/js/ajaxinclude.js"></script>
<script type="text/javascript">ajaxinclude(SITE_BASEPATH + "adblock-gallery-ajax.html")</script>
<jsp:include page="bottomchartbeat.jsp" >
	<jsp:param value="Photos" name="chartBeatSecName"/>
	<jsp:param value="<%= StringUtil.replaceSingleQuote(StringUtil.isEmpty(galleryDTO.getCategoryTitle())) %>" name="chartBeatTitleName"/>
</jsp:include>
<script type="text/javascript">
  window._taboola = window._taboola || [];
  _taboola.push({flush: true});
</script>
</body>
</html>
 <%} else {
	 System.out.println("Gallery Page on BT WAP:: Gallery details not found for this:: "+galleryId);
	String redirectURL = SITE_BASEPATH + "pagenotfound.jsp";
	response.sendRedirect(redirectURL);
}	%>
<div itemtype="http://schema.org/ImageGallery" itemscope="">
<meta itemprop="name" content="<%=galleryMetaTitle %>"/>
<meta itemprop="description" content="<%=galleryMetaDescription %>"/>
<meta itemprop="image" content="<%=imageUrl%>"/>
<meta itemprop="publisher" content="Business Today"/>
<meta itemprop="url" content="<%=galleryUrl %>"/>
<meta itemprop="headline" content="<%=galleryMetaTitle %>"/>
<meta itemprop="inLanguage" content="en_US"/>
<meta itemprop="keywords" content="<%=galleryMetaKeywords %>"/>
</div>
</cache:cache>
</compress:html>