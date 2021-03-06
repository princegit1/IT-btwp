<%@taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %><compress:html removeIntertagSpaces="true"><%@taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %>
<%@page language="java" import="java.util.ArrayList, java.util.List, java.text.SimpleDateFormat, java.util.TimeZone, com.itgd.dto.StoryDTO, com.itgd.dto.ContentListDTO, com.itgd.dto.RelatedContentDTO, com.itgd.helper.StoryHelper, com.itgd.dto.ByLineDTO, org.apache.commons.codec.binary.Base64, java.net.URLEncoder, com.itgd.utils.CommonFunctions, com.itgd.utils.CommonUtilFunctions, com.itgd.utils.StringUtil, com.itgd.utils.Constants, java.util.Date "%>
<%@include file="global_include.jsp"%><%
String baseUrl = request.getRequestURL().substring(0,request.getRequestURL().indexOf(request.getServletPath()))+"/";	
int id=0;
int currentPageNumber=1;
int issueId=0;
int settSecId=0;
int appsFlag=0;
String issueDate="";
int navigationFlag=0;
if(request.getAttribute("storyId")!=null)
	id = (Integer)request.getAttribute("storyId");

if(request.getParameter("storyid")!=null)
	id = Integer.parseInt(request.getParameter("storyid")); 

if(request.getAttribute("currentPageNumber")!=null)
	currentPageNumber = (Integer)request.getAttribute("currentPageNumber");

if(request.getParameter("page")!=null)
	currentPageNumber = Integer.parseInt(request.getParameter("page"));

if(request.getParameter("nav")!=null)
	navigationFlag= Integer.parseInt(request.getParameter("nav").toString());
			
String storybody="";
String primaryCategory = "0";
String primaryCategoryNew = "0";
int primaryCategoryData=0;
String vuukleSectionTags ="";
String VuukleAuthorData="";
String VuukleAuthorDatacomma ="";
List<ByLineDTO> bylineDTOList = new ArrayList<ByLineDTO>();
int syndicate = 0;
%><cache:cache key="<%=SITE_URL+"story/"+currentPageNumber+"/"+navigationFlag+"/"+id%>" scope="application " time="0" refresh="t" ><%
ArrayList storyData = (ArrayList) StoryHelper.storyDetail(id, 1);
if (storyData != null && storyData.size() > 0) {
	for (int i = 0; i < storyData.size(); i++) {
		StoryDTO aDTO = (StoryDTO) storyData.get(i);
		storybody=aDTO.getFullDescription();
		if(aDTO.getPrimaryCategory()!=null && aDTO.getPrimaryCategory().indexOf("#")>0) {
			primaryCategoryNew=aDTO.getPrimaryCategory().split("#")[1];
		}
		appsFlag=aDTO.getAppsFlag();
		ArrayList resultPreviousNext = (ArrayList) StoryHelper.GetNextPreviousArticle(aDTO.getPrimaryCategory().replaceAll("#","~"), id);
		String previousLabel="";
		String nextLabel="";
		primaryCategoryData=Integer.parseInt(primaryCategoryNew);
		request.setAttribute("add_categoryid",primaryCategoryData);
		syndicate = aDTO.getSyndicate(); 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" id="viewport" content="width=device-width; initial-scale=1.0; minimum-scale=1.0; maximum-scale=1.0; user-scalable=no;"></meta>
<script async src="http://vuukle.com/js/vuukle.js" type="text/javascript"></script> 
<base href="<%=baseUrl%>"/>
<META http-equiv="Content-Type" content="text/html;charset=iso-8859-1">
<title><%=aDTO.getTitleAlias()%></title>
<meta name="description" content="<%=aDTO.getMetaDescription().replaceAll("\\<.*?>","")%>" />
<meta name="keywords" content="<%=aDTO.getMetaKeyword().replaceAll("\\<.*?>","")%> " />
<!-- Css optimization begin -->
<script> var cb = function() {var l = document.createElement('link'); l.rel = 'stylesheet dns-prefetch';   
    l.href = '<%=MEDIA_CSS+"mobile-mini.css"%>'; 
    var h = document.getElementsByTagName('head')[0]; h.parentNode.insertBefore(l, h); };
    var raf = requestAnimationFrame || mozRequestAnimationFrame ||
              webkitRequestAnimationFrame || msRequestAnimationFrame;
    if (raf) raf(cb);
    else window.addEventListener('load', cb);
</script> 
<!-- Css optimization end --> 
<!--<script type="text/javascript" src="<%//=MEDIA_JS+"jquery-1.4.2.min.js"%>"></script>-->
<meta name="viewport" id="viewport" content="width=device-width; initial-scale=1.0; minimum-scale=1.0; maximum-scale=1.0; user-scalable=no;"></meta>
<%if(request.getAttribute("javax.servlet.forward.request_uri")!=null){ %>
	<link rel="canonical" href="http://www.businesstoday.in/<%=CommonUtilFunctions.suggestedStoryUrl(aDTO.getId())%>" />      
	<script type="text/javascript">
	function canonicalUrlRedirection() {
		var canonicalUrl = "";
		var links = document.getElementsByTagName("link");      
		for (var i = 0; i < links.length; i ++) { if (links[i].getAttribute("rel") == "canonical") { canonicalUrl = links[i].getAttribute("href"); break; } }
		if (canonicalUrl != "") { window.location.href = canonicalUrl; }
	}
	var mobile = (/iphone|vnd.wap.xhtml+xml|sony|symbian|S60|SymbOS|nokia|samsung|mobile|windows ce|epoc|opera mini|nitro|j2me|midp-|cldc-|netfront|mot|up.browser|up.link|audiovox|blackberry|ericsson|panasonic|philips|sanyo|sharp|sie-|portalmmm|blazer|avantgo|danger|palm|series60|palmsource|pocketpc|smartphone|rover|ipaq|au-mic|alcatel|ericy|vodafone|wap1|wap2|teleca|playstation|lge|lg-|android|htc|dream|webos|bolt|nintendo|palm/i.test(navigator.userAgent.toLowerCase()));
	if (!mobile) {   canonicalUrlRedirection();  }
	</script>
<% } %>

<script type="text/javascript">(function() { var po = document.createElement("script"); po.type = "text/javascript"; po.async = true; po.src = "https://apis.google.com/js/plusone.js?publisherid=117119850068103661951"; var s = document.getElementsByTagName("script")[0]; s.parentNode.insertBefore(po, s); })();</script>
<script type="text/javascript">window._taboola = window._taboola || []; _taboola.push({article:'auto'}); !function (e, f, u) { e.async = 1; e.src = u; f.parentNode.insertBefore(e, f); }(document.createElement('script'), document.getElementsByTagName('script')[0], 'http://cdn.taboola.com/libtrc/indiatoday-network/loader.js');</script>
<script>
var $ImpulseID ="IMPL-ITDG-BUSINESSTODAY-WAP-ARTICLE";
(function() {
var _Impulser = document.createElement('script'); _Impulser.type = 'text/javascript';
_Impulser.async = true;
_Impulser.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'impulse.forkcdn.com/impulse3/config/impulse.js';
var _scripter = document.getElementsByTagName('script')[0];
_scripter.parentNode.insertBefore(_Impulser, _scripter);
})();
</script>
<script async src="https://www.isapi.solutions/scripts/AdService_indiatoday.js"></script>
<jsp:include page="ga-comscore.jsp" flush="false"></jsp:include>
<!-- Zedo Async Add Code begin -->
<script type="text/javascript">
 var zmt_mtag;
function zd_get_placements(){
 zmt_mtag = zmt_get_tag(821,"477283");
 p477283_1 = zmt_mtag.zmt_get_placement("zt_477283_1", "477283", "1" , "1532" , "95" , "9" ,"320", "50");
 p477283_2 = zmt_mtag.zmt_get_placement("zt_477283_2", "477283", "2" , "1535" , "95" , "9" ,"320", "50");
 p477283_3 = zmt_mtag.zmt_get_placement("zt_477283_3", "477283", "3" , "2242" , "83" , "9" ,"1", "1");
 p477283_4 = zmt_mtag.zmt_get_placement("zt_477283_4", "477283", "4" , "1532" , "95" , "9" ,"320", "50");
 zmt_mtag.zmt_set_async();
 zmt_mtag.zmt_load(zmt_mtag); 
} 
</script> 
<script type="text/javascript" src="http://xp1.zedo.com/client/xp1/fmos.js" async ></script>
<!-- Zedo Async Add Code End -->
</head><body> 
<%@include file="zedo-adCode-ros-logo.jsp"%>
<% if(navigationFlag==1){}else{ if( primaryCategoryNew!=null && (primaryCategoryNew.equals("702") || primaryCategoryNew.equals("679") || primaryCategoryNew.equals("698") || primaryCategoryNew.equals("696") || primaryCategoryNew.equals("708"))) {	%>
<%@include file="budget_topnav.jsp"%>
<% } else { %>
<%@ include file="common-topnav.jsp"%>
<%}}%>
<div style="height:8px;"></div>
<div align="center" style="width:300px;margin:0px auto"><%@include file="top_add.jsp" %> </div>
<div style="height:5px;"></div>
<table cellpadding="0" cellspacing="0" width="100%">
<tr><td class="breadcrumb"> <a href="<%=SITE_URL%>">Home</a> &raquo;
<a href="<%=Constants.SITE_URL + CommonFunctions.sectionURL(aDTO.getSectionSefTitle(), 1, aDTO.getSectionId()) %>"><%=aDTO.getSectionTitle() %></a>&raquo;
<%	if(aDTO.getPrimaryCategoryLength() >= 2) {	%>
		<a href="<%=Constants.SITE_URL + CommonFunctions.categoryURL(aDTO.getCategorySefTitle(), 1, aDTO.getCategoryId())%>"><%=aDTO.getCategoryTitle()%></a> &raquo;
<%	} 
    if(aDTO.getPrimaryCategoryLength() >= 3) {	%>	
		<a href="<%= Constants.SITE_URL + CommonFunctions.subCategoryURL(aDTO.getSubCategorySefTitle(), 1, aDTO.getSubCategoryId())%>"><%= aDTO.getSubCategoryTitle()%></a> &raquo;
<%	} 
	if(aDTO.getPrimaryCategoryLength() == 4) {	%>	
		<a href="<%= Constants.SITE_URL + CommonFunctions.subSubCategoryURL(aDTO.getSubSubCategorySefTitle(), 1, aDTO.getSubSubCategoryId())%>"><%= aDTO.getSubSubCategoryTitle()%></a> &raquo;
<%	} %>Story</td></tr>
<%  if (!StringUtil.isBlank(aDTO.getCourtesy())){ %>
		<tr><td  valign="top" style="padding:5px 0 0 2px;"><div style="font:normal 12px Arial;  text-align:left;">&nbsp;Courtesy: <span class="courtesy"><%=aDTO.getCourtesy().replaceAll("\\<.*?>","") %></span></div></td></tr>
<%	} %>
<tr><td class="storyHeadline"><%=aDTO.getTitleAlias()%></td></tr>
<%
	String syndicateFrom = "";
	if(syndicate == 0) {syndicateFrom = "Agency";} else {syndicateFrom = "Internal";}
	bylineDTOList = StoryHelper.getAuthorBylineData(id);
	if(bylineDTOList != null && bylineDTOList.size() > 0) {
		for(ByLineDTO authorBylineData: bylineDTOList) {
			if(!StringUtil.isBlank(authorBylineData.getAuthorName())) {
				VuukleAuthorData =  VuukleAuthorData + VuukleAuthorDatacomma +" { \"name\": \"" + authorBylineData.getAuthorName() +" \",";
	            VuukleAuthorData = VuukleAuthorData +"   \"email\": \"" + authorBylineData.getAuthorEmail() +" \",";
	            VuukleAuthorData = VuukleAuthorData +"   \"type\": \"" + syndicateFrom +" \"}";
	            VuukleAuthorDatacomma =",";
			}
		}
	} else if(!StringUtil.isBlank(aDTO.getByline()) || !StringUtil.isBlank(aDTO.getCity()) || !StringUtil.isBlank(aDTO.getCreatedDate())) {
		VuukleAuthorData = " { \"name\": \"" +aDTO.getByline() +" \","; 
		VuukleAuthorData = VuukleAuthorData +"   \"type\": \"" + syndicateFrom +" \"}";	%>
		<tr><td class="storystrap">	 
<%		if(aDTO.getByline().trim().length() > 0) { out.print(aDTO.getByline()); }
		if(aDTO.getCity().trim().length() > 0 || aDTO.getCreatedDate().trim().length() > 0) { 
		if(aDTO.getByline().trim().length() > 0) {	%> <br><span style="color:#9e9e9e"> <% } 
		if(aDTO.getCity().trim().length() > 0) { out.print(aDTO.getCity()); }
		if(!StringUtil.isBlank(aDTO.getCreatedDate())) { if(aDTO.getCity().trim().length() > 0) { out.print(", "); }
		if(aDTO.getIssueId()>0) { out.println("Edition:"+aDTO.getIssueDate()); } else { out.print(aDTO.getCreatedDate()+" | "+aDTO.getCreatedTime()+" IST"); } }	%>
			</span>
<%		}
	} %>
</td></tr>         
<tr><td>   
<div class="socialstrip">
<ul>
<a href="https://facebook.com/sharer.php?u=<%=Constants.SITE_URL + CommonFunctions.storyURL(aDTO.getSefTitle(),1, aDTO.getId()) %>"><img src="<%=MEDIA_CSS%>images/story_facebook.jpg"></a>
<a style="margin:0 5px;" href="https://twitter.com/intent/tweet?url=<%=Constants.SITE_URL + CommonFunctions.storyURL(aDTO.getSefTitle(),1, aDTO.getId()) %>&amp;text=<%=aDTO.getTitleAlias() %>&amp;via=indiatoday" target="_blank"><img src="<%=MEDIA_CSS%>images/story_twitter.jpg"></a>
<a target="_blank" href="https://plus.google.com/share?url=<%=Constants.SITE_URL + CommonFunctions.storyURL(aDTO.getSefTitle(),1, aDTO.getId()) %>" data-value-share="Google" ><img src="<%=MEDIA_CSS%>images/story_gplus.jpg"></a>
</ul>
</div>	
</td></tr>
<tr><td height="5"></td></tr>
<% if (resultPreviousNext != null && resultPreviousNext.size() > 0) {	%>
	<tr><td><div style="width:100%; text-align:center;"><div class="nptitle">
<%	for (int counterPreArticle = 0; counterPreArticle < resultPreviousNext.size(); counterPreArticle++) {
		ContentListDTO stBean = (ContentListDTO) resultPreviousNext.get(counterPreArticle);
		if(!StringUtil.isBlank(stBean.getContentType()) && stBean.getContentType().equals("previous")) {
			if(!StringUtil.isBlank(stBean.getSefTitle())) {		%>
				<a href="<%= Constants.SITE_URL + CommonFunctions.storyURL(stBean.getSefTitle(),1, stBean.getId())%>"><img rel="prefetch" src="<%=MEDIA_CSS%>images/back.gif" alt="Back" width="27" height="27" hspace="5" border="0" align="left" ></a>
<%			} 
		}
		if(counterPreArticle == 0) {	%> <a href="<%= Constants.SITE_URL %>">HOME</a><%		}
		if(!StringUtil.isBlank(stBean.getContentType()) && stBean.getContentType().equals("next")) {
			if(!StringUtil.isBlank(stBean.getSefTitle())) {		%>
				<a href="<%= Constants.SITE_URL + CommonFunctions.storyURL(stBean.getSefTitle(),1, stBean.getId())%> "><img rel="prefetch" src="<%=MEDIA_CSS%>images/next.gif" alt="Back" width="27" height="27" hspace="5" border="0" align="right"></a>
<%			}
		}
	}	%></div></div></td></tr><% } %>
		            
<% if(!StringUtil.isBlank(aDTO.getLargeKickerImage())) { 	%>
		<tr><td align="center"><img rel="prefetch" src="<%= STORY_IMAGE_BASEPATH + aDTO.getLargeKickerImage()%>" width="325" height="170" border="0" align="middle" alt="<%= aDTO.getLargeKickerImageAltText()%>" title="<%=aDTO.getLargeKickerImageAltText()%>" />
<%		if(!StringUtil.isBlank(aDTO.getLargeKickerImageCaption())) {	%>
			<div align="center" style="text-align:left; padding:2px 3px;font:normal 11px arial; color:#9E9E9E;width:325px;background-color:#F5F5F5;" class="dtime"><%= aDTO.getLargeKickerImageAltText()%></div>
<% 		}	%>
        </td></tr><tr><td height="5"></td></tr>
<% } %>
<tr><td class="storytext"><div class="storytext"><%
if(id==130599 || id==130980) {
	int HighlightNum = 0;
	String tempArticle = "";
	if(storybody.indexOf("Highlight")>0) {
		int tempH = storybody.indexOf("Highlight");
		int tempC = storybody.indexOf(":");
		String t1 = storybody.substring((storybody.indexOf("Highlight")+9), storybody.indexOf(":"));
		HighlightNum = Integer.parseInt(t1);
	}
	tempArticle = storybody;
	for(int z=HighlightNum, z1=1; z>=1; z--, z1++) {
		String tempAa = "Highlight"+z;
		String tempAa1 = ""+z;
		tempArticle = tempArticle.replaceAll(tempAa, tempAa1);
	}
	out.println(tempArticle.replaceAll("#","").replaceAll( "<br /><br /><br /><br />", "<br /><br />" ).replaceAll( "<br /><br /><br />", "<br /><br />"));
} else {
	  out.print(storybody.replaceAll("http://businesstoday.intoday.in/",SITE_URL).replaceAll( "<br /><br /><br /><br />", "<br /><br />" ).replaceAll( "<br /><br /><br />", "<br /><br />"));
}%></div></td></tr>
<tr><td height="5"></td></tr>
<% if (resultPreviousNext != null && resultPreviousNext.size() > 0) {	%>
	<tr><td>
    <div style="width:100%; text-align:center;"><div class="nptitle">
<%	for (int counterPreArticle = 0; counterPreArticle < resultPreviousNext.size(); counterPreArticle++) {
		ContentListDTO stBean = (ContentListDTO) resultPreviousNext.get(counterPreArticle);
		if(!StringUtil.isBlank(stBean.getContentType()) && stBean.getContentType().equals("previous")) {	%>
			<a href="<%= Constants.SITE_URL + CommonFunctions.storyURL(stBean.getSefTitle(),1, stBean.getId())%>"><img rel="prefetch" src="<%=MEDIA_CSS%>images/back.gif" alt="Back" width="27" height="27" hspace="5" border="0" align="left" ></a>
<%		}
		if(counterPreArticle==0) { %><a href="<%= Constants.SITE_URL%>">HOME</a><%		}
		if(!StringUtil.isBlank(stBean.getContentType()) && stBean.getContentType().equals("next")) {	%>
			<a href="<%= Constants.SITE_URL + CommonFunctions.storyURL(stBean.getSefTitle(),1, stBean.getId())%>"><img rel="prefetch" src="<%=MEDIA_CSS%>images/next.gif" alt="Back" width="27" height="27" hspace="5" border="0" align="right"></a>
<%		}
	}	
	%>
	</div></div>
    </td></tr>
<% } %>
<tr><td height="5"></td></tr>
<tr><td></td></tr>
<tr><td>
<%
	ArrayList relateds = (ArrayList) CommonFunctions.relatedContent(""+id, "text", 0);
	if (relateds != null && relateds.size() > 0) {
		for (int rCtr = 0; rCtr < relateds.size(); rCtr++) {
			RelatedContentDTO RCD = (RelatedContentDTO) relateds.get(rCtr);
				//if(rCtr == 0) {		%>
				<%--
					<table cellpadding="0" cellspacing="0" width="100%"><tbody><tr><td height="22" class="subheading"><a class="subheading" href="section?secid=120" style="color:#333;">Related News</a></td></tr>
					 --%>
<%				//}
				if(!StringUtil.isBlank(RCD.getRelatedType()) && RCD.getRelatedType().trim().equals("text"))	{	%>
			<tr><td bgcolor="#FFFFFF" style="border-bottom:1px solid #DBDBDB;">
<%			if(!StringUtil.isBlank(RCD.getImage())) {	%>
					<a href="<%=Constants.SITE_URL + CommonFunctions.storyURL(RCD.getRelatedContentSefTitle(), 1, RCD.getRelatedContentId())%>"><img rel="prefetch" src="<%=STORY_IMAGE_BASEPATH+RCD.getImage().trim()%>" width="80" height="80" align="left" style="margin:0 8px 0 2px; border:0;"/></div>
<% 			} else { %>
					<a href="<%=Constants.SITE_URL + CommonFunctions.storyURL(RCD.getRelatedContentSefTitle(), 1, RCD.getRelatedContentId())%>"><img rel="prefetch" src="<%=NO_IMG_88x66%>" width="80" height="80" align="left" style="margin:0 8px 0 2px; border:0;"/></a>
<% 			} %>
			<div class="story-title"><a href="<%=Constants.SITE_URL + CommonFunctions.storyURL(RCD.getRelatedContentSefTitle(), 1, RCD.getRelatedContentId())%>"><%=RCD.getRelatedTitle()%></a></div></td></tr>
<%			} else if(!StringUtil.isBlank(RCD.getRelatedType()) && RCD.getRelatedType().trim().equals("photo"))	{	%>
			<tr><td bgcolor="#FFFFFF" style="border-bottom:1px solid #DBDBDB;">
<%			if(!StringUtil.isBlank(RCD.getImage())) {	%>
				<div class="strimgrepeat"><a href="<%=Constants.SITE_URL + CommonFunctions.galleryURL(RCD.getRelatedContentSefTitle(), 1, RCD.getRelatedContentId())%>"><img rel="prefetch" src="<%=PHOTO_BASEPATH+RCD.getImage().trim()%>" width="80" height="80" align="left" style="margin:0 8px 0 2px; border:0;"/><span class="strphotoicon"></span></a></div>
<% 			} else {	%>
				<a href="<%=Constants.SITE_URL + CommonFunctions.galleryURL(RCD.getRelatedContentSefTitle(), 1, RCD.getRelatedContentId())%>"><img rel="prefetch" src="<%=NO_IMG_88x66%>" width="80" height="80" align="left" style="margin:0 8px 0 2px; border:0;"/></a>
<% 			}	%>
			<div class="story-title"><a href="<%=Constants.SITE_URL + CommonFunctions.galleryURL(RCD.getRelatedContentSefTitle(), 1, RCD.getRelatedContentId())%>"><%=RCD.getRelatedTitle()%></a></div>
			</td></tr>
<%			}
			if(rCtr == relateds.size()-1) {		%>	
				</tbody></table>
<%			}
		}
	} 	%>
</td></tr>
<tr><td><div class="addcomment_area" id="someID"><a href="#"><strong>Add Comment</strong> <em> + </em></a></div></td></tr>
<tr>
<td>    
<div class="socialstrip">
<ul>
<a href="https://facebook.com/sharer.php?u=<%=Constants.SITE_URL + CommonFunctions.storyURL(aDTO.getSefTitle(),1, aDTO.getId()) %>"><img src="<%=MEDIA_CSS%>images/story_facebook.jpg"></a>
<a style="margin:0 5px;" href="https://twitter.com/intent/tweet?url=<%=Constants.SITE_URL + CommonFunctions.storyURL(aDTO.getSefTitle(),1, aDTO.getId()) %>&amp;text=<%=aDTO.getTitleAlias() %>&amp;via=indiatoday" target="_blank"><img src="<%=MEDIA_CSS%>images/story_twitter.jpg"></a>
<a target="_blank" href="https://plus.google.com/share?url=<%=Constants.SITE_URL + CommonFunctions.storyURL(aDTO.getSefTitle(),1, aDTO.getId()) %>" data-value-share="Google" ><img src="<%=MEDIA_CSS%>images/story_gplus.jpg"></a>
</ul>
</div>	
</td></tr>
<tr><td>  <div align="center" style="width:300px;">
 <!-- Ad Slot 1 tag: --> 
 <!-- begin ZEDO for channel:- BT ROS Top, Publisher: Bussiness Today WAP, Ad Dimension: 320x50 Mobile-320x50 --> 
 <div id="zt_477283_4" style="display:show"> 
 <script id="zt_477283_4" language="javascript"> 

if(typeof zmt_mtag !='undefined' && typeof zmt_mtag.zmt_render_placement !='undefined')
{
     zmt_mtag.zmt_render_placement(p477283_4);
}
 </script>
 </div>
 <!-- end ZEDO for channel: - BT ROS Top, Publisher: Bussiness Today WAP, Ad Dimension: 320x50 Mobile-320x50 --> 
</div>	
</td></tr>
<tr><td>  
<div id="adunit_dxffr4k845_2" class="ntinfeedad"></div>			
</td></tr>
<tr><td>
<div id='taboola-mobile-below-article-thumbs'></div>
<script type="text/javascript">
window._taboola = window._taboola || [];
_taboola.push({mode:'thumbs-mobile-2r', container:'taboola-mobile-below-article-thumbs', placement:'mobile-below-article-thumbs' });
</script>
<script type="text/javascript">
window._taboola = window._taboola || [];
_taboola.push({flush:true});
</script>
 <div style="height:5px;"></div> 
 <%
	String newCreatedDateFormat = null;
 	String newModifiedDateFormat = null;
 	Date modifiedDateFormat = null;
 	Date createdDateFormat = null;
	SimpleDateFormat formatter = new SimpleDateFormat("EEE, MMM d, yyyy");
	createdDateFormat = formatter.parse(aDTO.getCreatedDate());
	if(aDTO.getModifiedDate() != null && !aDTO.getModifiedDate().equalsIgnoreCase("")) { modifiedDateFormat = formatter.parse(aDTO.getModifiedDate()); }
	String ISO_FORMAT = "yyyy-MM-dd'T'"+aDTO.getCreatedTime()+"+5.30";
	SimpleDateFormat sDateFormat = new SimpleDateFormat(ISO_FORMAT);
	TimeZone utc = TimeZone.getTimeZone("IST");
	sDateFormat.setTimeZone(utc);
	newCreatedDateFormat = sDateFormat.format(createdDateFormat);
	if(modifiedDateFormat != null && !modifiedDateFormat.equals("")) {	newModifiedDateFormat = sDateFormat.format(modifiedDateFormat); }  %> 
<div itemtype="http://schema.org/NewsArticle" itemscope="">
<meta content="<%=aDTO.getTitleAlias()%>" itemprop="mainEntityOfPage">
<meta content="<%=aDTO.getTitleAlias()%>" itemprop="name">
<div itemprop="image" itemscope itemtype="https://schema.org/ImageObject">
<meta itemprop="url" content="<%=STORY_IMAGE_BASEPATH + aDTO.getLargeKickerImage() %>">
<meta itemprop="width" content="325">
<meta itemprop="height" content="170"></div>
<meta content="<%=aDTO.getMetaDescription().replaceAll("\\<.*?>","")%>" itemprop="description">
<meta content="<%=SITE_BASEPATH+CommonFunctions.storyURL(aDTO.getSefTitle(),1, aDTO.getId()) %>" itemprop="url">
<meta content="<%=aDTO.getMetaKeyword().replaceAll("\\<.*?>","")%> " itemprop="keywords">
<meta content="<%=newCreatedDateFormat %>" itemprop="datePublished">
<meta content="<%= (newModifiedDateFormat != null)?newModifiedDateFormat:"" %>" itemprop="dateModified">
<meta content="en_US" itemprop="inLanguage">
<meta content="Living Media India Limited" itemprop="copyrightHolder">
<meta content="2016" itemprop="copyrightYear">
<meta content="Living Media India Limited" itemprop="sourceOrganization">
<meta content="Living Media India Limited" itemprop="provider">
<meta content="<%=aDTO.getTitleAlias()%>" itemprop="headline">
<meta content="<%=aDTO.getSectionTitle() %>" itemprop="articleSection">
<meta content="<%=aDTO.getByline() %>" itemprop="author">
<div itemprop="publisher" itemscope itemtype="https://schema.org/Organization" >
<meta content="Business Today" itemprop="name">
<div itemprop="logo" content="http://media2.intoday.in/businesstoday_wap/resources/css/images/logo-btoday.png" itemscope itemtype="https://schema.org/ImageObject"><meta itemprop="url" content="http://media2.intoday.in/businesstoday_wap/resources/css/images/logo-btoday.png">
</div>
</div>
</div>
<div itemtype="http://schema.org/DataFeedItem" itemscope="">
<meta content="<%=newCreatedDateFormat%>" itemprop="dateModified">
</div>
</td></tr>
<tr>
<td>
<%	VuukleAuthorData ="["+VuukleAuthorData.trim()+"]";
	String VuukleAuthorDataEncode  = URLEncoder.encode(VuukleAuthorData, "UTF-8").replaceAll("\\%28", "(").replaceAll("\\%29", ")").replaceAll("\\+", "%20").replaceAll("\\%27", "'").replaceAll("\\%21", "!").replaceAll("\\%7E", "~").replaceAll("%3A", ":").replaceAll("%2C", ",").replaceAll("%40", "@");
	byte[] byteArray = Base64.encodeBase64(VuukleAuthorDataEncode.getBytes());
	String encodedString = new String(byteArray);
%>
<a name="comment"></a>
<div id="vuukle_div"></div>
<script type="text/javascript">
	var UNIQUE_ARTICLE_ID = "story_<%=id%>"; 
	var SECTION_TAGS =  "<%=vuukleSectionTags%>, story";
	var ARTICLE_TITLE = "<% out.print(aDTO.getTitleAlias().replace("\"",""));%>";
	var GA_CODE = "UA-795349-14";
	var VUUKLE_API_KEY = "dc34b5cc-453d-468a-96ae-075a66cd9eb7"; 
	var TRANSLITERATE_LANGUAGE_CODE = ""; //"en" for English, "hi" for hindi
	var VUUKLE_COL_CODE = "d00b26";
	var ARTICLE_AUTHORS = '<%=encodedString%>'; 
	create_vuukle_platform(VUUKLE_API_KEY, UNIQUE_ARTICLE_ID, "0", SECTION_TAGS, ARTICLE_TITLE, TRANSLITERATE_LANGUAGE_CODE , "1", "", GA_CODE, VUUKLE_COL_CODE, ARTICLE_AUTHORS);
</script>
<!--To display comments platform code end here-->
</td>
</tr>
<tr><td height="8"></td></tr>
<%	if(aDTO.getSectionId()==120){	%>
         <tr><td><div style="padding-left:5px;"> More from &nbsp;<a href="<%=Constants.SITE_URL + CommonFunctions.sectionURL("latest-headlines", 1, 175)%>" class="storynormaltxt"><strong>LATEST HEADLINES</strong></a></div></td></tr>
<%	} else { %>
      <tr><td><div style="padding-left:5px;"> More from &nbsp;<a href="<%=Constants.SITE_URL + CommonFunctions.sectionURL(aDTO.getSectionSefTitle(), 1, aDTO.getSectionId())%>" class="storynormaltxt"><strong><%=aDTO.getSectionTitle()%></strong></a></div></td></tr>
<% }	%>
<tr><td height="8"></td></tr>
</table>
<div style="float:left; width:100%"><%@ include file="othercategories.html"%></div>
<div style="float:left; width:100%"><%@include file="hotzone.html"%></div>
<div style="float:left; width:100%"><%@include file="ringtones.html"%></div>
<% if(navigationFlag==1){}else{
  if( primaryCategoryNew!=null && (primaryCategoryNew.equals("702") || primaryCategoryNew.equals("679") || primaryCategoryNew.equals("696") || primaryCategoryNew.equals("698")|| primaryCategoryNew.equals("708")) ) {	%>
<div style="float:left; width:100%"><%@ include file="budget_bottomnav.html"%></div> 
<% } else { %>
<div style="float:left; width:100%"><%@ include file="common-bottomnav.html"%></div>
<%}}%>
<!-- code to optimize js begin-->
<script type="text/javascript">
function downloadJSAtOnload() {
var element = document.createElement("script");
element.src = "<%=MEDIA_JS+"jquery-1.4.2.min.js"%>";
document.body.appendChild(element);
}
if (window.addEventListener)
window.addEventListener("load", downloadJSAtOnload, false);
else if (window.attachEvent)
window.attachEvent("onload", downloadJSAtOnload);
else window.onload = downloadJSAtOnload;
</script>
<!-- code to optimize js end-->
</body>
</html>
<%	}
} else {
	String redirectURL = Constants.SITE_URL + "pagenotfound.jsp";
	response.sendRedirect(redirectURL);
} %>
</cache:cache>
</compress:html>