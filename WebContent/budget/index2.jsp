<%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %>
<%@page language="java" import="java.net.*, java.util.ArrayList, com.itgd.utils.*, com.itgd.dto.StoryDTO,com.itgd.dto.ContentListDTO"%>
<%@include file="../global_include.jsp"%>
<cache:cache key="<%=SITE_URL+"budget/index2.jsp"%>" scope="application" time="300" refresh="t">
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="refresh" content="300" />
<title>Budget 2014-Union Budget, Railway Budget, Annual Budget, India Budget News and Highlights</title>
<meta name="description" content="Budget 2014: Complete coverage of Budget/Union Budget 2014, Railway Budget 2013, Budget analysis, expectations and reactions on Indian Budget. Highlights, Flashes, Impact and Speech by P Chidambaram." />
<meta name="keywords" content="budget 2014, rail budget 2014, budget 2013 india, budget 2014 highlights, union budget 2013, budget 2013 income tax, indian railway budget 2013" />	
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="msvalidate.01" content="28AD13B9E2353694C455F57D02382A94" />
<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
<link rel="canonical" href="http://m.businesstoday.in/budget/" />
<link rel="stylesheet" href="http://m.businesstoday.in/css/mobile.css" type="text/css">
<link rel="stylesheet" href="http://m.businesstoday.in/budget/budget.css" type="text/css">
<script type="text/javascript" src="http://m.businesstoday.in/js/jquery-1.4.2.min.js"></script> 
<script type="text/javascript" src="http://m.businesstoday.in/js/jquery.cycle.all.min.js"></script>
<script type="text/javascript" src="http://m.businesstoday.in/js/jquery.touchwipe.js"></script>
<meta name="viewport" id="viewport" content="width=device-width; initial-scale=1.0; minimum-scale=1.0; maximum-scale=1.0; user-scalable=no;"></meta>


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
.container{width:95%; margin:auto; margin-bottom:5px;              overflow:hidden;}
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
.box-tab a.active{color:#fcb501;}


/*slider*/

.home-slider{width:297px; height:158px; background:#CCC; border:2px solid black;}
.home-slider-tab{width:297px; height:25px;}
.box-tab{width:96px; height:25px; text-align:center; color:white; }
.box-tab a{color:white; text-decoration:none; line-height:26px;}
.belt-outer{width:317px; height:158px; overflow:hidden; position:relative}
.belt{margin:0; padding:0; overflow:hidden; position:absolute;}
.belt li{float:left;}
.belt-tab{margin:0; padding:0; overflow:hidden; position:absolute;}
.belt-tab li{float:left;}
.prev{width:27px; height:56px; background:url(http://media2.intoday.in/businesstoday/mobile/slider-left.png); position:absolute; top:51px; left:0; cursor:pointer; z-index:999;}
.next{width:27px; height:56px; background:url(http://media2.intoday.in/businesstoday/mobile/slider-right.png); position:absolute; top:51px; right:15px; cursor:pointer; z-index:999;}
.prev-tab{width:9px; height:14px; background:url(http://media2.intoday.in/businesstoday/mobile/left.jpg); position:absolute; top:5px; left:0; cursor:pointer; z-index:999;}
.next-tab{width:9px; height:14px; background:url(http://media2.intoday.in/businesstoday/mobile/right.jpg); position:absolute; top:5px; right:0; cursor:pointer; z-index:999;}
.box1{width:297px; height:158px; text-align:center; color:white; font-size:100px; background:#f1eff0;}
.home-slider img{border:2px solid black; height:159px}
.subheadings{color: #ffffff;}
.subheadings a:hover{color: #ffffff!important;}
.caption{ position:absolute; bottom:-15px;}
ul li{ padding-left:0 !Important}
.photoicon{bottom:34px !important}
</style>
<script>
$(document).ready(function(e) {
	
	/*budget tab*/
	$('.tab-budget').hide();
	$('.tab-budget:first').show();
	$(".box-tab a").click(function(){
		$(".box-tab a").removeClass('active')
		$(this).addClass('active');
		
		var getAttr = $(this).attr('href');
		$('.tab-budget').hide();
		$(getAttr).show();
		return false;
		
	});
	
	var len = $(".belt li").length;
	var tWidth = $(".belt li").width();
	var fWidth = tWidth * len;
	$(".belt").css('width', fWidth)
	 var counter = 1;
	 if(counter == 1){
		 $('.nav-area li a').removeClass('active')
		 $('.nav-area li:nth-child(1) a').addClass('active');
	 }
	 if(counter == 2){
		 $('.nav-area li a').removeClass('active')
		 $('.nav-area li:nth-child(1) a').addClass('active');
	 }
	 if(counter == 3){
		 $('.nav-area li a').removeClass('active')
		 $('.nav-area li:nth-child(1) a').addClass('active');
	 }
	 
	 //NEXT
	 $('.next').click(function(){
		
		 if(counter < len){
		   $('.belt').animate({'left' :'-=297'})
		   $('.prev').fadeIn();
		   counter +=1;
		 }
		 else{
			 $('.next').fadeOut();
			 
		 }
	 });
	 
	 //PREV
	 $('.prev').click(function(){
		 if(counter == 1){
		     $('.prev').fadeOut();
			 
		 }else{
			 $('.belt').animate({'left' :'+=297'});
			 $('.next').fadeIn();
		     counter -=1;
		 }
	 });
	 

    
});
$(document).ready(function(e) {
	
	var len = $(".belt-tab li").length;
	var tWidth = $(".belt-tab li").width();
	var fWidth = tWidth * len;
	$(".belt-tab").css('width', fWidth)
	 var counter = 1;
	 
	 //NEXT
	 $('.next-tab').click(function(){
		
		 if(counter < len-1){
		   $('.belt-tab').animate({'left' :'-=297'})
		   $('.prev-tab').fadeIn();
		   counter +=1;
		 }
		 else{
			 $('.next-tab').fadeOut();
			 
		 }
	 });
	 
	 //PREV
	 $('.prev-tab').click(function(){
		 if(counter == 1){
		     $('.prev-tab').fadeOut();
			 
		 }else{
			 $('.belt-tab').animate({'left' :'+=297'});
			 $('.next-tab').fadeIn();
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
	<input class="sear" type="text" maxlength="40" onfocus="if(this.value=='search...') this.value='';" onblur="if(this.value=='') this.value='search...';" value="search..." class="textboxs" alt="search" name="searchword">        
	<input type="submit" value="" class="searchtop" name="submit">
	</form>
  </div>
   
  </div>
  
 <div class="header3" style="text-align:center">
<!-- <h2 style="text-align:center; color:#777777;">UNION BUDGET 2014-15</h2>
 <h3 style="text-align:center;">FULL COVERAGE</h3>-->
 <a href="#"><img src="http://media2.intoday.in/businesstoday/mobile/banner.gif"></a>
 </div>
 
  <div class="heading"><h2>TOP NEWS</h2></div>
	  <%
    ArrayList contentAL = null;
    contentAL = (ArrayList)CommonFunctions.latestStories("164", 1, "0");
    if (contentAL != null && contentAL.size() > 0) {
        for (int ctr = 0; ctr < contentAL.size(); ctr++) {
            ContentListDTO cDTO = (ContentListDTO) contentAL.get(ctr);
            if (ctr == 0) {%>
              <div class="container cf">
              <span class="georgia lead"><%=cDTO.getTitle()%></span><br/><br/>
               <a href="<%=SITE_BASEPATH+CommonFunctions.storyURL(cDTO.getSefTitle(),1, cDTO.getId())%>"><img src="<%=STORY_IMAGE_BASEPATH+cDTO.getImage().trim()%>" border="0" style="float:left; margin-right:10px;"></a>
              <span style=" font-size:13px; color:#555454"><%=cDTO.getFullDescription()%></span>
               <div class="more"><a href="<%=SITE_BASEPATH+CommonFunctions.storyURL(cDTO.getSefTitle(),1, cDTO.getId())%>">more &raquo;</a></div>
              </div>
  
  <%}}}%>
  
 
 <div class="tab">
   <div class="tab-tile">
   <div class="home-slider-tab">
    <div class="belt-outer">
      <div class="prev-tab"></div>
      <div class="next-tab"></div>
      <ul class="belt-tab">
        	<li><div class="box-tab"><a href="#budget" class="active">TECHNOLOGY</a></div></li>
         	<li><div class="box-tab"><a href="#taxation">TAXATION</a></div></li>
          	<li><div class="box-tab"><a href="#price-hike">BIG STORY</a></div></li>
           	<li><div class="box-tab"><a href="#money">MONEY</a></div></li>
         	<li><div class="box-tab"><a href="#">taxation</a></div></li>
          	<li><div class="box-tab"><a href="#">price hike</a></div></li>
           	<li><div class="box-tab"><a href="#">budget</a></div></li>
         	<li><div class="box-tab"><a href="#">taxation</a></div></li>
          	<li><div class="box-tab"><a href="#">price hike</a></div></li>
           	<li><div class="box-tab"><a href="#">budget</a></div></li>
         	<li><div class="box-tab"><a href="#">taxation</a></div></li>
          	<li><div class="box-tab"><a href="#">price hike</a></div></li>
      </ul>
      
    </div>
  </div>
    
 
   </div>
   <div class="container">
   <div class="arrow"><img src="http://media2.intoday.in/businesstoday/mobile/arrow.jpg"></div>
   <div class="tab-content">
   
      <div class="tab-budget" id="budget" style="display:none;">
      
      <jsp:include page="../latest_stories_chunk_budget.jsp" flush="true" >
		<jsp:param name="categoryId" value="110" /> 
		<jsp:param name="contentCount" value="3" /> 
		<jsp:param name="storyIdToAvoid" value="0" /> 
	</jsp:include>
   	  
   	  </div>
   
   <div class="tab-budget" id="taxation" style="display:none;">
   
   <jsp:include page="../latest_stories_chunk_budget.jsp" flush="true" >
	<jsp:param name="categoryId" value="109" />  
	<jsp:param name="contentCount" value="3" /> 
	<jsp:param name="storyIdToAvoid" value="0" /> 
	</jsp:include>
   
   </div>
   
   <div class="tab-budget" id="price-hike" style="display:none;">
   
    <jsp:include page="../latest_stories_chunk_budget.jsp" flush="true" >
		<jsp:param name="categoryId" value="105" /> 
		<jsp:param name="contentCount" value="3" /> 
		<jsp:param name="storyIdToAvoid" value="0" /> 
	</jsp:include>
   
   </div>
   
    <div class="tab-budget" id="money" style="display:none;">
   
    <jsp:include page="../latest_stories_chunk_budget.jsp" flush="true" >
		<jsp:param name="categoryId" value="105" /> 
		<jsp:param name="contentCount" value="3" /> 
		<jsp:param name="storyIdToAvoid" value="0" /> 
	</jsp:include>
   
   </div>

   </div></div>
 </div>
 
 
 <div class="heading"><a href="<%=SITE_BASEPATH+"gallerylist/union-budget/1/166.html"%>" class="subheadings"><h2>PHOTO</h2></a></div>
 <div class="container">
 <div class="home-slider">
    <div class="belt-outer">
      <div class="prev"></div>
      <div class="next"></div>
      
      <%
ArrayList photo = (ArrayList)CommonFunctions.latestGalleries(166, 5, "0");
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
	//out.print("<tr><td align='center' valign='top' bgcolor='#FFFFFF' style='border-bottom:1px solid #DBDBDB;'><div class='homegallery'><div class='arr-left'><a id='prev' href=\"#\"><img src=\"images/left-arrow-new.gif\" border='0'></a></div><div class='arr-right'><a id='next' href=\"#\"><img src=\"images/right-arrow-new.gif\" border='0'></a></div><div id='imagegallery' >");
	
	out.print("<ul class='belt'>");
}
%>
      
      
        	<li><div class="box1"><a href="<%=SITE_BASEPATH+CommonFunctions.galleryURL(galleryArray[ctr][2],1, Integer.parseInt(galleryArray[ctr][0]))%>"><img src="<%=PHOTO_BASEPATH+galleryArray[ctr][3]%>" width="297"><span class="photoicon"></span></a>
            <div class="caption">
            <a href="<%=SITE_BASEPATH+CommonFunctions.galleryURL(galleryArray[ctr][2],1, Integer.parseInt(galleryArray[ctr][0]))%>"><span class="georgia lead"><%=galleryArray[ctr][1]%></span></a>
            </div>
            </div>
              
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
 
 
 <!--<div class="heading"><h2>VIDEO</h2></div> -->
 <!--<div class="container">
   <div class="box"><img src="http://media2.intoday.in/businesstoday/mobile/video.jpg" style="float:left; margin-right:5px;"><span style="color:#616161">Google to launch low-cost phone in india The Android</span></div>
   <div class="box"><img src="http://media2.intoday.in/businesstoday/mobile/video.jpg" style="float:left; margin-right:5px;"><span style="color:#616161">Google to launch low-cost phone in india The Android</span></div>
   <div class="box"><img src="http://media2.intoday.in/businesstoday/mobile/video.jpg" style="float:left; margin-right:5px;"><span style="color:#616161">Google to launch low-cost phone in india The Android</span></div>
 </div> -->


<%//@include file="home_video_chunk.jsp"%>
<div style="height:8px;"></div>


 <div class="bottom-border"></div>
 <div class="footer">
 <div class="container">
 <img src="http://media2.intoday.in/businesstoday/mobile/itgd-logo.png" style="float:left;">&nbsp; &nbsp; &nbsp;Copyright &copy; 2013 Living Media India Limited.
 </div>
 </div>
</div>



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