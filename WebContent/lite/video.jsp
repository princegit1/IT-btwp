<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %>
<compress:html removeIntertagSpaces="true"> 
<%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %><%@ page language="java" import="java.util.*,com.itgd.utils.UrlRedirectUtil, java.util.regex.Matcher, java.util.regex.Pattern, com.itgd.dto.VideoDTO, com.itgd.dto.ContentChunkDTO, com.itgd.helper.VideoHelper, com.itgd.helper.ContentChunkHelper, com.itgd.utils.CommonFunctions, com.itgd.utils.Constants, com.itgd.parser.ItemRecVideo,com.itgd.parser.ItemFeedVideo,java.sql.Connection,java.sql.ResultSet,java.sql.PreparedStatement,java.sql.SQLException,com.itgd.utils.DbConnection,com.bt.itgd.gist.dto.GistVideoDTO,com.bt.itgd.gist.helper.GistVideoHelper,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" pageEncoding="ISO-8859-1"%>
<%@include file="properties.jsp"%>
<%@include file="global_include.jsp"%>
<% String baseUrl = request.getRequestURL().substring(0,request.getRequestURL().indexOf(request.getServletPath()))+"/";	
	if(request.getServerName().contains("origin-")) {
		baseUrl = SITE_URL;
	}
			int videoId = 0;
			int currentVideoPageNo = 1;
			int navigationFlag=0;
			if(request.getAttribute("videoId")!=null)
				videoId = (Integer)request.getAttribute("videoId");
			if(request.getAttribute("currentPageNumber")!=null)
				currentVideoPageNo = (Integer)request.getAttribute("currentPageNumber");
			
			if(request.getParameter("nav")!=null)
				navigationFlag= Integer.parseInt(request.getParameter("nav").toString());
%>
<cache:cache key='<%=cacheURL+"lite/video/"+videoId%>' scope="application" time="0" refresh="t">
<!doctype html>
<html amp>
  <head>
    <meta charset="utf-8">
    
<%
ItemRecVideo record	=	null;
String titleToDisplay	=	"";
String title		=	null;
String id = null;
String mp4video = "";
String mp4videoWebPath = "";
int mp4videoFlag = 0;
String ThreeGPvideoPath="";
String ThreeGPvideoPath2="";
String ThreeGPvideoPath3="";
String ThreeGPvideoPathFinal="";
String videoTitle = "";
String videoTitleAlias = "";
String videoDescription = "";
String videoSefTitle = "";
String videoByline = "";
String videoCreatedDate = "";
String pageMetaTitle = "";
String pageMetaKeywords = "";
String pageMetaDescription = "" ;
String headerImage = "";
String extraLargeImage="";
String kickerImage="";
int commentCount=0;
int sectionId = 0;
String sectionTitle  = "" ;    
String sectionSefTitle  = "" ;
int primaryCategoryId = 0;
String primaryCategory = "";
String primaryCategoryTitle  = "" ;
String primaryCategorySefTitle  = "" ;
int primaryCategoryLength = 0;
String cacheErrMsg = request.getParameter("message");
if(cacheErrMsg==null)
	cacheErrMsg = "";
String videoFileNameComplete = "";
String videoFileFolderName = "";
int isExternalVideo = 0;
String dateString = "";
if(isGistVideo(videoId)){
	GistVideoDTO gdto	=	GistVideoHelper.getGistVideoDetails(videoId,"gist");
	if(gdto	!=null ){
		if(gdto.getVideoCreatedDate() != null && !gdto.getVideoCreatedDate().equals("")){
			dateString = dateConverter(gdto.getVideoCreatedDate());
			titleToDisplay	=	gdto.getVideoTitle();
		}	
		%>
        	<title><%= titleToDisplay%></title>
            <META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
            
            <meta name="viewport" content="width=device-width,minimum-scale=1,initial-scale=1">
	 <link itemprop="mainEntityOfPage" rel="canonical" href="http://www.businesstoday.in/videos/in-news/<%= gdto.getVideoSefUrl().replaceAll(".html","")%>/<%= videoId%>.html" />
<script type="application/ld+json">
            {
            "@context": "http://schema.org",
            "@type": "VideoObject",
            "mainEntityOfPage": "http://www.businesstoday.in/videos/in-news/<%= gdto.getVideoSefUrl().replaceAll(".html","")%>/<%= videoId%>.html" ,
            "name": "<%= gdto.getVideoTitle()%>",
            "description": "<%= gdto.getVideoFullDesc().replaceAll("\\<.*?>","")%>",
            "thumbnailUrl": "<%=KICKER_IMG_PATH%><%= gdto.getVideoExtraLargeKickerImage()%>",
            "uploadDate": "<%= dateString %>",
            "contentUrl": "<%="https://"+gdto.getS3Domain() + gdto.getVideoFilePath() %>",

            "publisher": {
            "@type": "Organization",
            "name": "BusinessToday",
            "logo": {
            "@type": "ImageObject",
            "url": "https://smedia2.intoday.in/wap/btwap/images/logo.png",
            "width": 156,
            "height": 32
            }
            }
            }
        </script>
     <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<style amp-boilerplate>body{-webkit-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-moz-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-ms-animation:-amp-start 8s steps(1,end) 0s 1 normal both;animation:-amp-start 8s steps(1,end) 0s 1 normal both}@-webkit-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-moz-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-ms-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-o-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}</style><noscript><style amp-boilerplate>body{-webkit-animation:none;-moz-animation:none;-ms-animation:none;animation:none}</style></noscript>
<style amp-custom> *{ margin:0; padding:0;} body{ font-family:roboto; font-size:100%;} body.amp-mode-touch {border: 0px;}header.masthead{ padding:10px 0; border-bottom:2px solid #EAEAEA;} header.masthead i.icon-logo{ background:url(https://smedia2.intoday.in/wap/btwap/images/logo.png) no-repeat center center; display: block; height: 27px;text-indent: -9999px;} .maincontent{ padding:10px 20px;}.maincontent p{ color:#333; margin-bottom:18px; font:400 17px/21px roboto;} .maincontent p a{ text-decoration:none; color:#3F84FD;}.maincontent p a b{ font-weight:normal;}.maincontent h1{ font:bold 26px/30px roboto; color:#000; margin-bottom:10px;} .maincontent p.subtext{ font:400 16px/20px roboto; margin-bottom:10px;color: #666;} .maincontent .author-info{ margin-bottom:10px; overflow:hidden;} .maincontent .author-info .name{ font:400 14px/15px roboto; color:#9D9D9D; margin-bottom:5px; width:auto; float:left;}	.maincontent .author-info .datetime{ font:400 14px/15px roboto; color:#9D9D9D; width:auto; float:left;} .maincontent figure.mosimg{ margin:0 -20px 20px;} .maincontent .quotes{ border-left:3px solid #CA0000; padding:0 0 0 15px; margin:20px; font:400 16px/21px roboto; color:#424242;} .maincontent .highlight-section{ margin:30px 0;} .maincontent .highlight-section h3{ font:bold 22px/25px roboto; margin-bottom:10px;}.maincontent .highlight-section ol{  margin: 0;padding: 0; list-style-type: none; counter-reset: item;} .highlight-section ol li{color:#D30F11; font-size:30px; line-height:0; font-weight:bold; counter-increment: item; display: table; padding:5px 0;} .highlight-section ol li:before{content: counters(item, "") ""; display: table-cell; padding-right:15px; position: relative;top: 10px;}.maincontent .highlight-section ol li span{ color:#000; font:400 17px/22px roboto;}.ad-inner{ background:#EFEFEF; text-align:center; padding:5px 0; margin:0 -10px;} .ad-inner h6{ font-size:12px; color:#989898; font-weight:500;}.other-news{ padding:30px 10px;} .other-news h2{ color:#FE1322; font:bold 24px/25px roboto; margin-bottom:15px;}.other-news .othernews-row{ padding:15px 0; border-bottom:1px solid #D9D9D9; overflow:hidden;} .other-news .othernews-row .newstext{ width:70%; float:left; font:500 16px/21px roboto; color:#111;}.other-news .othernews-row .newstext .subtitile{ font:400 13px/18px roboto; color:#666;padding-top: 5px; display:none;}.other-news .othernews-row .newstext a{font:bold 16px/21px roboto; color:#000; text-decoration:none;}.other-news .othernews-row .newsimage{ width:25%; float:right;} amp-video{ margin:15px -10px;}footer.footersection{padding:10px;} footer nav.footernav{border-bottom:1px solid #d8d8d8; border-top:1px solid #d8d8d8; text-align:left; padding:6px 0;}footer nav.footernav ul li{display: inline-block; list-style:none; font-size:14px; color:#666;}footer nav.footernav ul li a{color: #1a7dcc; font-size: 14px; text-decoration: none; padding-right:20px;} footer.footersection .copyright{font-size:10px; text-align:left; color:#666;line-height: 16px;padding-top: 10px;} a.gototop{ color: #111111;float: right; font-size: 13px;position: relative;text-decoration: none;top: -17px; width: auto;}.social-icons .socalsprit{background-image:url(https://smedia2.intoday.in/aajtak/amp/socialicon-spritenew2.png);background-repeat: no-repeat;background-size: 70% auto;} .social-icons{ width:110px; margin:0 auto;} .social-icons a.facebooklike{background-position: center 0;display: inline-block;height:47px;text-indent: -99999px;width: 50px;} .social-icons a.twitterfollow{background-position:center -45px;display: inline-block;height:47px;text-indent: -99999px;width: 50px;}.story-content .caption{font-size:15px; color:#999; line-height:23px; display:block;}.newstext .datetime {font: 400 13px/17px roboto;color: #666; padding: 7px 0 5px;} @media (min-width:479px){.other-news .othernews-row .newstext .subtitile{ display:block;}}
.sprite{ background-image:url(https://smedia2.intoday.in/indiatoday/amp-image/amp-socialicon.gif);}
.share-icon{ margin:20px -20px 5px; padding:0;} .share-icon ul{ list-style:none; margin:0; padding:0;} .share-icon ul li{ width:31.8%; margin:0; display:inline-block; text-align:center;}.share-icon ul li:nth-child(3){width:36%;} .share-icon ul li i{ display:inline-block; background-repeat:no-repeat;}
.share-icon ul li i.facebook{ background-position:0 0; width:83px; height:34px;}
.share-icon ul li i.twitter{ background-position:-89px 0; width:83px; height:34px;}
.share-icon ul li i.whtsapp{background-position:-177px 0; width:100px; height:34px;}
.amp-ad{ background:#eee; text-align:center; padding:5px 0; margin:5px 0 0;}
 .lightbox { width:100%; height:100%; background:#fff;} .lightbox .menulist{ height: 100%;
overflow-x: hidden;overflow-y: scroll; padding-top:40px;} .lightbox .menulist ul li{width: 49%; float: left; padding: 0px 0 0px 10%; box-sizing: border-box; list-style: none;} .lightbox .menulist ul li a{color: #222; font: 400 18px/18px roboto; padding: 8px 0; text-decoration:none; display:block;}.openmenu{background:url(https://smedia2.intoday.in/aajtak/amp/menu_icon.png) no-repeat 0 0; border:0; width:40px; height:40px; margin-left: 10px; position: absolute; top: 0px;} .closemenu{ background:url(https://smedia2.intoday.in/aajtak/amp/closemenu.gif) no-repeat 0 0; width:33px; height:37px; position:absolute; border:0;right: 10px; top: 10px;} figcaption {background: rgba(0, 0, 0, 0.5);color: #ffffff;font: 500 14px/19px roboto;padding: 10px; margin-bottom: 20px;width: 100%;margin-left: -10px; }
 </style>
    
   		<script async custom-element="amp-twitter" src="https://cdn.ampproject.org/v0/amp-twitter-0.1.js"></script>
        <script async custom-element="amp-instagram" src="https://cdn.ampproject.org/v0/amp-instagram-0.1.js"></script>
        <script async custom-element="amp-audio" src="https://cdn.ampproject.org/v0/amp-audio-0.1.js"></script>
        <script async custom-element="amp-analytics" src="https://cdn.ampproject.org/v0/amp-analytics-0.1.js"></script>
        <script async custom-element="amp-fit-text" src="https://cdn.ampproject.org/v0/amp-fit-text-0.1.js"></script>
        <script async src="https://cdn.ampproject.org/v0.js"></script>
        <script async custom-element="amp-lightbox" src="https://cdn.ampproject.org/v0/amp-lightbox-0.1.js"></script>

  </head>
  <body>
 <a name="top"></a>
  <amp-lightbox id="businesstoday-menu" layout="nodisplay" class="-amp-element -amp-layout-nodisplay -amp-layout" >
        
    <div class="-amp-fill-content"><div class="lightbox">
            <button on="tap:businesstoday-menu.close" class="closemenu"></button>
            <div class="menulist">
                <ul>
					<li><a href="http://m.businesstoday.in/" title="Home">Home</a></li><li><a href="http://m.businesstoday.in/section/99/1/big-story.html" title="Big Story">Big Story</a></li><li><a href="http://m.businesstoday.in/section/105/1/latest-headlines.html" title="Top News">Top News</a></li><li><a href="http://m.businesstoday.in/section/111/1/markets.html" title="Markets">Markets</a></li><li><a href="http://m.businesstoday.in/section/110/1/technology.html" title="Technology">Technology</a></li><li><a href="http://m.businesstoday.in/section/101/1/sectors.html" title="Industry">Industry</a></li><li><a href="http://m.businesstoday.in/section/103/1/management.html" title="Management">Management</a></li><li><a href="http://m.businesstoday.in/section/102/1/opinion.html" title="Opinion">Opinion</a></li><li><a href="http://m.businesstoday.in/section/125/1/from-the-mag.html" title="From The Mag">From The Mag</a></li>                                      
                </ul>
            </div>
        </div></div></amp-lightbox>
    <header class="masthead"><button on="tap:businesstoday-menu" class="openmenu"></button><a target="_blank" href="https://smedia2.intoday.in/wap/btwap/images/logo.png"><i class="icon-logo">Bussiness Today</i></a></header>
    <div class="amp-ad">
 <h6>SPONSERED ADS</h6>
 <amp-ad width=320 height=50  type="adsense" data-ad-client="/1007232/AMP_BT_Video_320x50_Top" data-ad-slot="/1007232/AMP_BT_Video_320x50_Top"></amp-ad>
 </div>
 	<div class="maincontent" role="main">
		 <h1><%= gdto.getVideoTitle()%></h1>
		 <div class="author-name">
         <%if(gdto.getVideoByLine() != null){%>
              <span itemscope="" itemtype="http://schema.org/Person" itemprop="author"><%= gdto.getVideoByLine()%></span>
         <%}%>
         </div>
         <div class="story-time"><%//= innerList.get(0).getCity()%>
                    <time class="header-time" itemprop="datePublished" datetime="<%= dateString %>"><%= dateString %></time>
         </div>
		
			<amp-video src="<%="https://"+gdto.getS3Domain() + gdto.getVideoFilePath() %>" width="500" height="400" poster="<%=KICKER_IMG_PATH%><%= gdto.getVideoExtraLargeKickerImage()%>" layout="responsive" controls></amp-video>
			<figcaption><%= gdto.getVideoFullDesc()%></figcaption>

    <div class="ad-inner">
     <h6>SPONSERED ADS</h6>
   <amp-ad width=300 height=250  type="adsense" data-ad-client="/1007232/AMP_BT_Video_300x250_MID" data-ad-slot="/1007232/AMP_BT_Video_300x250_MID"></amp-ad>
  </div>
  <div class="other-news">
<%
int videoCountDisplay = 4;
int currentPageNo = 1;
ArrayList videoListData = (ArrayList) ContentChunkHelper.latestVideo(primaryCategoryId, videoCountDisplay, "0");
if (videoListData != null && videoListData.size() > 0) {
	for (int ctr=0; ctr < videoListData.size(); ctr++) {
		
		ContentChunkDTO catDetail = (ContentChunkDTO) videoListData.get(ctr);
		if (ctr == 0 ) 
		{
			%>
            	<h2>Latest Video</h2>
            <%
		}
 		if(catDetail.getId()!=videoId) {
 			%>
            <div class="othernews-row">
          <div class="newstext"> <a href="<%= SITE_URL %><%=catDetail.getContentURL()%>"><%=catDetail.getTitle()%></a>
                <div class="datetime"> <%=catDetail.getCreatedDate()%></div>
                <div class="subtitile"><%=catDetail.getTitle()%><br>
            </div>
              </div>
          <div class="newsimage"> <a href="<%= SITE_URL %><%=catDetail.getContentURL()%>">
            <%
if(catDetail.getSmallImage()!=null && !catDetail.getSmallImage().equals("null")) {%>
            <amp-img width="305" height="182" layout="responsive" title="<%=catDetail.getTitle()%>" alt="<%=catDetail.getTitle()%>" src="<%=Constants.KICKER_IMG_PATH+catDetail.getSmallImage() %>"></amp-img>
            <%}else{%>
            <amp-img width="74" height="75" layout="responsive" title="<<%=catDetail.getTitle()%>" alt="<%=catDetail.getTitle()%>" src="https://smedia2.intoday.in/indiatoday/defaultimage/88X66.gif"></amp-img>
            <%}%>
            </a> 
        </div>
        </div>
            <%
 		}
		 %>
         
 
		<%
	
	}}else {
	String redirectURL = SITE_BASEPATH + "pagenotfound.jsp";
	response.sendRedirect(redirectURL);}}}else{
ArrayList videoPageData = (ArrayList) VideoHelper.videoDetail(videoId, 1);
if (videoPageData != null && videoPageData.size() > 0) {
	for (int i = 0; i < videoPageData.size(); i++) {
		VideoDTO aDTO = (VideoDTO) videoPageData.get(i);
		videoId = aDTO.getVideoId();
		videoTitle = aDTO.getVideoTitle();
		videoTitleAlias = aDTO.getVideoTitleAlias();
		videoSefTitle = aDTO.getVideoSefTitle();
		videoByline = aDTO.getVideoByline();
		primaryCategory = aDTO.getPrimaryCategory();
		videoCreatedDate = aDTO.getVideoCreatedDate();
		videoDescription = aDTO.getVideoDescription();
		headerImage = aDTO.getHeaderImage();
		extraLargeImage=aDTO.getVideoLargeKickerImage();
		kickerImage=aDTO.getVideoKickerImage();
		mp4videoFlag = aDTO.getMp4VideoFlag();
		sectionId = aDTO.getVideoSectionId();
		sectionTitle = aDTO.getVideoSectionTitle();
		sectionSefTitle = aDTO.getVideoSectionSefTitle();
				
		if(aDTO.getExternalVideoUrl().trim().length() > 0) {
			isExternalVideo = 1;
		}
		primaryCategory = aDTO.getPrimaryCategory(); 
		primaryCategoryLength = aDTO.getPrimaryCategoryLength();
		primaryCategoryTitle = aDTO.getVideoSectionTitle();
		if(primaryCategoryLength >= 2) {
			primaryCategoryId = aDTO.getVideoCategoryId();
			primaryCategoryTitle = aDTO.getVideoCategoryTitle();
			primaryCategorySefTitle = aDTO.getVideoCategorySefTitle();
		}
		pageMetaTitle = (videoTitleAlias + " | " + primaryCategoryTitle + " Videos | - Business Today").replaceAll("\\<.*?>","");
		pageMetaKeywords = aDTO.getMetaKeywords().replaceAll("\\<.*?>","");
		pageMetaDescription = aDTO.getMetaDescription().replaceAll("\\<.*?>","");
		if(currentVideoPageNo > 1) {
			pageMetaTitle = pageMetaTitle + " - Part "+currentVideoPageNo;
			pageMetaKeywords = pageMetaKeywords + " - Part "+currentVideoPageNo;
			pageMetaDescription = pageMetaDescription + " - Part "+currentVideoPageNo;
		}
		videoFileNameComplete ="";
		
		if(videoFileNameComplete.trim().length() == 0){
			videoFileNameComplete=aDTO.getExternalVideoUrl();
		}	
		videoFileFolderName = aDTO.getVideoFolder();
		commentCount = aDTO.getVideoCommentCount();

}
if(pageMetaTitle.trim().length() <= 0) {
	pageMetaTitle = "Business Today: Business News, Latest Stock Market and Economy News India from Businesstoday.in";
}
 
for(int i=0;i<videoPageData.size();i++)
{
	VideoDTO aDTO = (VideoDTO) videoPageData.get(i);
	id = Integer.toString(aDTO.getVideoId());
	title	=	aDTO.getVideoTitle();
	titleToDisplay	=	aDTO.getVideoTitle();
		String externalUrl	=	aDTO.getExternalVideoUrl().trim();
		externalUrl	=	externalUrl.replace("http://","https://");
		if(externalUrl.contains("|"))
		{
			String arr[]	=	externalUrl.split("|");
			externalUrl = arr[0];
		}
	
%>
	<title><%= title%></title>
	<meta name="viewport" content="width=device-width,minimum-scale=1,initial-scale=1">
	<link itemprop="mainEntityOfPage" rel="canonical" href="http://www.businesstoday.in/<%=UrlRedirectUtil.getVideoCategoryUrl(videoId)%>" />
<script type="application/ld+json">
            {
            "@context": "http://schema.org",
            "@type": "VideoObject",
            "mainEntityOfPage": "http://www.businesstoday.in/<%=UrlRedirectUtil.getVideoCategoryUrl(videoId)%>",
            "name": "<%= title%>",
            "description": "<%= videoDescription.replaceAll("\\<.*?>","")%>",
            "thumbnailUrl": "<%=KICKER_IMG_PATH%><%= extraLargeImage%>",
            "uploadDate": "<%= aDTO.getVideoCreatedDate()%>",
            "contentUrl": "<%=externalUrl%>",

            "publisher": {
            "@type": "Organization",
            "name": "BusinessToday",
            "logo": {
            "@type": "ImageObject",
            "url": "https://smedia2.intoday.in/wap/btwap/images/logo.png",
            "width": 156,
            "height": 32
            }
            }
            }
        </script>
     <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<style amp-boilerplate>body{-webkit-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-moz-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-ms-animation:-amp-start 8s steps(1,end) 0s 1 normal both;animation:-amp-start 8s steps(1,end) 0s 1 normal both}@-webkit-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-moz-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-ms-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-o-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}</style><noscript><style amp-boilerplate>body{-webkit-animation:none;-moz-animation:none;-ms-animation:none;animation:none}</style></noscript>
<style amp-custom> *{ margin:0; padding:0;} body{ font-family:roboto; font-size:100%;} body.amp-mode-touch {border: 0px;}header.masthead{ padding:10px 0; border-bottom:2px solid #EAEAEA;} header.masthead i.icon-logo{ background:url(https://smedia2.intoday.in/wap/btwap/images/logo.png) no-repeat center center; display: block; height: 27px;text-indent: -9999px;} .maincontent{ padding:10px 20px;}.maincontent p{ color:#333; margin-bottom:18px; font:400 17px/21px roboto;} .maincontent p a{ text-decoration:none; color:#3F84FD;}.maincontent p a b{ font-weight:normal;}.maincontent h1{ font:bold 26px/30px roboto; color:#000; margin-bottom:10px;} .maincontent p.subtext{ font:400 16px/20px roboto; margin-bottom:10px;color: #666;} .maincontent .author-info{ margin-bottom:10px; overflow:hidden;} .maincontent .author-info .name{ font:400 14px/15px roboto; color:#9D9D9D; margin-bottom:5px; width:auto; float:left;}	.maincontent .author-info .datetime{ font:400 14px/15px roboto; color:#9D9D9D; width:auto; float:left;} .maincontent figure.mosimg{ margin:0 -20px 20px;} .maincontent .quotes{ border-left:3px solid #CA0000; padding:0 0 0 15px; margin:20px; font:400 16px/21px roboto; color:#424242;} .maincontent .highlight-section{ margin:30px 0;} .maincontent .highlight-section h3{ font:bold 22px/25px roboto; margin-bottom:10px;}.maincontent .highlight-section ol{  margin: 0;padding: 0; list-style-type: none; counter-reset: item;} .highlight-section ol li{color:#D30F11; font-size:30px; line-height:0; font-weight:bold; counter-increment: item; display: table; padding:5px 0;} .highlight-section ol li:before{content: counters(item, "") ""; display: table-cell; padding-right:15px; position: relative;top: 10px;}.maincontent .highlight-section ol li span{ color:#000; font:400 17px/22px roboto;}.ad-inner{ background:#EFEFEF; text-align:center; padding:5px 0; margin:0 -10px;} .ad-inner h6{ font-size:12px; color:#989898; font-weight:500;}.other-news{ padding:30px 10px;} .other-news h2{ color:#FE1322; font:bold 24px/25px roboto; margin-bottom:15px;}.other-news .othernews-row{ padding:15px 0; border-bottom:1px solid #D9D9D9; overflow:hidden;} .other-news .othernews-row .newstext{ width:70%; float:left; font:500 16px/21px roboto; color:#111;}.other-news .othernews-row .newstext .subtitile{ font:400 13px/18px roboto; color:#666;padding-top: 5px; display:none;}.other-news .othernews-row .newstext a{font:bold 16px/21px roboto; color:#000; text-decoration:none;}.other-news .othernews-row .newsimage{ width:25%; float:right;} amp-video{ margin:15px -10px;}footer.footersection{padding:10px;} footer nav.footernav{border-bottom:1px solid #d8d8d8; border-top:1px solid #d8d8d8; text-align:left; padding:6px 0;}footer nav.footernav ul li{display: inline-block; list-style:none; font-size:14px; color:#666;}footer nav.footernav ul li a{color: #1a7dcc; font-size: 14px; text-decoration: none; padding-right:20px;} footer.footersection .copyright{font-size:10px; text-align:left; color:#666;line-height: 16px;padding-top: 10px;} a.gototop{ color: #111111;float: right; font-size: 13px;position: relative;text-decoration: none;top: -17px; width: auto;}.social-icons .socalsprit{background-image:url(https://smedia2.intoday.in/aajtak/amp/socialicon-spritenew2.png);background-repeat: no-repeat;background-size: 70% auto;} .social-icons{ width:110px; margin:0 auto;} .social-icons a.facebooklike{background-position: center 0;display: inline-block;height:47px;text-indent: -99999px;width: 50px;} .social-icons a.twitterfollow{background-position:center -45px;display: inline-block;height:47px;text-indent: -99999px;width: 50px;}.story-content .caption{font-size:15px; color:#999; line-height:23px; display:block;}.newstext .datetime {font: 400 13px/17px roboto;color: #666; padding: 7px 0 5px;} @media (min-width:479px){.other-news .othernews-row .newstext .subtitile{ display:block;}}
.sprite{ background-image:url(https://smedia2.intoday.in/indiatoday/amp-image/amp-socialicon.gif);}
.share-icon{ margin:20px -20px 5px; padding:0;} .share-icon ul{ list-style:none; margin:0; padding:0;} .share-icon ul li{ width:31.8%; margin:0; display:inline-block; text-align:center;}.share-icon ul li:nth-child(3){width:36%;} .share-icon ul li i{ display:inline-block; background-repeat:no-repeat;}
.share-icon ul li i.facebook{ background-position:0 0; width:83px; height:34px;}
.share-icon ul li i.twitter{ background-position:-89px 0; width:83px; height:34px;}
.share-icon ul li i.whtsapp{background-position:-177px 0; width:100px; height:34px;}
.amp-ad{ background:#eee; text-align:center; padding:5px 0; margin:5px 0 0;}
 .lightbox { width:100%; height:100%; background:#fff;} .lightbox .menulist{ height: 100%;
overflow-x: hidden;overflow-y: scroll; padding-top:40px;} .lightbox .menulist ul li{width: 49%; float: left; padding: 0px 0 0px 10%; box-sizing: border-box; list-style: none;} .lightbox .menulist ul li a{color: #222; font: 400 18px/18px roboto; padding: 8px 0; text-decoration:none; display:block;}.openmenu{background:url(https://smedia2.intoday.in/aajtak/amp/menu_icon.png) no-repeat 0 0; border:0; width:40px; height:40px; margin-left: 10px; position: absolute; top: 0px;} .closemenu{ background:url(https://smedia2.intoday.in/aajtak/amp/closemenu.gif) no-repeat 0 0; width:33px; height:37px; position:absolute; border:0;right: 10px; top: 10px;} figcaption {background: rgba(0, 0, 0, 0.5);color: #ffffff;font: 500 14px/19px roboto;padding: 10px; margin-bottom: 20px;width: 100%;margin-left: -10px; }
 </style>
    
   		<script async custom-element="amp-twitter" src="https://cdn.ampproject.org/v0/amp-twitter-0.1.js"></script>
        <script async custom-element="amp-instagram" src="https://cdn.ampproject.org/v0/amp-instagram-0.1.js"></script>
        <script async custom-element="amp-audio" src="https://cdn.ampproject.org/v0/amp-audio-0.1.js"></script>
        <script async custom-element="amp-analytics" src="https://cdn.ampproject.org/v0/amp-analytics-0.1.js"></script>
        <script async custom-element="amp-fit-text" src="https://cdn.ampproject.org/v0/amp-fit-text-0.1.js"></script>
        <script async src="https://cdn.ampproject.org/v0.js"></script>
        <script async custom-element="amp-lightbox" src="https://cdn.ampproject.org/v0/amp-lightbox-0.1.js"></script>

  </head>
  <body>
 <a name="top"></a>
  <amp-lightbox id="businesstoday-menu" layout="nodisplay" class="-amp-element -amp-layout-nodisplay -amp-layout" >
        
    <div class="-amp-fill-content"><div class="lightbox">
            <button on="tap:businesstoday-menu.close" class="closemenu"></button>
            <div class="menulist">
                <ul>
					<li><a href="http://m.businesstoday.in/" title="Home">Home</a></li><li><a href="http://m.businesstoday.in/section/99/1/big-story.html" title="Big Story">Big Story</a></li><li><a href="http://m.businesstoday.in/section/105/1/latest-headlines.html" title="Top News">Top News</a></li><li><a href="http://m.businesstoday.in/section/111/1/markets.html" title="Markets">Markets</a></li><li><a href="http://m.businesstoday.in/section/110/1/technology.html" title="Technology">Technology</a></li><li><a href="http://m.businesstoday.in/section/101/1/sectors.html" title="Industry">Industry</a></li><li><a href="http://m.businesstoday.in/section/103/1/management.html" title="Management">Management</a></li><li><a href="http://m.businesstoday.in/section/102/1/opinion.html" title="Opinion">Opinion</a></li><li><a href="http://m.businesstoday.in/section/125/1/from-the-mag.html" title="From The Mag">From The Mag</a></li>                                      
                </ul>
            </div>
        </div></div></amp-lightbox>
    <header class="masthead"><button on="tap:businesstoday-menu" class="openmenu"></button><a target="_blank" href="https://smedia2.intoday.in/wap/btwap/images/logo.png"><i class="icon-logo">Bussiness Today</i></a></header>
    <div class="amp-ad">
 <h6>SPONSERED ADS</h6>
 <amp-ad width=320 height=50  type="adsense" data-ad-client="/1007232/AMP_BT_Video_320x50_Top" data-ad-slot="/1007232/AMP_BT_Video_320x50_Top"></amp-ad>
 </div>
  <div class="maincontent" role="main">
		 <h1><%= title%></h1>
		 <div class="author-name">
              <span itemscope="" itemtype="http://schema.org/Person" itemprop="author"><%= aDTO.getVideoByline()%></span>
         </div>
         <div class="story-time"><%//= innerList.get(0).getCity()%>
                    <time class="header-time" itemprop="datePublished" datetime="<%= aDTO.getVideoCreatedDate()%>"><%= aDTO.getVideoCreatedDate()%></time>
         </div>
		 
	<%		
		//out.print(videoObj.getId());
		String extUrl	=	aDTO.getExternalVideoUrl().trim();
		extUrl	=	extUrl.replace("http://","https://");
		if(extUrl.contains("|"))
		{
			String arr[]	=	extUrl.split("|");
			out.print(arr[0]);
			
			%>
			<amp-video src="<%=arr[0] %>" width="500" height="400" layout="responsive" poster="<%=KICKER_IMG_PATH%><%= extraLargeImage%>" controls></amp-video>
			<figcaption><%=videoDescription%></figcaption>
	         <%
		}
		else
		{
			
			%>
			<amp-video src="<%=extUrl%>" width="500" height="400" layout="responsive" poster="<%=KICKER_IMG_PATH%><%= extraLargeImage%>" controls></amp-video>
			<figcaption><%=videoDescription%></figcaption>
	         <%
		}
	}
%>

    <div class="ad-inner">
     <h6>SPONSERED ADS</h6>
   <amp-ad width=300 height=250  type="adsense" data-ad-client="/1007232/AMP_BT_Video_300x250_MID" data-ad-slot="/1007232/AMP_BT_Video_300x250_MID"></amp-ad>
  </div>
  </div>


<!--  For video List Start-->

<div class="other-news">
<%
int videoCountDisplay = 4;
int currentPageNo = 1;
ArrayList videoListData = (ArrayList) ContentChunkHelper.latestVideo(primaryCategoryId, videoCountDisplay, "0");
if (videoListData != null && videoListData.size() > 0) {
	for (int ctr=0; ctr < videoListData.size(); ctr++) {
		
		ContentChunkDTO catDetail = (ContentChunkDTO) videoListData.get(ctr);
		if (ctr == 0 ) 
		{
			%>
            	<h2>Latest Video</h2>
            <%
		}
 		if(catDetail.getId()!=videoId) {
 			%>
         <div class="othernews-row">
          <div class="newstext">
            <a href="<%= SITE_URL %><%=catDetail.getContentURL()%>"><%=catDetail.getTitle()%></a>
            <div class="datetime"> <%=catDetail.getCreatedDate()%></div>
            <div class="subtitile"><%=catDetail.getTitle()%><br></div>
          </div>   
          <div class="newsimage">
            <a href="<%= SITE_URL %><%=catDetail.getContentURL()%>">
         	<%
    			if(catDetail.getSmallImage()!=null && !catDetail.getSmallImage().equals("null")) {%>
                	<amp-img width="305" height="182" layout="responsive" title="<%=catDetail.getTitle()%>" alt="<%=catDetail.getTitle()%>" src="<%=Constants.KICKER_IMG_PATH+catDetail.getSmallImage() %>"></amp-img>
            <%}else{%>
            		<amp-img width="74" height="75" layout="responsive" title="<<%=catDetail.getTitle()%>" alt="<%=catDetail.getTitle()%>" src="https://smedia2.intoday.in/indiatoday/defaultimage/88X66.gif"></amp-img>
            <%}%>
            </a>
            </div>
        </div>
            <%
 		}
		}} }else {
	String redirectURL = SITE_BASEPATH + "pagenotfound.jsp";
	response.sendRedirect(redirectURL);
}}%>
</div>
  <!--  For video List End-->
  
   <div class="amp-ad">
 <h6>SPONSERED ADS</h6>
 <amp-ad width=320 height=50  type="adsense" data-ad-client="/1007232/AMP_BT_Video_320x50_Bottom" data-ad-slot="/1007232/AMP_BT_Video_320x50_Bottom"></amp-ad>
 </div>
  <!-- comScore UDM pageview tracking -->
    <amp-analytics type="comscore">
        <script type="application/json">
            {
            "vars": {
            "c2": "8549097"
            }
            }
        </script>
    </amp-analytics>
    <!-- End comScore example -->
    <amp-analytics type="googleanalytics" id="analytics2">
        <script type="application/json">
            {
            "vars": {
            "account": "UA-34080153-13"
            },
            "triggers": {
            "defaultPageview": {
            "on": "visible",
            "request": "pageview",
            "vars": {
            "title": "<%=titleToDisplay%>"
            }
            }
            }
            }
        </script>
    </amp-analytics>
  
  
  </body>
</html>
</cache:cache>
</compress:html> 
<%!
	private static boolean isGistVideo(int videoId)
	{
		boolean result	=	false;
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			DbConnection  connect = null;  
			connect = DbConnection.getInstance("indiatoday");
			connection = connect.getConnection("indiatoday");
			String sql	=	"select * from jos_multimedia where content_id = ?";
			pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, videoId);
	    	rs = pstmt.executeQuery ();
			if(rs.next()){
				result = true;
			}
		}
		catch(Exception e){
			System.out.println("350 .......... /lite/video.jsp exception == "+e);
		}
		finally{
			try{
				if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(connection!=null)
				connection.close();
				
			}
			catch(Exception e){
			}
		}
		return result;
	}
	
	
		public String dateConverter(String inptDate) {
		String dateResult = "";
		try {
			String start_date = inptDate;
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.s"); 
			Date sdate = (Date)formatter.parse(start_date);
			
			DateFormat formatter_New = new SimpleDateFormat("MMMM dd, yyyy");
			dateResult = formatter_New.format(sdate);
		} catch (Exception ex) {
			//System.out.println(ex);
		}
		return dateResult;
	}	
%>