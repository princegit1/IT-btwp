<%@taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %>
<%@page language="java" import="java.net.*, java.sql.* ,java.util.ArrayList, com.itgd.utils.*, com.itgd.dto.StoryDTO,com.itgd.dto.ContentListDTO"%>
<%@include file="global_include.jsp"%>
<%@include file="googleanalytics_top.jsp"%>
<%@include file="global_include_budget.jsp"%>
<cache:cache key="<%=SITE_BASEPATH+"budget/2016/index.jsp"%>" scope="application" time="600" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Budget 2016-2017 – Budget Latest News & Expectations</title>
<meta name="description" content="Budget 2016-2017 – Get the Exclusive coverage of Railway Budget and Union Budget 2016-2017 including Highlights of Budget, Economic Survey and Live Budget News at www.businesstoday.in" />
<meta name="keywords" content="budget 16-17, financial budget 2017, budget 2017, fiscal year 2016 2017, finance ministry, finance minister arun jaitely, arun jaitely, Suresh Prabhakar Prabhu, rail minister, rail budget 2016-17, India Budget Highlights" />
<meta name="viewport" id="viewport" content="width=device-width; initial-scale=1.0; minimum-scale=1.0; maximum-scale=1.0; user-scalable=no;"/>  
<!--<script type="text/javascript" src="http://m.businesstoday.in/js/jquery.touchwipe.js"></script>-->

<!-- Begin Google Analytics -->
<script>
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
ga('create', 'UA-7530357-15', 'auto');
ga('send', 'pageview');
</script> 

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
<script src="http://code.jquery.com/jquery-1.8.3.min.js" type="text/javascript"></script>
<link href="http://media2.intoday.in/wap/indiatoday/swiper/swiper.min.css" type="text/css" rel="stylesheet"/>
<script src="http://media2.intoday.in/wap/indiatoday/swiper/swiper.min.js"></script>



<noscript> 
  <img src="http://b.scorecardresearch.com/p?c1=2&c2=8549097&cv=2.0&cj=1" />
</noscript> 
<!-- End comScore Tag -->

<style>
body{margin:0; padding:0; font-family:Arial, Helvetica, sans-serif; font-size:12px;}
h1, h2, h3{margin:5px auto;}
a{ text-decoration:none;}
.lead{color:#2e3094; font-size:18px;}
.cf:before, cf:after{content:''; display:table}
.cf:after{clear:both;}
ul{margin:0; padding:0; overflow:hidden;}
ul li{list-style:none; }
.wrapper{ width:100% !important; border-top:5px solid #d81920; margin:auto;}
.bottom-border{ border-bottom:5px solid #2e3094;}
.container{width:95%; margin:0 auto;overflow:hidden; line-height:35px; font-family:Arial, Helvetica, sans-serif;}
.header1{width:100%; height:45px; background:#fff; padding:7px 0;}
.header2{width:100%; height:28px; color:white; line-height:28px; overflow:hidden;
background: #2e3094; /* Old browsers */
background: -moz-linear-gradient(left, #2e3094 0%, #d6000a 100%); /* FF3.6+ */
background: -webkit-gradient(linear, left top, right top, color-stop(0%,#2e3094), color-stop(100%,#d6000a)); /* Chrome,Safari4+ */
background: -webkit-linear-gradient(left, #2e3094 0%,#d6000a 100%); /* Chrome10+,Safari5.1+ */
background: -o-linear-gradient(left, #2e3094 0%,#d6000a 100%); /* Opera 11.10+ */
background: -ms-linear-gradient(left, #2e3094 0%,#d6000a 100%); /* IE10+ */
background: linear-gradient(to right, #2e3094 0%,#d6000a 100%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#2e3094', endColorstr='#d6000a',GradientType=1 ); /* IE6-9 */}
.header3{width:100%; height:59px; padding-top:12px;}
.heading{width:100%; background:#2e3094; color:white; position:relative}
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
.footer{width:100%; padding:3px 0; margin-bottom:0px!important;}
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
.box-tab a.active-tab{color:#fcb501;}
/*slider*/
.home-slider{width:303px; background:#fff;}
.home-slider-tab{width:297px; height:25px;}
.box-tab{w height:25px; text-align:left; color:white; }
.box-tab a{color:white; text-decoration:none; line-height:26px; font-family:arial; font-size:12px; font-weight:bold;}
.belt-outer{width:357px; height:26px; overflow:hidden; position:relative}
.belt{margin:0; padding:0; overflow:hidden; position:absolute;}
.belt li{float:left;}
.belt-tab{margin:0; padding:0; overflow:hidden; position:absolute;left:11px }
.belt-tab li{width:115px; float:left;}
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
.box-tab{ height:25px; color:white; }
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
.searchbox{width:100%; background:#bbbbbb;  display:none; overflow:hidden}
.wrapper .searchbox-inner{/*width:227px; margin-left:51px; overflow:hidden;padding: 5px 0;*/ width:200px !important; margin:0px auto !important; overflow:hidden;}
.more{ text-align:left !important;}
.more > a{color:#2e3094 !important; text-transform:uppercase}
/*video */
.caption-wrapper{width:88px; height:66px; position:relative; float:left; margin-right:12px;}
.caption-video{width:23px; height:23px;  position:absolute; bottom:2px; right:2px; background:url(http://media2.intoday.in/businesstoday/mobile/vid-cap.png) no-repeat}
.subheadings h2{ font-size:15px;}
.subheadings h2:hover{ color:white !important}
.subheading A{color:white !important}
.subheading{background: none repeat scroll 0 0 #2e3094; color:white !important}

/* New css Budget */
.clearfix:before, .clearfix:after {
    content: " ";
    display: block;
    height: 0;
    visibility: hidden;
}
.clearfix:after {
    clear: both;
}
.clearfix {
}
body{ background:#EFEFEF;}
#budget-conetent .subheadings h2{ line-height:24px; font-weight:bold;}
#budget-conetent .content h3 a{ font-size:20px; color:#333; text-decoration:none;}
#budget-conetent .whitebox{ background:#fff; padding:0; margin-bottom:10px;}
#budget-conetent .whitebox .content{ padding:0 10px 10px; }
#budget-conetent .whitebox .content .storyimg{ padding:5px 0;}
#budget-conetent .whitebox .content .storyimg img{ width:100%;}

#budget-conetent .whitebox .content ul li{ color:#004DA0; padding:2px 0 5px; background:url(http://media2.intoday.in/businesstoday/mobile/dot.jpg) no-repeat 3px 9px; padding-left:20px!important;} 
#budget-conetent .whitebox .content ul li a{ font-size:14px; font-weight:normal; text-decoration:none; font-family:Arial, Helvetica, sans-serif; line-height:19px; color:#0B3774; text-align:left !important;}
#budget-conetent .listcontent{ padding-bottom:2px;}
#budget-conetent .listcontent .row{ border-bottom:1px solid #DADADA; padding:3px 0;} #budget-conetent .listcontent .row:last-child{ border-bottom:none;}
#budget-conetent .listcontent .row .list-img{ width:80px; margin-right:10px; float:left; height:80px;}
#budget-conetent .listcontent .row .list-content{ width:68%; float:left; display: table-cell;  vertical-align: middle; padding-top:10px;}
#budget-conetent .listcontent .row .list-content a{ font-size:14px; line-height:19px; color:#0B3774; text-decoration:none; }
#budget-conetent .whitebox .listcontent ul li{ border-bottom:1px solid #DADADA; padding:10px 0; background:url(http://media2.intoday.in/businesstoday/mobile/dot.jpg) no-repeat scroll 3px 17px;} #budget-conetent .whitebox .listcontent ul li:last-child{ border-bottom:0px; padding-bottom:0px;}
#budget-conetent .whitebox #gallery-belt, #budget-conetent .whitebox #videos-belt{ width:100%; overflow:hidden;}
#budget-conetent .whitebox #gallery-belt ul, #budget-conetent .whitebox #videos-belt ul{ position:relative;}
#budget-conetent .whitebox #gallery-belt ul li, #budget-conetent .whitebox #videos-belt ul li{ background:#f8f; padding:10px!important; border:1px solid #ECECEC; background:none; width:123px; float:left; margin-right:10px; position:relative;}
#budget-conetent .whitebox #gallery-belt ul li p,#budget-conetent .whitebox #videos-belt ul li p{ color:#414141; font-size:13px; font-weight:bold; font-family:Arial, Helvetica, sans-serif; margin-bottom:0px; line-height:15px; margin-top:0px;}
#budget-conetent .whitebox #gallery-belt ul li:last-child, #budget-conetent .whitebox #videos-belt ul li:last-child{ margin-right:0px;}
#budget-conetent .whitebox #gallery-belt .slider-navdot , #budget-conetent .whitebox #videos-belt .slider-navdot2{ width:90px; margin:0 auto; padding:15px 0;}
#budget-conetent .whitebox #gallery-belt .slider-navdot a, #budget-conetent .whitebox #videos-belt .slider-navdot2 a{ text-indent:-99999px; background:#D2CECD; height:12px; width:12px; display:block; float:left; margin-right:10px; border-radius:100%;} #budget-conetent .whitebox #gallery-belt .slider-navdot a.activenav, #budget-conetent .whitebox #videos-belt .slider-navdot2 a.activenav{ background:#1482A5}
#budget-conetent .whitebox #gallery-belt ul li span.newphotoicon{ background:url(http://m.businesstoday.in/images/photoicon.png) no-repeat 0 0; width:25px; height:22px; display:block; position:absolute; top:75px; left:12px; text-indent:-9999px;}
#budget-conetent .whitebox #videos-belt ul li span.newvideoicon{ background:url(http://media2.intoday.in/businesstoday/mobile/video.png) no-repeat 0 0; width:24px; height:22px; display:block; position:absolute; top:75px; left:12px; text-indent:-9999px;}
.higlightcta a{ background:#2F3498; color:#fff; font-size:14px; font-family:Arial, Helvetica, sans-serif; padding:3px 15px; border-radius:15px; font-weight:bold;}
.higlightcta{ margin:10px 0 0;}
/* Rail Budget css */
.budget-heading{ background:#fff; padding:3px 10px; color:#F61302; font-size:21px; font-family:Arial, Helvetica, sans-serif;}
.budget-heading.red{ color:#F61302;} .budget-heading.green{ color:#447e00;}
.budget-header { background:#2e3094; font-size:28px; line-height:24px; padding:10px; color:#fff; font-family:Arial, Helvetica, sans-serif; margin-bottom:15px; position:relative; margin-top:5px;}
#mnav{background: url(http://media2.intoday.in/businesstoday/mobile/budgetmnav.jpg) no-repeat 0 0; cursor: pointer;height: 13px; position: absolute;right: 12px;text-indent: -9999px;top: 16px; width: 23px;}
.heiglight-section{ margin:10px 0; width:290px; margin:0 auto;}
.budgetnav{ position:absolute; top:44px; background:#fff; right:0px; padding:0 10px 10px; width:200px; -webkit-box-shadow: -16px 3px 23px 0px rgba(50, 50, 50, 0.61);-moz-box-shadow:-16px 3px 23px 0px rgba(50, 50, 50, 0.61);box-shadow: -16px 3px 23px 0px rgba(50, 50, 50, 0.61);z-index: 999;}
.budgetnav ul li{ border-bottom:1px solid #EDEDED; padding:0; margin:0;}
.budgetnav ul li a{ font-size:15px; color:#707070; line-height:15px; display:block; padding:10px 0;}
span.moretxt{  font-size: 12px; font-weight: bolder; position: absolute; right: 10px; top: 5px; width: auto;}
.searchtop {background-color:none;border:none; cursor: pointer; height: 25px; margin: 2px 3px; width: 28px;}
.searchbox {background:#bbbbbb;display: none;width: 100%;} .searchbox-inner {/*margin-left: 51px;overflow: hidden;padding: 5px 0;width: 227px;*/}
.heiglight-section h3{ text-transform:uppercase; margin:10px 0 0 0; width:90px; padding:5px; color:#FFFFFF; background:#D71920}
 .heiglight-section h4 {
    clear: both;
    color: #000000;
    font-size: 14px;
    margin-top: 10px;
    text-align: right;
    text-transform: uppercase;
}
 .heiglight-section h4 a{ color:#000000;}
 
/*** SWIPER*********/
/*.swiper-container {
    margin: 0 auto;
    overflow: hidden;
    position: relative;
    z-index: 1;
}

.swiper-container-android .swiper-slide, .swiper-wrapper {
    transform: translate3d(0px, 0px, 0px);
}*/
.swiper-wrapper {
  /* box-sizing: content-box;box-sizing: -webkit-content-box;display: flex;display: -webkit-flex;  */
   /* height: 100%;
    position: relative;
    transition-property: transform;
    width: 100%;
    z-index: 1;*/
}
/*.swiper-slide {
    flex-shrink: 0;
   height: 100%;
   position: relative;
    width: 100%;
}*/
#vdo_bdg .swiper-container { width: 100%; height: 208px;  margin: 5px auto; }

#vdo_bdg .mb_sld{ background: rgba(0, 0, 0, 0) none repeat scroll 0 0;border: 1px solid #ececec;padding: 10px;width: 123px; position:relative}
#vdo_bdg .mb_sld a{ color: #0b3774; font-family: Arial,Helvetica,sans-serif; font-size: 14px; font-weight: normal; line-height: 19px; text-align: left !important;text-decoration: none;}
#vdo_bdg .mb_sld p{display:block;height: 65px;}
#vdo_bdg  .swiper-slide{ width:auto;margin-right:20px; display: -webkit-box;   display: -ms-flexbox;  display: -webkit-flex; display: flex;    -webkit-box-pack: center;  -ms-flex-pack: center; -webkit-justify-content: center; justify-content: center; -webkit-box-align: center;        -ms-flex-align: center; -webkit-align-items: center;  align-items: center; }
#vdo_bdg span.newvideoicon {  background: rgba(0, 0, 0, 0) url("http://media2.intoday.in/indiatoday/images/vid-icon.png") no-repeat scroll 0 0;display: block; height: 22px; left: 12px; position: absolute; text-indent: -9999px; top: 75px; width: 24px; }


#photo_vd .swiper-wrapper{ height:208px;  display: flex;display: -webkit-flex;}
#photo_vd .mb_sld{ background: rgba(0, 0, 0, 0) none repeat scroll 0 0;border: 1px solid #ececec;float: left;padding: 10px;width: 123px; position:relative}
#photo_vd .mb_sld a{ color: #0b3774; font-family: Arial,Helvetica,sans-serif; font-size: 14px; font-weight: normal; line-height: 19px; text-align: left !important;text-decoration: none;}
#photo_vd .mb_sld p{display:block;height: 46px;}
#photo_vd  .swiper-slide{ width: auto; display:inline;margin-right:20px;   }
.clearfix{ clear:both;}
#photo_vd span.newphotoicon {  background: rgba(0, 0, 0, 0) url("http://media2.intoday.in/wap/indiatoday/swiper/photoicon.png") no-repeat scroll 0 0;display: block; height: 30px; left: 12px; position: absolute; text-indent: -9999px; top: 67px; width: 30px; }
.wrapper .searchbox-inner{ width:235px !important;}

@media screen and (max-width: 360px){
	.wrapper{width:100%;}
}
</style>
<link rel="canonical" href="http://businesstoday.intoday.in/budget/2016/" />
<script type="text/javascript">
function canonicalUrlRedirection() {
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
}
var mobile = (/iphone|vnd.wap.xhtml+xml|sony|symbian|S60|SymbOS|nokia|samsung|mobile|windows ce|epoc|opera mini|nitro|j2me|midp-|cldc-|netfront|mot|up.browser|up.link|audiovox|blackberry|ericsson|panasonic|philips|sanyo|sharp|sie-|portalmmm|blazer|avantgo|danger|palm|series60|palmsource|pocketpc|smartphone|rover|ipaq|au-mic|alcatel|ericy|vodafone|wap1|wap2|teleca|playstation|lge|lg-|android|htc|dream|webos|bolt|nintendo|palm/i.test(navigator.userAgent.toLowerCase()));
              if (!mobile) {             
                 canonicalUrlRedirection(); 
              }

</script> 
<script>
$(document).ready(function(e) {
		var len = $('#gallery-belt > ul > li').length;
		var wd = $('#gallery-belt > ul > li').outerWidth();
		var counter = 1;
		var movewd =wd+10;
		var tolwed = (wd+10)*len;
		$('#gallery-belt > ul').css('width', tolwed);
		$('#_1').addClass('activenav');
	$('.slider-navdot a').click(function(){
		var current = $(this).index();
		$('.slider-navdot a').removeClass('activenav');
		$(this).addClass('activenav');
		switch(current){
			case 0 :{
				$("#gallery-belt ul").animate({left:0});
				counter = 1;
				}
				 break;
				
			case 1 :{
				$("#gallery-belt ul").animate({left: -movewd*2});
				counter = 2;
				}
				 break;
			case 2 :{
				$("#gallery-belt ul").animate({left: -movewd*4});
				counter = 3;
				} 
		}
		
	});
	
	
	//var autoslides = setInterval(autoslide, 3000);
	
	function autoslide(){
	  // alert(counter);
		if (counter == len/2)
			{	
			 
				counter = 1;
				$("#gallery-belt ul").animate({
						left: '0px'
					});
					$('.slider-navdot a').removeClass('activenav');
					$('#_' + counter).addClass('activenav');
			
			}else
			{
				$("#gallery-belt ul").animate({
						left: '-='+movewd*2
					}, 1000)
				counter += 1;
				$('.slider-navdot a').removeClass('activenav');
				$('#_' + counter).addClass('activenav');
			}
	} 
});
</script>
<script>
$(document).ready(function(e) {
		var vlen = $('#videos-belt > ul > li').length;
		var vwd = $('#videos-belt > ul > li').outerWidth();
		var counters = 1;
		//alert(wd);
		var movewd =vwd+10;
		var tolwed = (vwd+10)*vlen;
		$('#videos-belt > ul').css('width', tolwed);
		$('.slider-navdot2 a#_1').addClass('activenav');
	$('.slider-navdot2 a').click(function(){
		var current = $(this).index();
		$('.slider-navdot2 a').removeClass('activenav');
		$(this).addClass('activenav');
		switch(current){
			case 0 :{
				$("#videos-belt ul").animate({left:0});
				counters = 1;
				}
				 break;
				
			case 1 :{
				$("#videos-belt ul").animate({left: -movewd*2});
				counters = 2;
				}
				 break;
			case 2 :{
				$("#videos-belt ul").animate({left: -movewd*4});
				counters = 3;
				}	 
		}
		
	});
	
	
	//var autoslides = setInterval(autoslide, 5000);
	
	function autoslide(){
	
		if (counters == vlen/2)
			{	
			
				counters = 1;
				$("#videos-belt ul").animate({
						left: '0px'
					});
					$('.slider-navdot2 a').removeClass('activenav');
					$('.slider-navdot2 a#_' + counters).addClass('activenav');
			
			}else
			{
				$("#videos-belt ul").animate({
						left: '-='+movewd*2
					}, 1000)
				counters += 1;
				$('.slider-navdot2 a').removeClass('activenav');
				$('.slider-navdot2 a#_' + counters).addClass('activenav');
			}
	} 
});


</script>

<script>
$(document).ready(function(){
 var swiper = new Swiper('#vdo_bdg .swiper-container', {
        pagination: '.pgn_vd',
        slidesPerView: 'auto',
        paginationClickable: true,
		 freeMode: true,
		spaceBetween: 20
       
    });
	 var swiper = new Swiper('#photo_vd .swiper-container', {
        pagination: '.pgn_pho',
        slidesPerView: 'auto',
		
        paginationClickable: true,
		 freeMode: true,
		spaceBetween: 20
       
    });


$('.searchtext').click(function(){
		$('.searchbox').slideToggle();
	});


	
	})

</script>
</head>
 
<body>
<%
ArrayList contentAL22 = null;
%>

<div class="wrapper">
<%@include file="../../budget_topnav.jsp"%>

<div id="budget-conetent">


  <!-- EXPECTATIONS box -->
  <div class="">
        <%
		try
		{ 
    ArrayList topStoryList = null;
    topStoryList = (ArrayList)getLatestStories("192#770", 4, "0");
	 if (topStoryList != null && topStoryList.size() ==0)
	 {
	%>
     <div class="whitebox">
      
          
             <ul>
    <%
	}
    if (topStoryList != null && topStoryList.size() > 0) {
        for (int ctr = 0; ctr < topStoryList.size(); ctr++) {
            ContentListDTO cDTO = (ContentListDTO) topStoryList.get(ctr);
            if (ctr == 0) {%>
            <div class="whitebox">
        <div class="heading"><a class="subheadings" href="<%=SITE_BASEPATH+CommonFunctions.categoryURL(cDTO.getCurrentCategorySefTitle(),1,cDTO.getCurrentCategoryId())%>"><h2>DECODING THE BUDGET</h2><span class="moretxt">MORE</span></a></div>
        <div class="content">
            
          <h3><a href="<%=SITE_BASEPATH+CommonFunctions.storyURL(cDTO.getSefTitle(),1, cDTO.getId())%>"><%=cDTO.getTitle()%></a></h3>
             <div class="storyimg"><a href="<%=SITE_BASEPATH+CommonFunctions.storyURL(cDTO.getSefTitle(),1, cDTO.getId())%>"><img src="<%=STORY_IMAGE_BASEPATH+cDTO.getImage().trim()%>" /></a></div>
                 
               
                   
             <ul>
            
            <% 
			}
			else
			{
			%>
         
      <li><a href="<%=SITE_BASEPATH+CommonFunctions.storyURL(cDTO.getSefTitle(),1, cDTO.getId())%>"><%=cDTO.getTitle()%></a></li>
  <%}}}
  }
  catch(Exception exception)
  {
   System.out.println("btWap.budget2015-->>"+exception.getMessage());
  }
  
  %>                      
             </ul>
        </div>
      </div>
      
      
  <!-- Budget EXPECTATION Category -->  
  
      <%-- <div class="whitebox">
          <jsp:include page="budget-expectations.jsp" flush="true">
        <jsp:param name="categoryId" value="192#759" /> 
        <jsp:param name="contentCount" value="3" /> 
        <jsp:param name="storyIdToAvoid" value="0" /> 
        </jsp:include>
      </div>--%>
      
      <%--Effect on pocket--%>
      <div class="whitebox">
          <jsp:include page="budget-expectations.jsp" flush="true">
        <jsp:param name="categoryId" value="192#773" /> 
        <jsp:param name="contentCount" value="3" /> 
        <jsp:param name="storyIdToAvoid" value="0" /> 
        </jsp:include>	
      </div>
    
    	<%--Key Announcements--%>
        <div class="whitebox">
         <jsp:include page="budget-expert-columns.jsp" flush="true">
        <jsp:param name="categoryId" value="192#774" /> 
        <jsp:param name="contentCount" value="3" /> 
        <jsp:param name="storyIdToAvoid" value="0" /> 
        </jsp:include>
      </div>
      
      <div class="whitebox">
         <jsp:include page="budget-quotehanger.jsp" flush="true">
        <jsp:param name="categoryId" value="192#758" />    
        <jsp:param name="contentCount" value="3" /> 
        <jsp:param name="storyIdToAvoid" value="0" />    
        </jsp:include>
      </div>
     
      <!-- GALLERY Section -->
         <div class="whitebox">
        <jsp:include page="video_chunk.jsp" flush="true">
        <jsp:param name="categoryId" value="72" /> 
        <jsp:param name="contentCount" value="6" /> 
        <jsp:param name="storyIdToAvoid" value="0" /> 
         </jsp:include>
         </div> 
         
		<div class="whitebox">
        <jsp:include page="gallery_chunk.jsp" flush="true">
        <jsp:param name="categoryId" value="200" /> 
        <jsp:param name="contentCount" value="6" /> 
        <jsp:param name="storyIdToAvoid" value="0" /> 
        </jsp:include>
      </div>
      <div class="footer whitebox" >
 
 <div class="container">

 <img src="http://media2.intoday.in/businesstoday/images/logo/footlogo.gif" style="float:left;">&nbsp; &nbsp; &nbsp;Copyright &copy; 2016 Living Media India Limited.
 </div>
 </div>
 </div>
  </div>
  </div>
  

<script>

</script>

</body>
</html>
</cache:cache>