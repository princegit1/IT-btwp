<%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %>
<%@page language="java" import="java.util.*,java.sql.*, java.net.*, java.util.ArrayList, com.itgd.utils.*, com.itgd.dto.StoryDTO,com.itgd.dto.ContentListDTO"%>
<cache:cache key="<%=SITE_URL+"home_video_chunk.jsp"%>" scope="application " time="599" refresh="t" >
<%@ page language="java" import="com.itgd.dto.ContentChunkDTO, com.itgd.helper.ContentChunkHelper, com.itgd.utils.*" pageEncoding="ISO-8859-1"%>
<div class="container">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
<%
int videoCountDisplay = 1;
//int[] stArray={42, 43, 39, 44,705};
int[] stArray={634};
String[] myString = new String[stArray.length];
for (int i=0;i<stArray.length;i++)
{
	if (i == 0 ) 
		//out.print("<tr><td bgcolor='#DD1920' class='subheading'><a href=\"videos\">Videos</a></td></tr>");
	if(stArray[i]==42 || stArray[i]==43) {
		videoCountDisplay = 2;
	} else {
		videoCountDisplay = 3;
	}
	ArrayList videoListData = (ArrayList) ContentChunkHelper.latestVideo(stArray[i], videoCountDisplay, "0");
		
//	out.print("<br> "+stq);
	
	if (videoListData != null && videoListData.size() > 0) {
	
	//out.print("Count "+videoListData.size());
	
	
	
		for (int ctr=0; ctr < videoListData.size(); ctr++) {
			ContentChunkDTO catDetail = (ContentChunkDTO) videoListData.get(ctr);		
%>
			<tr><td  bgcolor="#FFFFFF" style="border-bottom:1px solid #DBDBDB;"><div style="margin-left:0px; line-height:20px;">
			<%if(catDetail.getSmallImage().trim().length() > 0) {%>
				<a class="posrel" href="/<%=catDetail.getContentURL()%>"><div class="caption-wrapper"><div class="caption-video"></div><img src="<%=STORY_IMAGE_BASEPATH+catDetail.getSmallImage().trim()%>" width="88" height="66" align="left" style="margin:0 8px 0 2px; border:0;"/></div><span class="pmedia-play-icon"></span></a>
			<% } else {%>
				<a class="posrel" href="/<%=catDetail.getContentURL()%>"><div class="caption-wrapper"><div class="caption-video"></div><img src="<%=NO_IMG_88x66%>" width="88" height="66" align="left" style="margin:0 8px 0 2px; border:0;"/></div><span class="pmedia-play-icon"></span></a>
			<% }%>
			<a  href="/<%=catDetail.getContentURL()%>"><span class="story-title"><%=catDetail.getTitle()%></span></a></div></td></tr>
<%}} 
if(i == stArray.length-1 ){
	out.print("<tr><td class='more' bgcolor='#ffffff' style='PADDING-LEFT: 2px; BORDER-BOTTOM: #c7c7c7 1px solid'><a href=\"/videolist/budget2014-15/1/634.html\">more »</a></td></tr>");
}}%>
</table>

</div></cache:cache>