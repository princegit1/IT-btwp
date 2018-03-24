<%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %>
<%@page language="java" import="java.net.*, java.util.ArrayList, com.itgd.utils.*, com.itgd.dto.StoryDTO,com.itgd.dto.ContentListDTO"%>
<%@include file="../global_include.jsp"%>
<%@include file="../googleanalytics_top.jsp"%> 
<cache:cache key="<%=SITE_URL+"budget/index32.jsp"%>" scope="application" time="300" refresh="t" >
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="refresh" content="300" />
<title>Budget 2014-Union Budget, Railway Budget, Annual Budget, India Budget News and Highlights</title>
<meta name="description" content="Budget 2014: Complete coverage of Budget/Union Budget 2014, Railway Budget 2013, Budget analysis, expectations and reactions on Indian Budget. Highlights, Flashes, Impact and Speech by P Chidambaram." />
<meta name="keywords" content="budget 2014, rail budget 2014, budget 2013 india, budget 2014 highlights, union budget 2013, budget 2013 income tax, indian railway budget 2013" />	
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="msvalidate.01" content="28AD13B9E2353694C455F57D02382A94" />
<link rel="stylesheet" href="http://m.businesstoday.in/css/mobile.css" type="text/css">
<link rel="stylesheet" href="http://m.businesstoday.in/budget/budget.css" type="text/css">
<script type="text/javascript" src="http://m.businesstoday.in/js/jquery-1.4.2.min.js"></script> 
<script type="text/javascript" src="http://m.businesstoday.in/js/jquery.cycle.all.min.js"></script>
<script type="text/javascript" src="http://m.businesstoday.in/js/jquery.touchwipe.js"></script>
<meta name="viewport" id="viewport" content="width=device-width; initial-scale=1.0; minimum-scale=1.0; maximum-scale=1.0; user-scalable=no;"></meta>
<link rel="canonical" href="http://businesstoday.intoday.in/budget/" />
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

<style>
body{margin:0; padding:0; font-family:Arial, Helvetica, sans-serif; font-size:12px;}
h1, h2, h3{margin:5px auto;}
.georgia{ font-family:Georgia, "Times New Roman", Times, serif;}
.lead{color:#2e3094; font-size:18px;}
.cf:before, cf:after{content:''; display:table}
.cf:after{clear:both;}
ul{margin:0; padding:0; overflow:hidden;}
ul li{list-style:none; }
.wrapper{ width:320px; border-top:5px solid #d81920; margin:auto;}
.bottom-border{ border-bottom:5px solid #2e3094;}
.container{width:95%; margin:auto; margin-bottom:15px;              overflow:hidden;}
.header1{width:100%; height:45px;}
.header2{width:100%; height:28px; color:white; line-height:28px;
background: #2e3094; /* Old browsers */
background: -moz-linear-gradient(left, #2e3094 0%, #d6000a 100%); /* FF3.6+ */
background: -webkit-gradient(linear, left top, right top, color-stop(0%,#2e3094), color-stop(100%,#d6000a)); /* Chrome,Safari4+ */
background: -webkit-linear-gradient(left, #2e3094 0%,#d6000a 100%); /* Chrome10+,Safari5.1+ */
background: -o-linear-gradient(left, #2e3094 0%,#d6000a 100%); /* Opera 11.10+ */
background: -ms-linear-gradient(left, #2e3094 0%,#d6000a 100%); /* IE10+ */
background: linear-gradient(to right, #2e3094 0%,#d6000a 100%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#2e3094', endColorstr='#d6000a',GradientType=1 ); /* IE6-9 */}
.header3{width:100%; height:59px; padding-top:12px;}
.heading{width:100%; background:#2e3094; color:white;}
.heading h2{ margin-left:6px;}
.box{width:100%; overflow:hidden; padding:5px 0 5px; border-bottom:1px solid #dedede;}
.box:last-child{border-bottom:0;}
.tab{width:100%; }
.tab-content{ background:#f1f1f1; padding:8px; border-radius:5px;}
.tab-tile{ background:#d71a21; color:white; height:25px;}
.tab-tile li{ float:left;}
#budget-navigation{ float:left;}
#budget-navigation a{color:white; font-weight:bold; text-decoration:none; font-size:13px; line-height:24px;     }
#budget-navigation li{ margin-right:30px;}
#budget-navigation li a.active{color:#fcb501;}
#budget-navigation li:first-child{ margin-left:5px;}
.arrow{width:100%; margin-bottom:-3px;}
.footer{width:100%;}
.tab{width:100%; }
.tab-content{ background:#f1f1f1; padding:8px; border-radius:5px;}
.tab-tile{ background:#d71a21; color:white; height:25px;}
.tab-tile li{ float:left;}
#budget-navigation{ float:left;}
#budget-navigation a{color:white; font-weight:bold; text-decoration:none; font-size:13px; line-height:24px;	}
#budget-navigation li{ margin-right:30px;}
#budget-navigation li a.active{color:#fcb501;}
#budget-navigation li:first-child{ margin-left:5px;}
.arrow{width:100%; margin-bottom:-3px;}
.footer{width:100%;}
.box-tab a.active-tab{color:#fcb501;}


/*slider*/

.home-slider{width:303px; background:#fff;}
.home-slider-tab{width:297px; height:25px;}
.box-tab{width:98px; height:25px; text-align:left; color:white; }
.box-tab a{color:white; text-decoration:none; line-height:26px; font-family:arial; font-size:12px; font-weight:bold;}
.belt-outer{width:357px; height:26px; overflow:hidden; position:relative}
.belt{margin:0; padding:0; overflow:hidden; position:absolute;}
.belt li{float:left;}
.belt-tab{margin:0; padding:0; overflow:hidden; position:absolute;left:11px }
.belt-tab li{float:left;}
.prev{width:27px; height:56px; background:url(http://media2.intoday.in/businesstoday/mobile/slider-left.png); position:absolute; top:51px; left:0; cursor:pointer; z-index:999;}

.prev-tab{width:9px; height:14px; background:url(http://media2.intoday.in/businesstoday/mobile/left.jpg); position:absolute; top:5px; left:2px; cursor:pointer; z-index:999;}
.next-tab{width:9px; height:14px; background:url(http://media2.intoday.in/businesstoday/mobile/right.jpg); position:absolute; top:5px; right:0; cursor:pointer; z-index:999;}
.box1{width:297px; text-align:center; color:white; font-size:100px; background:#f1eff0; position:relative}
.home-slider img{  broder:2px solid black;}
.subheadings{color: #ffffff;}
.subheadings a:hover{color: #ffffff!important;}
.caption{ position:absolute; bottom:-15px;}

ul li{ padding-left:0 !Important}
.photoicon{bottom:34px !important}
td{background:transparent !important}
.story-title{color:#606060}
.searchtext{cursor:pointer; float:left; font-weight:bold; font-size:14px;}
.searchtop{background:url("http://media2.intoday.in/businesstoday/mobile/search.jpg") no-repeat scroll 0 4px rgba(0, 0, 0, 0); width:21px !important}

/*slider*/

.home-slider{width:301px;  background:#fff;}
.home-slider-tab{width:297px; height:25px;}
.box-tab{width:96px; height:25px; color:white; }
.box-tab a{color:white; text-decoration:none; line-height:26px;}
.belt-outer2{width:357px; min-height:250px; position:relative}
.belt{margin:0; padding:0; overflow:hidden; position:absolute;}
.belt li{float:left; width:340px}
.belt-tab{margin:0; padding:0; overflow:hidden; position:absolute;}
.belt-tab li{float:left; padding: 0 0 0 2px !important;}
.prev{width:27px; height:56px; background:url(http://media2.intoday.in/businesstoday/mobile/slider-left.png); position:absolute; top:51px; left:0; cursor:pointer; z-index:999;}

.next{width:27px; height:56px; background:url(http://media2.intoday.in/businesstoday/mobile/slider-right.png); position:absolute; top:51px; right:16px; cursor:pointer; z-index:999;}
.prev-tab{width:9px; height:14px; background:url(http://media2.intoday.in/businesstoday/mobile/left.jpg); position:absolute; top:5px; left:0px; cursor:pointer; z-index:999;}
.next-tab{width:9px; height:14px; background:url(http://media2.intoday.in/businesstoday/mobile/right.jpg); position:absolute; top:5px; right:0px; cursor:pointer; z-index:999;}
.box1{width:300px; text-align:center; color:white; font-size:100px; background:#ffffff;}
.home-slider img{ border:2px solid black;}
.subheadings{color: #black;}
.subheadings a:hover{color: #ffffff!important;}
.caption a{ position:absolute; bottom:0px; width:300px; text-align:left; height:40px; line-height:22px;}
ul li{ padding-left:0 !Important}
.photoicon{bottom:34px !important}
.searchtext{cursor:pointer; float:left; font-weight:bold; font-size:14px;}
.searchtop{background:url("http://media2.intoday.in/businesstoday/mobile/search.jpg") no-repeat scroll 0 4px rgba(0, 0, 0, 0); width:21px !important}
.searchbox{width:100%; background:#bbbbbb;  display:none;}
.searchbox-inner{width:227px; margin-left:51px; overflow:hidden;padding: 5px 0;}

.more{ text-align:left !important;}
.more > a{color:#2e3094 !important; text-transform:uppercase}

/*video */

.caption-wrapper{width:88px; height:66px; position:relative; float:left; margin-right:12px;}
.caption-video{width:23px; height:23px;  position:absolute; bottom:2px; right:2px; background:url(http://media2.intoday.in/businesstoday/mobile/vid-cap.png) no-repeat}
.subheadings h2{ font-size:15px;}
.subheadings h2:hover{ color:white !important}
.subheading A{color:white !important}
.subheading{background: none repeat scroll 0 0 #2e3094; color:white !important}
@media screen and (max-width: 360px){
	.wrapper{width:100%;}
}
</style>
<script>
$(document).ready(function(e) {
	$('.searchtop').click(function(){
		$('.searchbox').slideToggle();
	});
	
	$('.searchtext').click(function(){
		$(this).hide();
		$('.sear').show();
		
	});
	$('.sear').blur(function(){
		$(this).hide();
		$('.searchtext').show();
	});
	
	/*budget tab*/
	$('.tab-budget').hide();
	$('.tab-budget:first').show();
	$(".box-tab a").click(function(){
		$(".box-tab a").removeClass('active-tab')
		$(this).addClass('active-tab');
		
		var getAttr = $(this).attr('href');
		$('.tab-budget').hide();
		$(getAttr).show();
		return false;
		
	});
	
	var len = $(".belt li").length;
	var tWidth = $(".belt li").width();
	var fWidth = (tWidth + 10) * len;
	$(".belt").css('width', fWidth)
	 var counter = 1;
	  $('.prev').hide();
	   //PREV
	 $('.prev').click(function(){
		 if(counter == 1){
		     $('.prev').fadeOut();
			 
		 }else{
			 $('.belt').animate({'left' :'+=342'});
			 $('.next').fadeIn();
			 //$('.prev').fadeOut();
		     counter -=1;
		 }
		 if(counter == 1){
		     $('.prev').fadeOut();
			 
		 }
	 });
	 //NEXT
	 $('.next').click(function(){
		
		 if(counter < len){
		   $('.belt').animate({'left' :'-=342'})
		   $('.prev').fadeIn();
		  
		   counter +=1;
		 }
		 else{
			 $('.next').fadeOut();
			 
		 }
		 if(counter == 5){
			 $('.next').fadeOut();
		 }
	 });
	 
	
	 

    
});
$(document).ready(function(e) {
	
	var len = $(".belt-tab li").length;
	var tWidth = $(".belt-tab li").width();
	var fWidth = (tWidth+6) * len;
	$(".belt-tab").css('width', fWidth)
	 var counter = 1;
	 
	 
	 
	 //NEXT
	 $('.next-tab').click(function(){
		
		 if(counter < len-1){
		   $('.belt-tab').animate({'left' :'-=102'})
		   $('.prev-tab').fadeIn();
		   $('.next-tab').fadeOut();
		   counter +=1;
		 }
		 else{
			 
			 
		 }
	 });
	 
	 //PREV
	 $('.prev-tab').click(function(){
		 if(counter == 1){
		     $('.prev-tab').fadeOut();
			 
			 
			 
		 }else{
			 $('.belt-tab').animate({'left' :'+=102'});
			 $('.next-tab').fadeIn();
			 $('.prev-tab').fadeOut();
		     counter -=1;
			 
		 }
		 
		
	 });
	 

    
});
</script>


</head><body> 
 
<!-- Begin comScore Tag --> 
<script> 
  var _comscore = _comscore || [];
  _comscore.push({ c1: "2", c2: "8549097" });
  (function() {
    var s = document.createElement("script"), el = document.getElementsByTagName("script")[0]; s.async = true;
    s.src = (document.location.protocol == "https:" ? "https://sb" : "http://b") + ".scorecardresearch.com/beacon.js";
    el.parentNode.insertBefore(s, el);
  })();
</script>  
<noscript> 
  <img src="http://b.scorecardresearch.com/p?c1=2&c2=8549097&cv=2.0&cj=1" />
</noscript> 
<!-- End comScore Tag --> 
	
<div class="wrapper">
 <div class="header1"><a href="#"><img src="http://media2.intoday.in/businesstoday/mobile/logo.jpg" style="margin-top:8px; margin-left:6px;"></a></div>
 <div class="header2"><span style="float:left; margin-left:6px;"> 
 <%	
java.util.Calendar currentDate = java.util.Calendar.getInstance();
java.text.SimpleDateFormat formatter=   new  java.text.SimpleDateFormat("MMM d | HH:mm");
String dateNow = formatter.format(currentDate.getTime());
out.println(dateNow+" IST"); %>
  </span>
  <!--<a href="#" style="color:white; float:right; text-decoration:none; font-weight:bold; background:url(search.jpg) no-repeat right; padding-right:22px;">SEARCH</a>-->
  
  <div style="float:right">
  	<form action="http://m.businesstoday.in/search.jsp" method="get" name="search">
	<input class="sear" type="text" maxlength="40" onfocus="if(this.value=='search...') this.value='';" onblur="if(this.value=='') this.value='search...';" value="search..." class="textboxs" alt="search" name="searchword" style="display:none">  
    <span class="searchtext">SEARCH</span>      
	<input type="button" value="" class="searchtop"  name="submit">
	</form>
  </div>
   
  </div>
  <div class="searchbox">
  <div class="searchbox-inner"><input type="text" style="float:left" /><input type="submit" value="SEARCH" style="float:left;background:#d80017; color:white; border:none;margin: 2px;    padding: 1px;"></div>
  </div>
  <div align="center" style="width:300px;margin:0px auto"> <%@include file="../bottom_add.jsp" %> </div>

 <div class="header3" style="text-align:center">
<!-- <h2 style="text-align:center; color:#777777;">UNION BUDGET 2014-15</h2>
 <h3 style="text-align:center;">FULL COVERAGE</h3>-->
 <img src="http://media2.intoday.in/businesstoday/mobile/banner_home.gif">
 </div> 

<jsp:include page="latest_stories_chunk.jsp" flush="true" >
	<jsp:param name="categoryId" value="178#635" /> 
	<jsp:param name="contentCount" value="2" /> 
	<jsp:param name="storyIdToAvoid" value="0" /> 
</jsp:include>

  <div class="heading"><a href="<%=SITE_BASEPATH+"section/178/1/union-budget-2014-15.html"%>" class="subheadings"><h2>UNION BUDGET 2014</h2></a></div>
	  <%
    ArrayList contentAL = null;
    contentAL = (ArrayList)CommonFunctions.latestStories("178", 1, "0");
    if (contentAL != null && contentAL.size() > 0) {
        for (int ctr = 0; ctr < contentAL.size(); ctr++) {
            ContentListDTO cDTO = (ContentListDTO) contentAL.get(ctr);
            if (ctr == 0) {%>
              <div class="container cf">
              <span class="georgia lead"> <a href="<%=SITE_BASEPATH+CommonFunctions.storyURL(cDTO.getSefTitle(),1, cDTO.getId())%>" style="font-size:18px;"><%=cDTO.getTitle()%></a></span><br/><br/>
               <a href="<%=SITE_BASEPATH+CommonFunctions.storyURL(cDTO.getSefTitle(),1, cDTO.getId())%>"><img src="<%=STORY_IMAGE_BASEPATH+cDTO.getImage().trim()%>" border="0" style="float:left; margin-right:10px;"></a>
              <span style=" color:#555454; font-size: 15px;    line-height: 17px;"><%=cDTO.getFullDescription()%></span>
               <!--<div class="more"><a href="<%//=SITE_BASEPATH+CommonFunctions.storyURL(cDTO.getSefTitle(),1, cDTO.getId())%>">more &raquo;</a></div>-->
              </div>
  
  <%}}}%>
  
 
 <div class="tab">
   <div class="tab-tile">
   <div class="home-slider-tab">
    <div class="belt-outer">
      <div class="prev-tab" style="display:none"></div>
      <div class="next-tab"></div>
      <ul class="belt-tab">
           	<li><div class="box-tab"><a href="#taxation" class="active-tab">EXPECTATIONS</a></div></li>
          	<li><div class="box-tab"><a href="#price-hike">EXPERT SPEAK</a></div></li>
         	<li><div class="box-tab"><a href="#ceowishlist">CEO WISHLIST</a></div></li>
			<li><div class="box-tab"><a href="#budget">NEWS</a></div></li>         	          	
      </ul>
      
    </div>
  </div>
    
 
   </div>
   <div class="container">
   <div class="arrow"><img src="http://media2.intoday.in/businesstoday/mobile/arrow.jpg"></div>
   <div class="tab-content">

   <div class="tab-budget" id="taxation" style="display:none;">   
       	<jsp:include page="../latest_stories_chunk_budget.jsp" flush="true" >
        <jsp:param name="categoryId" value="178#629" />  
        <jsp:param name="contentCount" value="3" /> 
        <jsp:param name="storyIdToAvoid" value="0" /> 
        </jsp:include>   
   </div>
   <div class="tab-budget" id="price-hike" style="display:none;">   
    	<jsp:include page="../latest_stories_chunk_budget.jsp" flush="true" >
		<jsp:param name="categoryId" value="178#631" /> 
		<jsp:param name="contentCount" value="3" /> 
		<jsp:param name="storyIdToAvoid" value="0" /> 
		</jsp:include>   
   </div>
	<div class="tab-budget" id="ceowishlist" style="display:none;">   
        <jsp:include page="../latest_stories_chunk_budget.jsp" flush="true" >
        <jsp:param name="categoryId" value="178#632" /> 
        <jsp:param name="contentCount" value="3" /> 
        <jsp:param name="storyIdToAvoid" value="0" /> 
        </jsp:include>   
   </div>   
   <div class="tab-budget" id="budget" style="display:none;">
       	<jsp:include page="../latest_stories_chunk_budget.jsp" flush="true" >
		<jsp:param name="categoryId" value="178#630" /> 
		<jsp:param name="contentCount" value="3" /> 
		<jsp:param name="storyIdToAvoid" value="0" /> 
	</jsp:include>
   	  
   	  </div>    
   </div></div>
 </div>
  <div class="heading"><a href="<%=SITE_BASEPATH+"section/180/1/railway-budget-2014-15.html"%>" class="subheadings"><h2 style="text-transform:uppercase">Railway Budget</h2></a></div>
  <jsp:include page="highlights_chunk.jsp" flush="false" />
 <div class="container cf"><table width="100%"  border="0" cellspacing="0" cellpadding="0">


<%
ArrayList contentAL1 = null;
contentAL1 = (ArrayList)CommonFunctions.latestStories("180", 1, "0");
if (contentAL1 != null && contentAL1.size() > 0) {
	for (int ctr = 0; ctr < contentAL1.size(); ctr++) {
		ContentListDTO cDTO = (ContentListDTO) contentAL1.get(ctr);
		%>
			<tr><td bgcolor="#FFFFFF" style="border-bottom:1px solid #DBDBDB;">
				<%if(cDTO.getImage().trim().length() > 0) {%>
					<a href="<%=SITE_BASEPATH+CommonFunctions.storyURL(cDTO.getSefTitle(),1, cDTO.getId())%>"><img src="<%=STORY_IMAGE_BASEPATH+cDTO.getImage().trim()%>" width="80" height="80" align="left" style="margin:0 8px 0 2px; border:0;"/></a>
			<% } else {%>
					<a href="<%=SITE_BASEPATH+CommonFunctions.storyURL(cDTO.getSefTitle(),1, cDTO.getId())%>"><img src="<%=NO_IMG_88x66%>" width="80" height="80" align="left" style="margin:0 8px 0 2px; border:0;"/></a>
			<% }%>
			<div class="story-title"><a href="<%=SITE_BASEPATH+CommonFunctions.storyURL(cDTO.getSefTitle(),1, cDTO.getId())%>"><%=cDTO.getTitle()%></a></div>
			<br/><div style="font-size:13px; font-family:Arial, Helvetica, sans-serif; color:#555454; margin-top:2px;"><%=cDTO.getFullDescription()%></div></td></tr>
<%}}%>
</table></div>
 
 <div class="heading"><a href="<%=SITE_BASEPATH+"gallerylist/union-budget/1/181.html"%>" class="subheadings"><h2>PHOTO</h2></a></div>
 <div class="container">
 <div class="home-slider">
    <div class="belt-outer2">
      <div class="prev"></div>
      <div class="next"></div>
      
      <%
ArrayList photo = (ArrayList)CommonFunctions.latestGalleries(181, 7, "0");
String[][] galleryArray = null;
if (photo != null && photo.size() > 0) {
	galleryArray = new String[photo.size()][5];
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
	//out.print("<tr><td align='center' valign='top' bgcolor='#FFFFFF' style='border-bottom:1px solid #DBDBDB;'><div class='homegallery'><div class='arr-left'><a id='prev' href=\"#\"><img src=\"images/left-arrow-new.gif\" border='0'></a></div><div class='arr-right'><a id='next' href=\"#\"><img src=\"images/right-arrow-new.gif\" border='0'></a></div><div id='imagegallery' >");
	
	out.print("<ul class='belt'>");
}
%>
      
      
        	<li>
          
            <a href="#"><img src="<%=PHOTO_BASEPATH+galleryArray[ctr][3]%>" width="337"></a><br />
			<a style="width:300px;" href="<%=SITE_BASEPATH+CommonFunctions.galleryURL(galleryArray[ctr][2],1, Integer.parseInt(galleryArray[ctr][0]))%>" style="font-size:17px;"><%=galleryArray[ctr][1]%></a>
            
            
            
           
              
            </li>

<%
if (ctr == galleryArray.length-1) {
 //	out.print("</div></div></td></tr><tr><td class='more' bgcolor='#FFFFFF' style='border-bottom:1px solid #C7C7C7; padding-left:2px;'><a href=\""+SITE_BASEPATH+"gallerylist/union-budget/1/166.html\">more &raquo;</a></td></tr>");

out.print("</ul>");

	}
	
%>
 

<%
}}
%>
      
    </div>
  </div>
    
 </div>
 
 
 <div class="heading"><a href="#" class="subheadings"><h2>VIDEO</h2></a></div>
 <!--<div class="container">
   <div class="box"><img src="http://media2.intoday.in/businesstoday/mobile/video.jpg" style="float:left; margin-right:5px;"><span style="color:#616161">Google to launch low-cost phone in india The Android</span></div>
   <div class="box"><img src="http://media2.intoday.in/businesstoday/mobile/video.jpg" style="float:left; margin-right:5px;"><span style="color:#616161">Google to launch low-cost phone in india The Android</span></div>
   <div class="box"><img src="http://media2.intoday.in/businesstoday/mobile/video.jpg" style="float:left; margin-right:5px;"><span style="color:#616161">Google to launch low-cost phone in india The Android</span></div>
 </div> -->


<%@include file="home_video_chunk.jsp"%>
<div style="height:8px;"></div>


<div align="center" style="width:300px;margin:0px auto"> <%@include file="../bottom_add.jsp" %> </div>
<div style="height:8px;"></div>

 <div class="bottom-border"></div>
 <div class="footer">
 <div class="container">
 <img src="http://media2.intoday.in/businesstoday/mobile/itgd-logo.png" style="float:left;">&nbsp; &nbsp; &nbsp;Copyright &copy; 2014 Living Media India Limited.
 </div>
 </div>
</div>
<%@include file="../googleanalytics_bottom.jsp"%>

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
</script>
</body>
</html>   
</cache:cache>

