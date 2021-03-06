<%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %><%@ page language="java" import="java.util.ArrayList, java.util.regex.Matcher, java.util.regex.Pattern, com.itgd.dto.VideoDTO, com.itgd.dto.ContentChunkDTO, com.itgd.helper.VideoHelper, com.itgd.helper.ContentChunkHelper, com.itgd.utils.CommonFunctions, com.itgd.utils.Constants, com.itgd.utils.StringUtil" pageEncoding="ISO-8859-1"%><%@include file="global_include.jsp"%>
<% String baseUrl = request.getRequestURL().substring(0,request.getRequestURL().indexOf(request.getServletPath()))+"/";	
	if(request.getServerName().contains("origin-")) {
		baseUrl = SITE_URL;
	}
	try{
int videoId = 0;
int currentVideoPageNo = 1;
int navigationFlag=0;
if(request.getAttribute("currentVideoId")!=null)
	videoId = (Integer)request.getAttribute("currentVideoId");
if(request.getAttribute("currentVideoPageNo")!=null)
	currentVideoPageNo = (Integer)request.getAttribute("currentVideoPageNo");

if(request.getParameter("nav")!=null)
	navigationFlag= Integer.parseInt(request.getParameter("nav").toString());
%><cache:cache key="<%=cacheURL+"video/"+currentVideoPageNo+"/"+videoId%>" scope="application " time="912" refresh="t" ><%
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
//int totalVideoCount = 0;
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
		pageMetaTitle = (videoTitleAlias + " | " + primaryCategoryTitle + " Videos | - India Today").replaceAll("\\<.*?>","");
		pageMetaKeywords = aDTO.getMetaKeywords().replaceAll("\\<.*?>","");
		pageMetaDescription = aDTO.getMetaDescription().replaceAll("\\<.*?>","");
		if(currentVideoPageNo > 1) {
			pageMetaTitle = pageMetaTitle + " - Part "+currentVideoPageNo;
			pageMetaKeywords = pageMetaKeywords + " - Part "+currentVideoPageNo;
			pageMetaDescription = pageMetaDescription + " - Part "+currentVideoPageNo;
		}
								
		//videoFileNameComplete = aDTO.getVideoFile();		
		videoFileNameComplete ="";
		
		if(videoFileNameComplete.trim().length() == 0){
			videoFileNameComplete=aDTO.getExternalVideoUrl();
		}		
		videoFileFolderName = aDTO.getVideoFolder();
		commentCount = aDTO.getVideoCommentCount();
}
}
if(pageMetaTitle.trim().length() <= 0) {
	pageMetaTitle = "Business Today: Business News, Latest Stock Market and Economy News India from Businesstoday.in";
}
StringBuffer videoFilePathSB_CS=new StringBuffer();

ArrayList videoFilesAL = (ArrayList) VideoHelper.videoFileNameAL(videoFileNameComplete);
int noofvideos = videoFilesAL.size();
if (videoFilesAL != null && videoFilesAL.size() > 0) {
	for (int ctr = 0; ctr < videoFilesAL.size(); ctr++) {
		if(videoFileNameComplete.contains("http://")){
			videoFilePathSB_CS.append('"'+(String)videoFilesAL.get(ctr)+'"');
		}else{
			//videoFilePathSB_CS.append('"'+VIDEO_PATH);
			videoFilePathSB_CS.append('"'+"http://mediacloud.intoday.in/indiatoday/video/");
			if(videoFileFolderName.trim().length()>0) {
				videoFilePathSB_CS.append(videoFileFolderName+"/");
			}
			videoFilePathSB_CS.append((String)videoFilesAL.get(ctr)+'"');
		}
		if(ctr!=videoFilesAL.size()-1)
			videoFilePathSB_CS.append(",");
	}}
int part = 0;
if (request.getParameter("part")!=null) {
	part = Integer.parseInt(request.getParameter("part"));
} else {
	part = currentVideoPageNo -1;
	if(part < 0 || part >= noofvideos)
		part = 0;
}
String currentVideoFileName = "";
String[] videoFilesSA1 = null;
if(videoFilePathSB_CS.indexOf(",") > 0) {
	videoFilesSA1 = videoFilePathSB_CS.toString().split(",");
	currentVideoFileName = videoFilesSA1[part].replaceAll("\"", "");
} else {
	currentVideoFileName = videoFilePathSB_CS.toString().replaceAll("\"", "");
}
String currentVideoFileType = "";
if(currentVideoFileName.length() > 0 && currentVideoFileName.indexOf(".") > 0) {
	currentVideoFileType=currentVideoFileName.substring(currentVideoFileName.lastIndexOf(".")+1,currentVideoFileName.length());
}

%>
<!DOCTYPE html>
<html lang="en"><head><%@include file="topchartbeat.jsp" %>
  <%@include file="googleanalytics.jsp"%> 
    <meta charset="utf-8">
<base href="<%=baseUrl%>"/>
<title>| Video | <%=pageMetaTitle%></title>
<meta name="description" content="<%=pageMetaDescription%>" />
<meta name="keywords" content="<%=pageMetaKeywords%>" />
<meta name="viewport" id="viewport" content="width=device-width; initial-scale=1.0; minimum-scale=1.0; maximum-scale=1.0; user-scalable=no;"/>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>

<style>
.caption-video{width:23px; height:23px;  position:absolute; bottom:-27px; left:-36px; background:url(http://media2.intoday.in/businesstoday/mobile/vid-cap.png) no-repeat}
</style>
<script src="http://content.jwplatform.com/libraries/V30NJ3Gt.js"></script> 
<style>
.jw-icon-prev, .jw-icon-next{ display:none;} .jw-slider-horizontal{ height:1em;} .jw-controlbar-center-group{ width:100%;}  .jw-text-elapsed { padding-left:0; padding-right:8px!Important; } 
.jw-controlbar .jw-overlay{left:-615%;}
.jw-skin-roundster .jw-playlist-container{ left:0;}
.jw-playlist .jw-name{ width:15em;}
.jwplayer.jw-flag-ads .jw-controlbar .jw-text-alt{ font-size:.60em;}

/*.jw-icon-playlist{ position:absolute; right:248%; top:-118px; border-radius:50%; padding:5px;} .jw-text-duration{ margin-right:30px;}*/
/*
@media only screen and (min-device-width : 320px) and (max-device-width : 360px) { .jw-icon-playlist{ right:8%; top:-112px; } }
@media only screen and (min-device-width : 360px) and (max-device-width : 400px) { .jw-icon-playlist{ right:4%; top:-190px; } }
@media only screen and (min-device-width : 400px) and (max-device-width : 450px) { .jw-icon-playlist{ right:3%; top:-250px; } }
@media only screen and (min-device-width : 450px) and (max-device-width : 500px) { .jw-icon-playlist{ right:3%; top:-300px; } }
@media only screen and (min-device-width : 500px) and (max-device-width : 600px) { .jw-icon-playlist{ right:3%; top:-360px; } }*/

/*@media only screen and (min-device-width : 640px) and (max-device-width : 768px) { .jw-icon-playlist{ left:90%;}}
@media only screen and (min-device-width : 520px) and (max-device-width : 641px) { .jw-icon-playlist{ left:87%; border:1px solid green;}}
@media only screen and (min-device-width : 361px) and (max-device-width : 521px) { .jw-icon-playlist{ left:87%; border:1px solid red;}}
@media only screen and (min-device-width : 350px) and (max-device-width : 360px) { .jw-icon-playlist{ left:79%; border:1px solid blue;}}
@media only screen and (min-device-width : 310px) and (max-device-width : 351px) { .jw-icon-playlist{ left:78%; border:1px solid white;}}
</style>
<style>
.pmedia-play-icon {
    background: url("http://media2.intoday.in/indiatoday/images/svid.png") no-repeat scroll transparent;
    bottom: -45px;
    display: block;
    height: 18px; 
    right: -70px;
    width: 18px;    
	position: relative;/* bottom: 75%;left: 45%;display: block;
}*/
#navigations{
height:25px !important;
}
#videoplayer{ position:relative;}

</style>
 <link rel="stylesheet" href="css/mobile.css" type="text/css">
<%if(request.getAttribute("javax.servlet.forward.request_uri")!=null){ %>
<link rel="canonical" href="http://businesstoday.intoday.in<%=request.getAttribute("javax.servlet.forward.request_uri").toString().replace("//video","/video")%>" />
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



<% if(currentVideoFileType.equals("flv") || currentVideoFileType.equals("mp4")) {
	int streamer=1;
	String videomp4fullnamen="";
	String videomp4fullname="";
	String videomp4fullname_android="";
	String videomp4fullname_download="";
	String arrPlaylistnew[]={videoFilePathSB_CS.toString()};
	String splittedArray[]=arrPlaylistnew[0].split(",");
	String mp4videoWebPathnew[]=new String [splittedArray.length];
	String mp4videonew[]=new String [splittedArray.length];
	String ThreeGPvideoPathFinalnew[]=new String [splittedArray.length];
	String mp4basepath = "";
	String mp4path = "";

	for(int i=0;i<splittedArray.length;i++){
		if(splittedArray[i].indexOf(".mp4") >= 0 && (splittedArray[i].indexOf("videodeliverys3") >= 0 || splittedArray[i].indexOf("medias3d") >= 0)) {
			mp4videoWebPathnew[i]  = "mp4:"+splittedArray[i].replace("http://videodeliverys3.s3.amazonaws.com/", "").replace("http://medias3d.intoday.in/", "").replaceAll("\"","");
		}else{
			mp4videoWebPathnew[i] = "mp4:"+splittedArray[i].replace("http://videodeliverys3.s3.amazonaws.com/", "").replace("http://medias3d.intoday.in/", "").replace(".flv", ".mp4").replaceAll("\"","");
		}
		if(splittedArray[i].indexOf(".flv") > 0 && mp4videoFlag==0)
		{
			mp4videoWebPathnew[i]=splittedArray[i];
			streamer=0;
		} else {	
			if(splittedArray[i].indexOf("mediacloud.intoday.in") > 0) {
			mp4videoWebPathnew[i] = "mp4:"+splittedArray[i].replace("http://mediacloud.intoday.in/", "").replace(".flv", ".mp4").replaceAll("\"","");
			mp4videoWebPathnew[i] = mp4videoWebPathnew[i].substring(0, mp4videoWebPathnew[i].lastIndexOf("_")) + ".mp4";
							streamer=1; 
							} else {
								mp4videoWebPathnew[i] = "mp4:"+splittedArray[i].replace("http://videodeliverys3.s3.amazonaws.com/", "").replace("http://medias3d.intoday.in/", "").replace(".flv", ".mp4").replaceAll("\"","");
							streamer=1; 
							}
						}
		if(isExternalVideo==1) {
			if(splittedArray[i].indexOf(".flv") > 0) {
				splittedArray[i] = splittedArray[i].substring(0, splittedArray[i].lastIndexOf("."))+".mp4";
			}
			mp4videonew[i] = splittedArray[i];
			if(mp4videonew[i].indexOf("http://videodeliverys3.s3.amazonaws.com/indiatoday/video/") >= 0) {
				mp4videonew[i] = mp4videonew[i].replaceAll("http://videodeliverys3.s3.amazonaws.com/indiatoday/video/", "http://d1jhvk1xjm92rd.cloudfront.net/vods3/_definst_/mp4:amazons3/videodeliverys3/indiatoday/video/");
			}
			if(mp4videonew[i].indexOf("http://mediacloud.intoday.in/indiatoday/video/") >= 0) {
				mp4videonew[i] = mp4videonew[i].replaceAll("http://mediacloud.intoday.in/indiatoday/video/", "http://d1jhvk1xjm92rd.cloudfront.net/vods3/_definst_/mp4:amazons3/videodeliverys3/indiatoday/video/");
			}
		} else {
			//mp4basepath = "http://videodeliverys3.s3.amazonaws.com/indiatoday/video/";
			mp4basepath = "http://d1jhvk1xjm92rd.cloudfront.net/vods3/_definst_/mp4:amazons3/videodeliverys3/indiatoday/video/";
			if(splittedArray[i].indexOf(".flv") > 0) {
				mp4path = splittedArray[i].substring(splittedArray[i].lastIndexOf("/")+1, splittedArray[i].lastIndexOf("_"))+".mp4";
			} else {
				mp4path = splittedArray[i].substring(splittedArray[i].lastIndexOf("/")+1, splittedArray[i].length());
			}
			mp4videonew[i] = mp4basepath+""+videoFileFolderName+"/"+mp4path;
		}
		if(mp4videonew[i].indexOf("http://d1jhvk1xjm92rd.cloudfront.net/vods3/_definst_/mp4:amazons3/videodeliverys3") >= 0) {
			mp4videonew[i] = mp4videonew[i] + "/playlist.m3u8";
		} 
	    if(splittedArray[i].toString().indexOf(".flv")>0){
	         ThreeGPvideoPath=splittedArray[i].replace(".flv", ".3gp");
	         }
	         else if(splittedArray[i].indexOf(".mp4")>0)
	         {
	       	  ThreeGPvideoPath=splittedArray[i].replace(".mp4", ".3gp");
	       	  
	         }
	         if(ThreeGPvideoPath.contains("media1.intoday.in")){
	         ThreeGPvideoPathFinal=ThreeGPvideoPath.replace("http://media1.intoday.in","http://mediacloud.intoday.in");
	         }
	         else{
	       int lastslash=  ThreeGPvideoPath.lastIndexOf("/");
	        ThreeGPvideoPath2=ThreeGPvideoPath.substring(0,lastslash)+"/3gp";
	        ThreeGPvideoPath3=ThreeGPvideoPath.substring(lastslash,ThreeGPvideoPath.length());
	        ThreeGPvideoPathFinalnew[i]=ThreeGPvideoPath2+ThreeGPvideoPath3;
	       }}%>
         
     <% ///////// CHANGED BY LALIT  ////////
	videomp4fullnamen=videoFilePathSB_CS.toString();
	videomp4fullname_android=mp4videonew[0].replaceAll("\"","");
	videomp4fullname_download=ThreeGPvideoPathFinalnew[0].replaceAll("\"","");
	
	if(videomp4fullnamen.indexOf("aajtaks3.intoday.in") >= 0) {
	

	
				videomp4fullname = videomp4fullnamen.replaceAll("aajtaks3.intoday.in","aajtakclouds3.intoday.in");
				//videomp4fullname_android=videomp4fullname_android.replaceAll("aajtaks3.intoday.in","aajtakclouds3.intoday.in");
		}	
		
		if(videomp4fullname_download.indexOf("aajtaks3.intoday.in") >= 0) {
					videomp4fullname_download=videomp4fullname_download.replaceAll("aajtaks3.intoday.in","aajtakclouds3.intoday.in");
		  }			
	%>  
    <script type="text/javascript">
	var myUserAgent = navigator.userAgent;
		//alert(myUserAgent);
	var currentItem=<%=part%>;
	var videoSectionId=<%=primaryCategoryId%>;
	var vdopiavideoid=<%=videoId%>;
		
	var arrPlaylist=[<%=videomp4fullname%>];
	
	var autoplay="true";
	var mp4videoFlagJS = <%=mp4videoFlag%>;
	
	  $(document).ready(function() {	  
	  var playerInstance = jwplayer('videoplayer');
	  playerInstance.setup({  
	
	  <% if(splittedArray.length==1){ %>
	  playlist: [{
	        image: "http://media2.intoday.in/btmt/images/stories/<%=extraLargeImage%>",
	        sources: [
	        <% if(streamer==1){ %>
	        { 
	            file: "rtmp://mediaclouds3.intoday.in:80/cfx/st/<%=mp4videoWebPathnew[0].replaceAll("\"","")%>"
	        },<%}%>        
	        { 
	           file: "<%=videomp4fullname_android%>"
 
	        },{ 
		file: "<%=videomp4fullname_download.replaceAll("\"","").replaceAll("/3gp","").replaceAll(".3gp",".mp4").replaceAll("http://videodeliverys3.s3.amazonaws.com","http://medias3d.intoday.in")%>"	            
	        },{
	            file: "<%=videomp4fullname_download%>"
	        }]
	    }],
	    <%}else{%>
	     playlist: [
	    <% for(int ctr=0; ctr < splittedArray.length; ctr++) {%>
	   
		{
        title: "Part<%=ctr+1%>: <%=videoTitle%>  ",
        image: "http://media2.intoday.in/btmt/images/stories/<%=extraLargeImage%>",
		description: "<%=videoTitle%>",
		
		
		  sources: [
	        <% if(streamer==1){ %>
	        { 
	            file: "rtmp://mediaclouds3.intoday.in:80/cfx/st/<%=mp4videoWebPathnew[ctr].replaceAll("\"","")%>"
	        },<%}%>        
	        { 
	             file: "<%=mp4videonew[ctr].replaceAll("\"","")%>"
	        },{ 
	           
			file: "<%=ThreeGPvideoPathFinalnew[ctr].replaceAll("\"","").replaceAll("/3gp","").replaceAll(".3gp",".mp4")%>"
	        },{
	            file: "<%=ThreeGPvideoPathFinalnew[ctr].replaceAll("\"","")%>"
	        }]
		
		}<% if(ctr+1<splittedArray.length) out.print(",");   %>
		<%}%>
		],
	    <%}%>
	 primary: "html5",
 androidhls: true,
	  "stretching":"uniform",
	  <% if(streamer==1){ %>
	 rtmp: {
        bufferlength: 3
    },<%}%>
	sharing: {
      heading: "Share video"
   },
	 advertising: { 
    client: "googima",
    skipoffset:5,  
	schedule: {"myAds":{"offset":"pre","tag":"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480|400x300&iu=/1007232/m.businesstoday.in_VOD_Pre_roll&impl=s&gdfp_req=1&env=vp&output=xml_vast2&unviewed_position_start=1&url=[referrer_url]&description_url=[description_url]&correlator=[timestamp]"}}
 	
  	},
	   ga: {
		idstring: "<%=videoTitle%>",
		label: "<%=videoId%>"
	}
  	}); 
  });           
</script>
<%}%>

<script type="text/javascript">var _sf_startpt=(new Date()).getTime()</script>
<% if(kickerImage!=null && !kickerImage.equals("")) { %>
<link rel="image_src" href="<%=STORY_IMAGE_BASEPATH+kickerImage%>" />
<%}%>
<script type="text/javascript">
  window._taboola = window._taboola || [];
  _taboola.push({video:'auto'});
  !function (e, f, u, i) {
    if (!document.getElementById(i)){
      e.async = 1;
      e.src = u;
      e.id = i;
      f.parentNode.insertBefore(e, f);
    }
  }(document.createElement('script'),
  document.getElementsByTagName('script')[0],
  '//cdn.taboola.com/libtrc/indiatoday-network/loader.js',
  'tb_loader_script');
</script>
<%@include file="zedo-adCode-ros.jsp"%>
</head><body> 
<%@include file="zedo-adCode-ros-logo.jsp"%>
<%
if(navigationFlag==1){}else{%>
<%@ include file="topnav.jsp"%>
<%}%>
<div align="center"><%//@ include file="top_add.jsp"%></div>                        

<div style="height:5px;"></div>
 <div class="banner" style="margin-bottom:10px; text-align:center;"> 
		<a href="http://specials.indiatoday.com/survey/coolest-startups2017/registration.jsp" target="_blank">
			<img src="http://media2.intoday.in/businesstoday/1.0.3/resources/cooleststartup/2017/images/coolest-startups2017-banner.gif" alt="COOLEST START-UPS 2017">
		</a>
	</div>
<%if(primaryCategoryId==705 || primaryCategoryId==709 ) {%>
	<div style="padding-top:4px; text-align:center"><img src="http://media2.intoday.in/indiatoday/sosorry/logo.jpg" border="0"></div>
<% } %>
	<table cellpadding="0" cellspacing="0" width="100%" class="story_body mar15" style="width:300px; margin: 0 auto;">
	<!--<tr><td class="breadcrumb" style="padding-bottom:10px;"> <a href="<%=SITE_URL%>">Home</a> </td></tr> -->
	 <tr><td class="breadcrumb" style="padding-bottom:10px;"> <a href="<%=SITE_URL%>">Home</a>  <span style="margin:0px;"> &raquo;</span> <a href="videosection.jsp">Videos</a> &raquo; <a href="<%=CommonFunctions.videoListURL(primaryCategorySefTitle.toLowerCase(), 1, primaryCategoryId)%>"><%=primaryCategoryTitle%></a> <!--&raquo; Video --></td></tr>
	<% if(primaryCategoryId != 620) { %>
		<!--<tr><td class="breadcrumb"><div class="italic" style="padding-left:5px;">In association with<a href="http://headlinestoday.intoday.in/" target="_blank"><img src="http://indiatoday.intoday.in/images/ht_logo.jpg" align="absmiddle"></a></div></td></tr> -->
	<% } %>
<tr><td>
<section id="left">
<div id="section_video">						
						<div id="border" style="">
							<!--<div id="border1">-->
							<div id="section_video_top">
							<div style="margin: 0px 2px 0px; float: left;">
		<%if (currentVideoFileType.equals("wmv")) { %>
		<object id="Player2" classid="CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6" style="display: block;" width="278" height="247">
		<param name="autostart" value="true" id="A1">
		<param name="stretchToFit" value="True">
		<param name="uiMode" value="full">
		<param name="URL" 	value="<%=currentVideoFileName%>">
		<embed type="application/x-mplayer2" src="<%=currentVideoFileName%>" name="Player" autostart="true" width="278" height="247"></object>
		<object id="Player3" classid="CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6" style="display: none;" width="278" height="247">
		<param name="autostart" value="false" id="A1">
		<param name="stretchToFit" value="True">
		<param name="uiMode" value="full">
		<param name="URL" 	value="<%=currentVideoFileName%>">
		<embed type="application/x-mplayer2" src="<%=currentVideoFileName%>" name="Player" autostart="true" width="278" height="247">
		</object>
<%} else if (currentVideoFileType.equals("flv") || currentVideoFileType.equals("mp4")) { %>
<div style="float: right; font: 13px/16px Tahoma;  margin: 0;padding: 0px 0 5px 5px;width: 307px;">
<script>
	var mp4VideoParts="";
		document.write('<div style=\"margin:0 ; width:300px;\"><div  id=\"videoplayer\"></div></div>')
</script>
<div style="clear:both"></div>
<div style="width:300px;">
<h1 <% if(currentVideoFileType.equals("flv") || currentVideoFileType.equals("mp4")) {%> style="border-bottom: 0px; padding:5px 0px 0px 0px; display:inline-block; margin:0px 0px 0px 0px; width: 100%;line-height:19px; " <%} else{ %> style="border-bottom:0px; width:359px;" <%}%>><%=videoTitle%></h1>
<div class="date" <% if(currentVideoFileType.equals("flv") || currentVideoFileType.equals("mp4")) {%> style="border-bottom: 0px; font-size:12px; color:#666; padding:5px 0px; width: 100%; margin-left: 0px;" <%} else{ %> style="border-bottom:0px; width:359px;" <%}%>>
	<%
	if(!videoByline.trim().equals("") && videoByline!=null) {
		out.print(videoByline);
	}
	if((!videoByline.trim().equals("") && videoByline!=null) && (!videoCreatedDate.trim().equals("") && videoCreatedDate!=null)) {
		out.print(" | ");
	}		 
	out.print(videoCreatedDate);
	%>
</div>
<div <% if(currentVideoFileType.equals("flv") || currentVideoFileType.equals("mp4")) {%> style="width: 300px;; float: left; margin-left: 0px; border:0px solid green;" <%} else{ %> style="border-bottom:0px;" <%}%>><%=videoDescription%></div>
</div>
<% } %>
</div>
<br><br>
<ul <% if(currentVideoFileType.equals("flv") || currentVideoFileType.equals("mp4")) {%> style="width: 100%; float: left; margin-left: 0px;" <%}%>>
<%
String parts = "";
if(currentVideoFileType.equals("wmv")){
	for (int y = 0; y < noofvideos; y++) {
		if (y == 0) {
			parts = "1";
		} else {
			parts = "" + (y + 1);
		}
		if (part != y) {
%> 
			<li class="v_rel"><a href="video/<%=videoSefTitle+"/"+parts+"/"+videoId%>.html">Part <%=parts%></a></li>
<%}}}%>
</ul></div></div></div></div>
</section>
</td></tr></table>
<div style="float:left; width:100%" class="related_body">
<%
int videoCountDisplay = 10;
int currentPageNo = 1;
ArrayList videoListData = (ArrayList) ContentChunkHelper.latestVideo(primaryCategoryId, videoCountDisplay, "0");
if (videoListData != null && videoListData.size() > 0) {
	for (int ctr=0; ctr < videoListData.size(); ctr++) {
		
		ContentChunkDTO catDetail = (ContentChunkDTO) videoListData.get(ctr);
		if (ctr == 0 ) 
		{
 %>
<div style="height:5px;"></div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr><td height="7"></td></tr><tr><td bgcolor="#DD1920" class="subheading">other <%=catDetail.getCategoryTitle()%> videos</td></tr>
<%}
 if(catDetail.getId()!=videoId) {
 %>
	<tr><td  bgcolor="#FFFFFF" style="border-bottom:1px solid #DBDBDB;"><div style="margin-left:5px; line-height:20px;">
	<%if(catDetail.getSmallImage() != null && catDetail.getSmallImage().trim().length() > 0) {%>
		<a href="<%=catDetail.getContentURL()%>" class="posrel" style="position:relative"><div class="caption-video"></div><img src="<%=STORY_IMAGE_BASEPATH+catDetail.getSmallImage().trim()%>" width="88" height="66" align="left" style="margin:0 8px 0 2px; border:0;"/><span class="pmedia-play-icon"></span></a>
	<% } else {%>
		<a href="<%=catDetail.getContentURL()%>" class="posrel" style="position:relative"><div class="caption-video"></div><img src="<%=NO_IMG_88x66%>" width="88" height="66" align="left" style="margin:0 8px 0 2px; border:0;"/><span class="pmedia-play-icon"></span></a>
	<% }%>
	<a href="<%=catDetail.getContentURL()%>"><span class="story-title"><%=catDetail.getTitle()%></span></a></div></td></tr>
<%
 }
		}} else {
	String redirectURL = SITE_BASEPATH + "pagenotfound.jsp";
	response.sendRedirect(redirectURL);
}%>

<tr><td>
<div style="height:5px;"></div>
<div itemtype="http://schema.org/VideoGallery" itemscope="">
<meta itemprop="name" content="<%=videoTitle %>"/>
<meta itemprop="headline" content="<%=videoTitle %>"/>
<meta itemprop="description" content="<%=pageMetaDescription %>"/>
<meta itemprop="image" content="http://media2.intoday.in/btmt/images/stories/<%=extraLargeImage%>"/>
<meta itemprop="thumbnailUrl" content="http://media2.intoday.in/btmt/images/stories/<%=extraLargeImage%>"/>
<meta itemprop="url" content="http://www.businesstoday.in<%=request.getAttribute("javax.servlet.forward.request_uri").toString().replace("//video","/video")%>"/>
<meta itemprop="inLanguage" content="en_US"/>
<meta itemprop="keywords" content="<%=pageMetaKeywords %>"/>
<meta itemprop="publisher" content="Business Today" /></div>
<div id="taboola-mobile-below-player-thumbnails"></div>
<script type="text/javascript">
  window._taboola = window._taboola || [];
  _taboola.push({
    mode: 'thumbs-mobile-2r',
    container: 'taboola-mobile-below-player-thumbnails',
    placement: 'Mobile Below Player Thumbnails',
    target_type: 'mix'
  });
</script>
 <div style="height:5px;"></div>
</td></tr></table>	
</div>
<%
if(navigationFlag==1){}else{%>
<div style="float:left; width:100%"><%@ include file="othercategories.html"%></div>
<div style="float:left; width:100%"><%@include file="hotzone.html"%></div>
<div style="float:left; width:100%"><%@include file="ringtones.html"%></div>
<div style="float:left; width:100%"><%@ include file="bottomnav.html"%></div>
<div style="float:left; width:100%"><%@include file="bottom_add.jsp"%></div>
<%}%>
<script src="http://media2.intoday.in/indiatoday_wap/1.0.1/resources/js/ajaxinclude.js"></script>
<script type="text/javascript">ajaxinclude("http://m.businesstoday.in/adblock-video-ajax.html")</script>
<script type="text/javascript">
  window._taboola = window._taboola || [];
  _taboola.push({flush: true});
</script>
<jsp:include page="bottomchartbeat.jsp" >
	<jsp:param value="Videos" name="chartBeatSecName"/>
	<jsp:param value="<%= StringUtil.isEmpty(videoByline) %>" name="chartBeatAuthName"/>
	<jsp:param value="<%= StringUtil.replaceSingleQuote(StringUtil.isEmpty(videoTitle)) %>" name="chartBeatTitleName"/>
</jsp:include>
</body>
</html>
</cache:cache> 
<%}catch(Exception e){
	//System.out.println("Inside exception in video.jsp ------"+e);
response.sendRedirect(Constants.PAGE_NOT_FOUND);
} %>