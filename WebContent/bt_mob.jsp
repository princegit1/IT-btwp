<%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %>
<%@page language="java" import="java.net.*, java.util.ArrayList, com.itgd.utils.*, com.itgd.dto.ContentListDTO"%>
<%@include file="global_include.jsp"%>
<cache:cache key="<%=SITE_URL+"bt_mobi.jsp"%>" scope="application" time="600" >
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<%@include file="googleanalytics_top.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="refresh" content="300" />
<title>Business Today: Business News, Latest Stock Market and Economy News India from Businesstoday.in</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="description" content="latest Business News, Indian economy News, Sensex updates, BSE, NSE, stock exchange news, Mutual Funds, investing in India, new market. Daily stock markets news, insurance, income tax filing information." />
<meta name="keywords" content="Latest Business News - Businesstoday.in one of the best business magazine in India which offers you latest updates about stocks, NSE, BSE, Top Companies, Markets, Sectors, Banking, interviews and money management tips." /><meta name="google-site-verification" content="P2lmnYzIX2lQifvTcbZbYNn5_RBHN3Y2_-h-_POOf68" />
<meta name="msvalidate.01" content="28AD13B9E2353694C455F57D02382A94" />
<link rel="canonical" href="http://m.businesstoday.in" />
<link rel="stylesheet" href="css/mobile.css" type="text/css">
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script> 
<script type="text/javascript" src="js/jquery.cycle.all.min.js"></script>
<script type="text/javascript" src="js/jquery.touchwipe.js"></script>
<style>
.copyright {text-align:center; padding:2px; font:bold 12px/18px Arial, Helvetica, sans-serif;}
.chunksp {height:8px;}
.mainhead {font:bold 20px/22px Arial, Helvetica, sans-serif; color:#cc0000; margin-left:5px;}
.maindownload {font:normal 12px/17px Arial, Helvetica, sans-serif; color:#000000; margin-bottom:10px; margin-left:5px;}
.appbor {padding:10px 5px; border-top:1px solid #CCC; }
.apphead {font:bold 16px/20px Arial, Helvetica, sans-serif; color:#cc0000;}
.appdowload {font:bold 12px/17px Arial, Helvetica, sans-serif; color:#006e99;}
.appdowload a {color:#006e99; text-decoration:none;}
.appdowload a:hover {text-decoration:underline;}
.copy {font:normal 12px Arial, Helvetica, sans-serif; color:#666;}
</style>
</head><body> 
 
<%@include file="topnav.jsp"%>
<div class="chunksp"></div>
<div class="mainhead">Business Today Apps</div>
<div class="maindownload">Download the free app today!</div>

<div class="appbor">
<div class="apphead"><img src="images/iphone.gif" style="margin-right:8px;" align="left" />iPhone App
<div class="appdowload"><a href="http://itunes.apple.com/in/app/business-today-live/id510626540?mt=8">Download Now</a></div>
</div>
</div>

<div class="appbor">
<div class="apphead"><img src="images/iphone.gif" style="margin-right:8px;" align="left" />iPad App
<div class="appdowload"><a href="https://itunes.apple.com/in/app/business-today-live-for-ipad/id560400101?mt=8">Download Now</a></div>
</div>
</div>

<div class="appbor">
<div class="apphead"><img src="images/windows.gif" style="margin-right:8px;" align="left" />Windows App
<div class="appdowload"><a href="http://www.windowsphone.com/en-US/apps/89dbf8fc-9b05-4232-acfc-1fb34b8a509f">Download Now</a></div>
</div>
</div>

<div class="appbor">
<div class="apphead"><img src="images/android.gif" style="margin-right:8px;" align="left" />Android App
<div class="appdowload"><a href="https://play.google.com/store/apps/details?id=com.businesstoday">Download Now</a></div>
</div>
</div>

<div class="appbor">
<div class="apphead"><img src="images/nodia.gif" style="margin-right:8px;" align="left" />Nokia App
<div class="appdowload"><a href="http://store.ovi.com/content/129458">Download Now</a></div>
</div>
</div>

<div class="appbor">
<div class="apphead"><img src="images/Blackberry.gif" style="margin-right:8px;" align="left" />Blackberry App
<div class="appdowload"><a href="http://appworld.blackberry.com/webstore/content/79054/?lang=en">Download Now</a></div>
</div>
</div>

<div class="appbor">
<div class="apphead"><img src="images/Samsung.gif" style="margin-right:8px;" align="left" />Samsung App
<div class="appdowload"><a href="http://www.samsungapps.com/topApps/topAppsDetail.as?productId=G00005185289">Download Now</a></div>
</div>
</div>


<div class="chunksp"></div>



          <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr height="1">
            <td height="1" bgcolor="#2E3094"></td>
          </tr>
          <tr>
            <td class="copyright"><img src="http://media2.intoday.in/businesstoday/images/logo/footlogo.gif" border="0" align="left" hspace="5" alt="India Today Group" title="India Today Group">Copyright © 2013 Living Media India Limited.</td>
          </tr>
    </table>
	<%@include file="googleanalytics_bottom.jsp"%>
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
	
