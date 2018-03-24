<%@page language="java" import="java.net.*, java.util.ArrayList, com.itgd.utils.*, com.itgd.dto.ContentListDTO"%>
<%@include file="global_include.jsp"%>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
<% ArrayList contentAL = null;
contentAL = (ArrayList)CommonFunctions.latestStories("99", 4, "0");
if (contentAL != null && contentAL.size() > 0) {
	for (int ctr = 0; ctr < contentAL.size(); ctr++) {
		ContentListDTO cDTO = (ContentListDTO) contentAL.get(ctr);
		if (ctr == 0) {%>
			<tr><td height="22" bgcolor="#2E3094" style="color:#fff" class="subheading">BIG STORY</td></tr>	<tr><td height="5" bgcolor="#FFFFFF"></td></tr>
		<%}%>
			<tr><td bgcolor="#FFFFFF" style="border-bottom:1px solid #DBDBDB;">
				<%if(cDTO.getImage().trim().length() > 0) {%>
					<img src="<%=STORY_IMAGE_BASEPATH+cDTO.getImage().trim()%>" width="80" height="80" align="left" style="margin:0 8px 0 2px; border:0;"/>
			<% } else {%>
					<img src="<%=NO_IMG_88x66%>" width="80" height="80" align="left" style="margin:0 8px 0 2px; border:0;"/>
			<% }%>
			<div class="story-title"><%=cDTO.getTitle()%></div>
			</td></tr>
			
<%}}%>
</table>   
