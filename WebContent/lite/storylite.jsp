<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %><compress:html removeIntertagSpaces="true">
<%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %>
<%@page language="java" import="java.net.*,java.util.ArrayList,java.util.regex.Matcher,java.util.regex.Pattern,com.itgd.utils.*,com.itgd.dto.StoryDTO,com.itgd.dto.ContentListDTO,com.itgd.dto.RelatedContentDTO,com.itgd.helper.StoryHelper"%>
<%@include file="../global_include.jsp"%>
<%
String baseUrl = request.getRequestURL().substring(0,request.getRequestURL().indexOf(request.getServletPath()))+"/";
String pattern="";
String s2="";
String s3="";
String s4="";
int id=0;
int count=0;
int checkPagebreak = 0;
int currentStoryPageNo = 1;
int currentPageNumber=1;
String[] storyBodyDisplay = null;
int issueId=0;
int settSecId=0;
int appsFlag=0;
String issueDate="";
if(request.getAttribute("storyId")!=null)
	id = (Integer)request.getAttribute("storyId");
if(request.getAttribute("currentPageNumber")!=null)
	currentPageNumber = (Integer)request.getAttribute("currentPageNumber");
String storyBody="";
String primaryCategory = "0";
String primaryCategoryNew = "0";
int primaryCategoryData=0;
%><cache:cache key="<%=SITE_URL+"/lite/story/"+currentPageNumber+"/"+id%>" scope="application " time="901" refresh="t" ><%
ArrayList storyData = (ArrayList) StoryHelper.storyDetail(id, 1);
StoryDTO aDTO = null;

if (storyData != null && storyData.size() > 0) {
for (int i = 0; i < storyData.size(); i++) {
aDTO = (StoryDTO) storyData.get(i);
System.out.println(storyData.get(i));
storyBody=aDTO.getFullDescription();

if(aDTO.getPrimaryCategory()!=null && aDTO.getPrimaryCategory().indexOf("#")>0)
{
primaryCategoryNew=aDTO.getPrimaryCategory().split("#")[1];
}
appsFlag=aDTO.getAppsFlag();
ArrayList resultPreviousNext = (ArrayList) StoryHelper.GetNextPreviousArticle(aDTO.getPrimaryCategory().replaceAll("#","~"), id);
String previousLabel="";
String nextLabel="";
primaryCategoryData=Integer.parseInt(primaryCategoryNew);
request.setAttribute("add_categoryid",primaryCategoryData);
%>
<!doctype html>
<html amp>
<head>
<meta charset="utf-8">
<title><%=aDTO.getTitleAlias()%></title>
<link rel="canonical" href="http://www.businesstoday.in/<%=CommonUtilFunctions.suggestedStoryUrl(aDTO.getId())%>" >  
<meta name="viewport" content="width=device-width,minimum-scale=1,initial-scale=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<meta name="description" content="<%=aDTO.getMetaDescription().replaceAll("\"","").replaceAll("\\<.*?>","")%>" />
<meta name="keywords" content="<%=aDTO.getMetaKeyword()%>" /> 
<script type="application/ld+json">
  {
        "@context": "http://schema.org",
        "@type": "NewsArticle",
        "mainEntityOfPage": "<%=SITE_URL%>",
        "headline": "<%=aDTO.getTitleAlias().replaceAll("\\<.*?>","")%>",
        "datePublished": "<%=aDTO.getCreatedDate()%>",
        "dateModified": "<%=aDTO.getCreatedDate()%>",
        "description": "<%=aDTO.getMetaDescription().replaceAll("\"","").replaceAll("\\<.*?>","")%>",
         "author": {
         "@type": "Person",
		  <%
		  	if(null != aDTO.getByline() && aDTO.getByline().length()>0)
				{
				%>"name": "<%=aDTO.getByline()%>"
				<%
				}
			else{
				%>
					"name": "Business Today Bureau"
				<%
			}
	%>
          },
        "publisher": {
         "@type": "Organization",
         "name": "BusinesToday",
         "logo": {
          "@type": "ImageObject",
          "url": "http://media2.intoday.in/wap/btwap/images/logo.png",
          "width": 156,
          "height": 32   
          }        
        },
        "image": {
          "@type": "ImageObject",
          "url": "<%=Constants.KICKER_IMG_PATH+aDTO.getLargeKickerImage()%>",
          "height": 496,
          "width": 700
        }
      }
 </script>
<style amp-boilerplate>body{-webkit-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-moz-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-ms-animation:-amp-start 8s steps(1,end) 0s 1 normal both;animation:-amp-start 8s steps(1,end) 0s 1 normal both}@-webkit-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-moz-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-ms-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-o-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}</style><noscript><style amp-boilerplate>body{-webkit-animation:none;-moz-animation:none;-ms-animation:none;animation:none}</style></noscript>

  
  <style amp-custom>
* {
	margin:0;
	padding:0;
}
body {
	font-family:roboto;
	font-size:100%;
}
header.masthead {
	padding:10px 0;
	border-bottom:2px solid #EAEAEA;
}
header.masthead i.icon-logo {
	background:url(http://media2.intoday.in/wap/btwap/images/logo.png) no-repeat center center;
	display: block;
	height: 27px;
	text-indent: -9999px;
}
.maincontent {
	padding:10px 20px;
}
.maincontent p {
	color:#333;
	margin-bottom:18px;
	font:400 17px/21px roboto;
}
.maincontent p a {
	text-decoration:none;
	color:#3F84FD;
}
.maincontent p a b {
	font-weight:normal;
}
.maincontent h1 {
	font:bold 26px/30px roboto;
	color:#000;
	margin-bottom:10px;
}
.maincontent p.subtext {
	font:400 16px/20px roboto;
	margin-bottom:10px;
	color: #666;
}
.maincontent .author-info {
	margin-bottom:10px;
	overflow:hidden;
}
.maincontent .author-info .name {
	font:400 14px/15px roboto;
	color:#9D9D9D;
	margin-bottom:5px;
	width:auto;
	float:left;
}
.maincontent .author-info .datetime {
	font:400 14px/15px roboto;
	color:#9D9D9D;
	width:auto;
	float:left;
}
.maincontent figure.mosimg {
	margin:0 -20px 20px;
}
.maincontent .quotes {
	border-left:3px solid #CA0000;
	padding:0 0 0 15px;
	margin:20px;
	font:400 16px/21px roboto;
	color:#424242;
}
.maincontent .highlight-section {
	margin:30px 0;
}
.maincontent .highlight-section h3 {
	font:bold 22px/25px roboto;
	margin-bottom:10px;
}
.maincontent .highlight-section ol {
	margin: 0;
	padding: 0;
	list-style-type: none;
	counter-reset: item;
}
.highlight-section ol li {
	color:#D30F11;
	font-size:30px;
	line-height:0;
	font-weight:bold;
	counter-increment: item;
	display: table;
	padding:5px 0;
}
.highlight-section ol li:before {
	content: counters(item, "") "";
	display: table-cell;
	padding-right:15px;
	position: relative;
	top: 10px;
}
.maincontent .highlight-section ol li span {
	color:#000;
	font:400 17px/22px roboto;
}
.ad-inner {
	background:#EFEFEF;
	text-align:center;
	padding:5px 0;
	margin:0 -10px;
}
.ad-inner h6 {
	font-size:12px;
	color:#989898;
	font-weight:500;
}
.other-news {
	padding:30px 10px;
}
.other-news h2 {
	color:#FE1322;
	font:bold 24px/25px roboto;
	margin-bottom:15px;
}
.other-news .othernews-row {
	padding:15px 0;
	border-bottom:1px solid #D9D9D9;
	overflow:hidden;
}
.other-news .othernews-row .newstext {
	width:70%;
	float:left;
	font:500 16px/21px roboto;
	color:#111;
}
.other-news .othernews-row .newstext .subtitile {
	font:400 13px/18px roboto;
	color:#666;
	padding-top: 5px;
	display:none;
}
.other-news .othernews-row .newstext a {
	font:bold 16px/21px roboto;
	color:#000;
	text-decoration:none;
}
.other-news .othernews-row .newsimage {
	width:25%;
	float:right;
}
amp-video {
	margin:15px -10px;
}
footer.footersection {
	padding:10px;
}
footer nav.footernav {
	border-bottom:1px solid #d8d8d8;
	border-top:1px solid #d8d8d8;
	text-align:left;
	padding:6px 0;
}
footer nav.footernav ul li {
	display: inline-block;
	list-style:none;
	font-size:14px;
	color:#666;
}
footer nav.footernav ul li a {
	color: #1a7dcc;
	font-size: 14px;
	text-decoration: none;
	padding-right:20px;
}
footer.footersection .copyright {
	font-size:10px;
	text-align:left;
	color:#666;
	line-height: 16px;
	padding-top: 10px;
}
a.gototop {
	color: #111111;
	float: right;
	font-size: 13px;
	position: relative;
	text-decoration: none;
	top: -17px;
	width: auto;
}
.social-icons .socalsprit {
	background-image:url(http://media2.intoday.in/aajtak/amp/socialicon-spritenew2.png);
	background-repeat: no-repeat;
	background-size: 70% auto;
}
.social-icons {
	width:110px;
	margin:0 auto;
}
.social-icons a.facebooklike {
	background-position: center 0;
	display: inline-block;
	height:47px;
	text-indent: -99999px;
	width: 50px;
}
.social-icons a.twitterfollow {
	background-position:center -45px;
	display: inline-block;
	height:47px;
	text-indent: -99999px;
	width: 50px;
}
.story-content .caption {
	font-size:15px;
	color:#999;
	line-height:23px;
	display:block;
}
.newstext .datetime {
	font: 400 13px/17px roboto;
	color: #666;
	padding: 7px 0 5px;
}
@media (min-width:479px) {
.other-news .othernews-row .newstext .subtitile {
display:block;
}
}
.sprite {
	background-image:url(http://media2.intoday.in/indiatoday/amp-image/amp-socialicon.gif);
}
.share-icon {
	margin:20px -20px 5px;
	padding:0;
}
.share-icon ul {
	list-style:none;
	margin:0;
	padding:0;
}
.share-icon ul li {
	width:31.8%;
	margin:0;
	display:inline-block;
	text-align:center;
}
.share-icon ul li:nth-child(3) {
width:36%;
}
.share-icon ul li i {
	display:inline-block;
	background-repeat:no-repeat;
}
.share-icon ul li i.facebook {
	background-position:0 0;
	width:83px;
	height:34px;
}
.share-icon ul li i.twitter {
	background-position:-89px 0;
	width:83px;
	height:34px;
}
.share-icon ul li i.whtsapp {
	background-position:-177px 0;
	width:100px;
	height:34px;
}
.amp-ad {
	background:#eee;
	text-align:center;
	padding:5px 0;
	margin:5px 0 0;
}
.lightbox {
	width:100%;
	height:100%;
	background:#fff;
}
.lightbox .menulist {
	height: 100%;
	overflow-x: hidden;
	overflow-y: scroll;
	padding-top:40px;
}
.lightbox .menulist ul li {
	width: 49%;
	float: left;
	padding: 0px 0 0px 10%;
	box-sizing: border-box;
	list-style: none;
}
.lightbox .menulist ul li a {
	color: #222;
	font: 400 18px/18px roboto;
	padding: 8px 0;
	text-decoration:none;
	display:block;
}
.openmenu {
	background:url(http://media2.intoday.in/aajtak/amp/menu_icon.png) no-repeat 0 0;
	border:0;
	width:40px;
	height:40px;
	margin-left: 10px;
	position: absolute;
	top: 0px;
}
.closemenu {
	background:url(http://media2.intoday.in/aajtak/amp/closemenu.gif) no-repeat 0 0;
	width:33px;
	height:37px;
	position:absolute;
	border:0;
	right: 10px;
	top: 10px;
}body.amp-mode-touch{ border:0px;}
</style>
 <script async custom-element="amp-analytics" src="https://cdn.ampproject.org/v0/amp-analytics-0.1.js"></script>
  <script async custom-element="amp-twitter" src="https://cdn.ampproject.org/v0/amp-twitter-0.1.js"></script>		
    <script async custom-element="amp-instagram" src="https://cdn.ampproject.org/v0/amp-instagram-0.1.js"></script>
    <script async custom-element="amp-facebook" src="https://cdn.ampproject.org/v0/amp-facebook-0.1.js"></script>
    <script async custom-element="amp-lightbox" src="https://cdn.ampproject.org/v0/amp-lightbox-0.1.js"></script>
    <script async src="https://cdn.ampproject.org/v0.js"></script>   
  </head>
  
 <body>
 <a name="top"></a><amp-lightbox id="businesstoday-menu" layout="nodisplay" class="-amp-element -amp-layout-nodisplay -amp-layout">
    <div class="-amp-fill-content">
      <div class="lightbox">
        <button on="tap:businesstoday-menu.close" class="closemenu"></button>
        <div class="menulist">
          <ul>
            <li><a href="<%= SITE_URL %>" title="Home">Home</a></li>
                    <li><a href="<%= SITE_URL %>section/99/1/big-story.html" title="Big Story">Big Story</a></li>
                    <li><a href="<%= SITE_URL %>section/105/1/latest-headlines.html" title="Top News">Top News</a></li>
                    <li><a href="<%= SITE_URL %>section/111/1/markets.html" title="Markets">Markets</a></li>
                    <li><a href="<%= SITE_URL %>section/110/1/technology.html" title="Technology">Technology</a></li>
                    <li><a href="<%= SITE_URL %>section/101/1/sectors.html" title="Industry">Industry</a></li>
                    <li><a href="<%= SITE_URL %>section/103/1/management.html" title="Management">Management</a></li>
                    <li><a href="<%= SITE_URL %>section/102/1/opinion.html" title="Opinion">Opinion</a></li>
                    <li><a href="<%= SITE_URL %>section/125/1/from-the-mag.html" title="From The Mag">From The Mag</a></li>    
          </ul>
        </div>
      </div>
    </div>
  </amp-lightbox>
  <header class="masthead">
    <button on="tap:businesstoday-menu" class="openmenu"></button>
    <a target="_blank" href="http://m.businesstoday.in/"><i class="icon-logo">Bussiness Today</i></a></header>
 <div class="amp-ad">
 <h6>SPONSERED ADS</h6>
 <amp-ad width=320 height=50  type="adsense" data-ad-client="/1007232/AMP_BT_Story_320x50_Top" data-ad-slot="/1007232/AMP_BT_Story_320x50_Top"></amp-ad>
 </div>
 <div class="maincontent" role="main">
  <h1><%=aDTO.getTitleAlias().replaceAll("\\<.*?>","")%></h1>
  <p class="subtext"><%=aDTO.getMetaDescription().replaceAll("\"","").replaceAll("\\<.*?>","")%></p>
  <div class="author-info">
  <%if(null != aDTO.getByline() && aDTO.getByline().length()>0)
		{
			if(aDTO.getByline().contains("By")){
			%>
            <div class="name"><%=aDTO.getByline()%> &nbsp;</div>
			<%}
			else{%>
            <div class="name">By <%=aDTO.getByline()%> &nbsp;</div><%
			}
		}	
	%>
  <div class="datetime"><%=aDTO.getCreatedDate()%></div>
 </div>
 <figure class="mosimg">
  <%
   	
        if(aDTO.getLargeKickerImage()!=null && !aDTO.getLargeKickerImage().equals("null")) {%>
      	 <amp-img width="314" height="172" layout="responsive" title="<%if(aDTO.getLargeKickerImage()!=null && !aDTO.getLargeKickerImage().equals("null")){out.println(aDTO.getLargeKickerImage());} %>" alt="<% if(aDTO.getLargeKickerImage()!=null && !aDTO.getLargeKickerImage().equals("null")){out.println(aDTO.getLargeKickerImage());} %>" src="<%=STORY_IMAGE_BASEPATH+aDTO.getLargeKickerImage() %>"></amp-img>
      	<%}else{%>
		 <amp-img width="314" height="172" layout="responsive" title="<% if(aDTO.getLargeKickerImage()!=null && !aDTO.getLargeKickerImage().equals("null")){out.println(aDTO.getLargeKickerImage());} %>" alt="<% if(aDTO.getLargeKickerImage()!=null && !aDTO.getLargeKickerImage().equals("null")){out.println(aDTO.getLargeKickerImage());} %>" src="http://media2.intoday.in/indiatoday/defaultimage/647X404.gif"></amp-img>
		<%}%>  
  	
    </figure>
 <%
 if(storyBody.trim().indexOf("mosimage") >= 0) {
	 storyBody = storyBody.replaceAll("mosimage","");
} 
if(storyBody.trim().indexOf("<ol>")>=0)
{
	storyBody = storyBody.replaceAll("<ol>","<div class=\"highlight-section\"><ol>").replaceAll("</ol>","</ol></div>").replaceAll("<li><div>","<li><span>").replaceAll("</div></li>","</span></li>").replaceAll("<b>","").replaceAll("</b>",""); 	
}

if(storyBody.trim().indexOf("platform.twitter.com/widgets.js")>=0){
	storyBody.replaceAll("<script (.*)</script>","");
}
storyBody = storyBody.replaceAll("\\{funfacts\\}","").replaceAll("<b>","").replaceAll("</b>","").replaceAll("<u>","").replaceAll("</u>","").replaceAll("<font color=\"#cc0000\">","").replaceAll("</font>","");

//storyBody =	replaceDivision(storyBody);
storyBody	=	storyBody.replaceAll("<script async=\"\" src=\"//platform.twitter.com/widgets.js\" ></script>","");
if(checkPagebreak >= 0) {
if(currentStoryPageNo == 0) {
storyBody = storyBody.replaceAll("\\{mospagebreak\\}","");
} else {
storyBodyDisplay = storyBody.split("\\{mospagebreak\\}");
if(currentStoryPageNo > 0 && currentStoryPageNo <= storyBodyDisplay.length) {
storyBody = storyBodyDisplay[currentStoryPageNo-1];
} else {
storyBody = "Requested page does not exist. Please go from 0 to " + storyBodyDisplay.length + ".<br /> 0 for Complete story and 1 - " + storyBodyDisplay.length + " for Story part.";
}
}
} else if(currentStoryPageNo != 1) {
	storyBody = "Requested page does not exist. Story exists in single part.";
}
if(storyBody.contains("scrolling=\"no\" src=\"http://indiatoday.intoday.in/embed/\"")){
	storyBody=storyBody.replace("scrolling=\"no\" src=\"http://indiatoday.intoday.in/embed/\"","scrolling=\"no\" allowfullscreen  src=\"http://indiatoday.intoday.in/embed/\"");	
}
Pattern p = Pattern.compile("mce_href");
Matcher m1 = p.matcher(storyBody);
while (m1.find()) {
    count++;
}

String s1="";
int x1,x2;
for (int i1=0;i1<count;i1++)
{	
try{
pattern = "mce_href=\"(.*)\"";
Pattern r = Pattern.compile(pattern);
Matcher m = r.matcher(storyBody);
if (m.find( )) 
{
s1=m.group(0);
x1=s1.indexOf("html");
x2=x1+5;
s2=s1.substring(0,x2);
storyBody=storyBody.replaceAll(s2,"");
}
}catch (Exception e){
	System.out.println("Found Exception in BTWAP lite/storylite.jsp::  " + e);
}
}
%>
<%=storyBody.replaceAll("\\{\\}","").replaceAll("<hr>","").replaceAll("\\{blurb\\}","").replaceAll("<p><br></p>","").replaceAll("\\{quote\\}","")%>
<div class="other-news">
      <%
	ArrayList rltd = (ArrayList)CommonFunctions.latestStories("105", 3, String.valueOf(id));
if (rltd != null && rltd.size() > 0) {
	for (int ctr = 0; ctr < rltd.size(); ctr++) {
		ContentListDTO cDTO = (ContentListDTO) rltd.get(ctr);
		if(ctr==0)
		{
			%>
      <h2>Latest Stories</h2>
      <%
		}
		%>
      <div class="othernews-row">
        <div class="newstext"> <a href="<%=SITE_BASEPATH+"story/"+cDTO.getSefTitle().replaceAll(".html","")+"/1/"+cDTO.getId()+".html"%>"><%=cDTO.getTitle()%></a>
          <div class="datetime"> <%//=cDTO.getUpdatedTime()%></div>
          <div class="subtitile"><%=cDTO.getTitle()%><br>
          </div>
        </div>
        <div class="newsimage"> <a href="<%=SITE_BASEPATH+"story/"+cDTO.getSefTitle().replaceAll(".html","")+"/1/"+cDTO.getId()+".html"%>">
        <%if(cDTO.getImage().trim().length() > 0) {%><amp-img width="305" height="182" layout="responsive" title="<%=cDTO.getTitle()%>" src="<%=STORY_IMAGE_BASEPATH+cDTO.getImage().trim()%>" class="-amp-element -amp-layout-responsive -amp-layout-size-defined -amp-layout" id="AMP_1"><amp-img alt="<%=cDTO.getTitle()%>" class="-amp-fill-content -amp-replaced-content" width="305" height="182" src="<%=STORY_IMAGE_BASEPATH+cDTO.getImage().trim()%>"></amp-img><%}
			else{%><amp-img width="305" height="182" layout="responsive" title="<%=cDTO.getTitle()%>" alt="<%=cDTO.getTitle()%>" src="<%=NO_IMG_88x66%>" class="-amp-element -amp-layout-responsive -amp-layout-size-defined -amp-layout" id="AMP_1">
            <amp-img  alt="<%=cDTO.getTitle()%>" class="-amp-fill-content -amp-replaced-content" width="305" height="182" src="<%=NO_IMG_88x66%>"></amp-img><%}
		%>
          </a> </div>
      </div>
      <%
	}
}
%>
    </div>
 <div class="amp-ad">
 <h6>SPONSERED ADS</h6>
 <amp-ad width=320 height=50  type="adsense" data-ad-client="/1007232/AMP_BT_Story_320x50_Bottom" data-ad-slot="/1007232/AMP_BT_Story_320x50_Bottom"></amp-ad>
 </div>
 </div>
<amp-analytics type="comscore">
  	<script type="application/json"> {  "vars": {   "c2": "8549097"  }	} </script>
  </amp-analytics>
  <amp-analytics type="googleanalytics" id="analytics2">
  	<script type="application/json">
		{	"vars": { "account": "UA-34080153-13" },
  			"triggers": { "defaultPageview": { "on": "visible", "request": "pageview", "vars": { "title": "<%=aDTO.getTitleAlias()%>" } } }
		}
	</script>
  </amp-analytics> 
</body>
</html>
<%}}%>
 </cache:cache></compress:html>