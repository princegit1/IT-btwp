<%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %>
<%@page language="java" import="java.net.*, java.util.ArrayList, com.itgd.utils.*, com.itgd.dto.ContentListDTO"%>
<%@include file="global_include.jsp"%>
<%
String categoryId = "4";
int contentCount = 5;
String storyIdToAvoid="0";
if(request.getParameter("categoryId")!=null && !request.getParameter("categoryId").equals("")){
	categoryId = request.getParameter("categoryId");
}
if(request.getParameter("contentCount")!=null && !request.getParameter("contentCount").equals("")){
	contentCount = Integer.parseInt(request.getParameter("contentCount"));
}
if(request.getParameter("storyIdToAvoid")!=null && !request.getParameter("storyIdToAvoid").equals("")){
	storyIdToAvoid = request.getParameter("storyIdToAvoid");
}

int pcatlength = 0;
String pcatids[] = null;
if(categoryId.indexOf("#") > 0) {
	pcatids = categoryId.split("#");
} else {
	pcatids = new String[1];
	pcatids[0] = categoryId;
}
pcatlength = pcatids.length;
String headerURL = "";


%>
<cache:cache key="http://m.businesstoday.in/latest_stories_chunk_budget.jsp?categoryId=<%=categoryId %>&contentCount=<%=contentCount %>" scope="application" time="300" refresh="t" > 
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
<%
ArrayList lsAL = null;
String catTitle="";
lsAL = (ArrayList)CommonFunctions.latestStories(categoryId, contentCount, storyIdToAvoid);
if (lsAL != null && lsAL.size() > 0) {
	for (int ctr = 0; ctr < lsAL.size(); ctr++) {
		ContentListDTO cDTO = (ContentListDTO) lsAL.get(ctr);
		if (ctr == 0) {
			if(pcatlength==1)
				headerURL = SITE_BASEPATH+CommonFunctions.sectionURL(cDTO.getCurrentCategorySefTitle(), 1, cDTO.getCurrentCategoryId());
			else if(pcatlength==2) 
				headerURL = SITE_BASEPATH+CommonFunctions.categoryURL(cDTO.getCurrentCategorySefTitle(), 1, cDTO.getCurrentCategoryId());
			else if(pcatlength==3) 
				headerURL = SITE_BASEPATH+CommonFunctions.subCategoryURL(cDTO.getCurrentCategorySefTitle(), 1, cDTO.getCurrentCategoryId());
			else if(pcatlength==4) 
				headerURL = SITE_BASEPATH+CommonFunctions.subSubCategoryURL(cDTO.getCurrentCategorySefTitle(), 1, cDTO.getCurrentCategoryId());
				
				if(cDTO.getCurrentCategoryTitle().equals("SECTORS")){
				catTitle="Industry ";
				}else if(cDTO.getCurrentCategoryTitle().equals("Best Advice I Ever Got")){
				catTitle="Specials ";
				}else if(cDTO.getCurrentCategoryTitle().equals("India - A hotspot of hope")){
				catTitle="SPECIAL: 66 reasons of hope";
				}else if(cDTO.getCurrentCategoryTitle().equals("India's Coolest Start-ups 2013")){
				catTitle="SPECIAL: COOLEST START-UPS OF INDIA";
				}else if(cDTO.getCurrentCategoryTitle().equals("Lok Sabha Elections 2014")){
				catTitle="Saffronomics: Potential & Pitfalls";
				}else if(cDTO.getCurrentCategoryTitle().equals("Money")){
				catTitle="Personal Finance";
				}else if(cDTO.getCurrentCategoryTitle().equals("Talking heads") || cDTO.getCurrentCategoryTitle().equals("TALKING HEADS")){
				catTitle="Opinion";
				}else{
				catTitle=cDTO.getCurrentCategoryTitle();
				}
			
%>
			<!--<tr><td height="22" bgcolor="#2E3094" class="subheading"><a href="<%//=headerURL%>" class="subheading"><%//=catTitle%></a></td></tr>	<tr><td height="5" bgcolor="#FFFFFF"></td></tr>-->
            
<%}	%>
			<tr><td bgcolor="#FFFFFF" style="border-bottom:1px solid #DBDBDB;">
			<%if(cDTO.getImage().trim().length() > 0) {%>
				<a href="/<%=CommonFunctions.storyURL(cDTO.getSefTitle(),1,cDTO.getId())%>"><img src="<%=STORY_IMAGE_BASEPATH+cDTO.getImage().trim()%>" width="80" height="80" align="left" style="margin:0 8px 0 2px; border:0;"/></a>
			<% } else {%>
				<a href="/<%=CommonFunctions.storyURL(cDTO.getSefTitle(),1,cDTO.getId())%>"><img src="<%=NO_IMG_88x66%>" width="80" height="80" align="left" style="margin:0 8px 0 2px; border:0;"/></a>
			<% }%>
			<a href="/<%=CommonFunctions.storyURL(cDTO.getSefTitle(),1,cDTO.getId())%>"><span class="story-title"><%=cDTO.getTitle()%></span></a></td></tr>
<%
	if(ctr==lsAL.size()-1) {
		out.print("<tr><TD CLASS='more' STYLE='PADDING-LEFT: 2px; BORDER-BOTTOM: #c7c7c7 1px solid' BGCOLOR='#ffffff'><a href=\""+headerURL+"\">more &raquo;</A></TD></tr>");
	}
}}%>


<%if(categoryId.equals("1252")){%>
<tr><td align="center"><div style="height:5px;"></div></td> </tr>
<%}%>

</table>
<%if(categoryId.equals("1252")){%>
<div style="height:8px;"></div>
<%}%>
</cache:cache>
