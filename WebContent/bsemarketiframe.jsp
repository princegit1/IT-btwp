<%@page language="java" import="java.text.*,java.sql.*,java.util.Date,java.util.*,com.itgd.dto.StoryDTO,com.itgd.dto.RelatedContentDTO,com.itgd.utils.DbConnection,com.itgd.utils.Constants,com.itgd.utils.*"%>
<%@include file="global_include.jsp"%>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<%@include file="googleanalytics.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="refresh" content="300" />
<title>Business Today: Business News, Latest Stock Market and Economy News India from Businesstoday.in</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="description" content="latest Business News, Indian economy News, Sensex updates, BSE, NSE, stock exchange news, Mutual Funds, investing in India, new market. Daily stock markets news, insurance, income tax filing information." />
<meta name="keywords" content="Latest Business News - Businesstoday.in one of the best business magazine in India which offers you latest updates about stocks, NSE, BSE, Top Companies, Markets, Sectors, Banking, interviews and money management tips." />
<meta name="google-site-verification" content="P2lmnYzIX2lQifvTcbZbYNn5_RBHN3Y2_-h-_POOf68" />
<meta name="msvalidate.01" content="28AD13B9E2353694C455F57D02382A94" />
<link rel="canonical" href="http://m.businesstoday.in" />
<link rel="stylesheet" href="css/mobile.css" type="text/css">
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/jquery.cycle.all.min.js"></script>
<script type="text/javascript" src="js/jquery.touchwipe.js"></script>
<%@include file="zedo-adCode-ros.jsp"%>
</head><body>
 <%@include file="zedo-adCode-ros-logo.jsp"%>
<%@include file="topnav.jsp"%>
<div align="center" style="width:300px;margin:0px auto"><%@include file="top_add.jsp" %> </div>
<div align="center"></div>
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tbody>

                <tr>
                    <td style="height: 8px">
                    </td>
                </tr>
                <tr>
                    <td width="50%" align="left" style="border-bottom: #cdcdcd 1px solid" bgcolor="#ffffff"
                        class="breadcrumb">
                        
                        <a href="<%=SITE_BASEPATH%>index.jsp">Home </a>&raquo; Market
                    </td>

                </tr>
            </tbody>
        </table>

        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tbody>
                <tr>
                    <td bgcolor="#ffffff">
                                          <div align="center">	
    <iframe src="http://businesstoday.acemf.co.in/Market/VolumeToppers.aspx?Exchg=NSE" frameborder="0"  height="1000" width="380" scrolling="auto"></iframe>
    </div>
                    </td>
                </tr>
                
                <tr>
                    <td style="height: 10px"><br /><br /><br /></td>
                </tr>
               <%@ include file="common-bottomnav.html"%>
</body>
</html> 
