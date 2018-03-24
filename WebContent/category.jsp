<%@taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %><compress:html removeIntertagSpaces="true"><%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %><%@page language="java" import="java.sql.*, java.util.ArrayList, com.itgd.utils.*,com.itgd.dto.ContentListDTO, com.itgd.dto.StoryListDTO"%><%@include file="global_include.jsp"%>
<%
int sectionId = 141;
int currentPageNo = 1;
if(request.getAttribute("sectionId")!=null) {
	sectionId = (Integer)request.getAttribute("sectionId");
} else if(request.getParameter("categoryid") != null) {
	sectionId = Integer.parseInt(request.getParameter("categoryid"));
}
if(request.getAttribute("currentPageNo")!=null)
	currentPageNo = (Integer)request.getAttribute("currentPageNo");
%><cache:cache key="<%=SITE_URL+"category/"+currentPageNo+"/"+sectionId%>" scope="application " time="610" refresh="t" ><%
int ctrStart = 0;
int ctrToDisplay=30; 
if(sectionId==702 || sectionId==679 || sectionId==698   ) {
	ctrToDisplay=30;
}
int ctrToFetch=ctrStart+ctrToDisplay;
request.setAttribute("add_categoryid",sectionId);
ArrayList sAL =null;				
sAL = latestStoriesTemplate(sectionId, ctrToFetch, "0", 2);
if(sAL!=null && sAL.size()>0){
	for (int ctr=ctrStart; ctr < sAL.size(); ctr++) {
		StoryListDTO sDTO = (StoryListDTO) sAL.get(ctr);
		if (ctr == ctrStart) {   %>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html><head><%@include file="topchartbeat.jsp"%>
<base href="<%=SITE_URL%>"/>
<META http-equiv="Content-Type" content="text/html;charset=iso-8859-1">
<title><%=sDTO.getMetaTitle()%></title>
<meta name="description" content="<%=sDTO.getMetaDescription()%>" />
<meta name="keywords" content="<%=sDTO.getMetaKeyword()%> " />
<link rel="stylesheet dns-prefetch" href="css/mobile.css" type="text/css">
<script type="text/javascript" src="js/jquery-1.4.2.min.js" async></script>
<script type="text/javascript" src="js/jquery.cycle.all.min.js" async></script>
<script type="text/javascript" src="js/jquery.touchwipe.js" async></script>
<jsp:include page="ga-comscore.jsp" flush="false"></jsp:include>
<%@include file="zedo-adCode-ros.jsp"%>
</head><body> 
<%@include file="zedo-adCode-ros-logo.jsp"%>
<% if(sectionId==702 || sectionId==679 || sectionId==698 || sectionId==708 || sectionId==696  || sectionId==710  || sectionId==711  || sectionId==712  || sectionId==713  || sectionId==714  || sectionId==715  || sectionId==716 ) { %>
	<%@include file="budget_topnav.jsp"%>
<% } else {	%>
	<%@ include file="common-topnav.jsp"%>
	<%sectionNameforAddDisplay=sDTO.getCategoryTitle();%>
<% } %>
<div style="height:8px;"></div>
<div align="center"> <%@include file="top_add.jsp" %> </div>
<div style="height:5px;"></div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr><td class="breadcrumb"><a href="<%=SITE_URL%>">Home</a> &raquo; <a href="<%=CommonFunctions.sectionURL(sDTO.getSectionSefTitle(),1, sDTO.getSectionId())%>"><%=sDTO.getSectionTitle()%></a> &raquo; <%=sDTO.getCategoryTitle()%></td></tr>
<tr><td height="7"></td></tr><tr><td bgcolor="#2E3094" class="subheading"><%=sDTO.getCategorySefTitle()%> </td></tr>
<% } %>
<% if(!sDTO.getTitle().contains("http://")){%>
	<tr><td  bgcolor="#FFFFFF" style="border-bottom:1px solid #DBDBDB;"><div style="margin-left:5px; line-height:20px;">
	<%if(sDTO.getImage().trim().length() > 0) {%>
		<a href="<%=CommonFunctions.storyURL(sDTO.getSefTitle(),1, sDTO.getId())%>"><img rel="prefetch" src="<%=STORY_IMAGE_BASEPATH+sDTO.getImage().trim()%>" width="80" height="80" align="left" style="margin:0 8px 0 2px; border:0;"/></a>
	<% } else {%>
		<a href="<%=SITE_BASEPATH+CommonFunctions.storyURL(sDTO.getSefTitle(),1, sDTO.getId())%>"><img rel="prefetch" src="<%=NO_IMG_88x66%>" width="80" height="80" align="left" style="margin:0 8px 0 2px; border:0;"/></a>
	<% }%>
	<a href="<%=CommonFunctions.storyURL(sDTO.getSefTitle(),1, sDTO.getId())%>"><span class="story-title"><%=sDTO.getTitle()%></span></a><% if(sectionId==114) { %><div class="podcastbyline "><%=sDTO.getByLine()%></div><%} %>
	</div></td></tr>
<%}}%>
<tr><td align="center"></td></tr></table><div style="height:12px;"></div>
<%--
<%
/*
ArrayList photo = (ArrayList)CommonFunctions.latestGalleries(170, 5, "0");
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
	out.print("<tr><td align='center' valign='top' bgcolor='#FFFFFF' style='border-bottom:1px solid #DBDBDB;'><div class='homegallery'><div class='arr-left'><a id='prev' href=\"#\"><img src=\"images/left-arrow-new.gif\" border='0'></a></div><div class='arr-right'><a id='next' href=\"#\"><img src=\"images/right-arrow-new.gif\" border='0'></a></div><div id='imagegallery' >");
}
%>
	<div class="gallerycont">
	<div class="simgrepeat"><a href="<%=SITE_BASEPATH+CommonFunctions.galleryURL(galleryArray[ctr][2],1, Integer.parseInt(galleryArray[ctr][0]))%>"><img src="<%=PHOTO_BASEPATH+galleryArray[ctr][3]%>" width="144" height="130" /><span class="photoicon"></span></a></div>
	<div clear="both"></div>
	<a href="<%=SITE_BASEPATH+CommonFunctions.galleryURL(galleryArray[ctr][2],1, Integer.parseInt(galleryArray[ctr][0]))%>"><%=galleryArray[ctr][1]%></a> 
	</div>
<%
if (ctr == galleryArray.length-1) {
	out.print("</div></div></td></tr><tr><td class='more' bgcolor='#FFFFFF' style='border-bottom:1px solid #C7C7C7; padding-left:2px;'><a href=\""+SITE_BASEPATH+"galleries\">more &raquo;</a></td></tr>");
}


}}
*/
%>
</table>-->
--%>
<div style="height:12px;"></div>
<%@ include file="othercategories.html"%> <div style="height:12px;"></div>  <%@include file="hotzone.html"%>  <%@include file="ringtones.html"%> 
<% if(sectionId==702 || sectionId==679 || sectionId==698 ||  sectionId==708 || sectionId==696 || sectionId==710  || sectionId==711  || sectionId==712  || sectionId==713  || sectionId==714  || sectionId==715  || sectionId==716  ) { %>
	<%@ include file="budget_bottomnav.html"%>
<% } else { %>
 	<%@ include file="common-bottomnav.html"%>
<% } %>
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
<%@include file="bottomchartbeat.jsp"%>
</body>
</html>  
<% } else {
	String redirectURL = SITE_BASEPATH + "pagenotfound.jsp";
	response.sendRedirect(redirectURL);
}
%>
<%! public static ArrayList latestStoriesTemplate(int catId, int contentCount, String contentIdToAvoid, int catLevel) throws Exception {
	Connection connection = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StoryListDTO cDTO = null;
	ArrayList cAL = new ArrayList();
	String contentIdsToCheck = "";
	//System.out.println(catLevel);
	if(catLevel!=1 && catLevel!=2 && catLevel!=3 && catLevel!=4) {
		catLevel=1;
		catId=120;
	}

	if(!contentIdToAvoid.equals("0")) {
		if(!contentIdToAvoid.equals("0") && contentIdToAvoid.indexOf(",") < 0)
			contentIdsToCheck = " and c.id != "+contentIdToAvoid+" ";
		else
			contentIdsToCheck = " and c.id not in ("+contentIdToAvoid+") ";
	}
	int ctr=0;
	try {
		DbConnection connect = null;
		connect = DbConnection.getInstance("indiatoday");
		connection = connect.getConnection("indiatoday");
		String sql = "select c.id, c.title, c.sef_url,c.byline, c.kicker_image as kicker_image, c.kicker_image_alt_text, ";

		if(catLevel==1)
			sql = sql + "js.title as stitle, js.id as sid, js.sef_url as sseftitle, js.metatitle, js.metakey, js.metadesc " +
					"from jos_content c, jos_article_section jas, jos_sections js where jas.section_id="+catId+" and c.id=jas.article_id and c.published=1 and jas.section_id=js.id and js.published=1 ";
		else if(catLevel==2) 
			sql = sql + "js.title as stitle, jc.name as catname, js.id as sid, js.sef_url as sseftitle, jc.title as ctitle, jc.id as cid, jc.sef_url as cseftitle, jc.metatitle, jc.metakey, jc.metadesc " +
					"from jos_categories jc, jos_content c, jos_article_section jas, jos_sections js where jas.cat_id="+catId+" and c.id=jas.article_id and c.published=1 and jc.id=jas.cat_id  and jc.section=js.id and jc.published=1 and js.published=1 ";
		else if(catLevel==3) 
			sql = sql + "js.title as stitle, js.id as sid,  jc.name as catname, js.sef_url as sseftitle, jc.title as ctitle, jc.id as cid, jc.sef_url as cseftitle, " +
					"jsc.title as sctitle, jsc.id as scid, jsc.sef_url as scseftitle, jsc.metatitle, jsc.metakey, jsc.metadesc " +
					"from jos_subcategories jsc, jos_content c, jos_article_section jas, jos_sections js, jos_categories jc where jas.subcat_id="+catId+" and c.published=1 and c.id=jas.article_id and jsc.id=jas.subcat_id and jsc.category=jc.id and jsc.section=js.id and jsc.published=1 and jc.published=1 and js.published=1 ";
		else if(catLevel==4) 
			sql = sql + "js.title as stitle, js.id as sid,  jc.name as catname, js.sef_url as sseftitle, jc.title as ctitle, jc.id as cid, jc.sef_url as cseftitle, " +
					"jsc.title as sctitle, jsc.id as scid, jsc.sef_url as scseftitle, jssc.title as ssctitle, jssc.id as sscid, jssc.sef_url as sscseftitle, " +
					"jssc.metatitle, jssc.metakey, jssc.metadesc " +
					"from jos_sub_subcategories jssc, jos_content c, jos_article_section jas, jos_sections js, jos_categories jc, jos_subcategories jsc " +
					"where jas.sub_subcat_id="+catId+" and c.published=1 and c.id=jas.article_id and jssc.id=jas.sub_subcat_id and jsc.id=jas.subcat_id and jc.id=jas.cat_id and js.id=jas.section_id and jssc.published=1 and js.published=1 and jsc.published=1 and jc.published=1 ";

		sql = sql + " "+contentIdsToCheck+" and c.title not like '%href=%' group by c.id order by jas.ordering desc limit "+contentCount;
		//System.out.println(sql);

		pstmt = connection.prepareStatement(sql);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			cDTO = new StoryListDTO();
			cDTO.setId(rs.getInt("id"));
			cDTO.setTitle(rs.getString("title") == null ? "" : rs.getString("title"));
			cDTO.setByLine(rs.getString("byline") == null ? "" : rs.getString("byline"));
			cDTO.setSefTitle(rs.getString("sef_url") == null ? "" : rs.getString("sef_url"));
			cDTO.setImage(rs.getString("c.kicker_image") == null ? "" : rs.getString("c.kicker_image"));
			cDTO.setImageAltText(rs.getString("kicker_image_alt_text") == null ? "" : rs.getString("kicker_image_alt_text"));
			cDTO.setMetaTitle(rs.getString("metatitle") == null ? "" : rs.getString("metatitle"));
			cDTO.setMetaKeyword(rs.getString("metakey") == null ? "" : rs.getString("metakey"));
			cDTO.setMetaDescription(rs.getString("metadesc") == null ? "" : rs.getString("metadesc"));
			cDTO.setSectionId(rs.getInt("sid"));
			cDTO.setSectionTitle(rs.getString("stitle") == null ? "" : rs.getString("stitle"));
			cDTO.setSectionSefTitle(rs.getString("sseftitle") == null ? "" : rs.getString("sseftitle"));
			if(catLevel>=2) {
				cDTO.setCategoryId(rs.getInt("cid"));
				cDTO.setCategoryTitle(rs.getString("ctitle") == null ? "" : rs.getString("ctitle"));
				cDTO.setCategorySefTitle(rs.getString("catname") == null ? "" : rs.getString("catname"));
			}
			if(catLevel>=3) {
				cDTO.setSubCategoryId(rs.getInt("scid"));
				cDTO.setSubCategoryTitle(rs.getString("sctitle") == null ? "" : rs.getString("sctitle"));
				cDTO.setSubCategorySefTitle(rs.getString("scseftitle") == null ? "" : rs.getString("scseftitle"));
			}
			if(catLevel>=4) {
				cDTO.setSubSubCategoryId(rs.getInt("sscid"));
				cDTO.setSubSubCategoryTitle(rs.getString("ssctitle") == null ? "" : rs.getString("ssctitle"));
				cDTO.setSubSubCategorySefTitle(rs.getString("sscseftitle") == null ? "" : rs.getString("sscseftitle"));
			}
			cAL.add(cDTO);
			ctr++;
		}
	} catch (Exception e) {
		System.out.println("IT WAP CommonFunctions (latestContent for "+catId+") Exception is :" + e);
	} finally {
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
		if(connection!=null)
			connection.close();
	}
	return cAL;
} %>
</cache:cache>
</compress:html>