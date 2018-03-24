<%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %>
<%@page language="java" import="java.net.*, java.util.ArrayList, com.itgd.utils.*, com.itgd.dto.StoryListDTO,java.sql.*"%>
<%@include file="global_include.jsp"%>
<cache:cache key="http://m.businesstoday.in/btwap/mustsee_chunk.jsp" scope="application" time="600" >
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
String headerURL = "must-see.jsp";


%>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
<tr><td height="22" bgcolor="#2E3094" class="subheading"><a href="must-see.jsp">MUST SEE</a></td></tr>	<tr><td height="5" bgcolor="#FFFFFF"></td></tr>
<%

ArrayList mustseephoto = (ArrayList) specialCategoryData("home_mustsee",3);
if(mustseephoto != null && mustseephoto.size() > 0)
{

  	for (int j = 0; j < mustseephoto.size(); j++) {  
    	StoryListDTO  mustseephotodata = (StoryListDTO) mustseephoto.get(j);
    	
    	
    	
%>
			<tr><td bgcolor="#FFFFFF" style="border-bottom:1px solid #DBDBDB;">
			
			
			
<%
 if(mustseephotodata.getCategoryTitle().equals("3")){
%>

<a href="<%=Constants.SITE_PATH+CommonFunctions.galleryURL(mustseephotodata.getSefTitle(),1,mustseephotodata.getId())%>">

<img src="<%= Constants.GALLERY_IMG_PATH+mustseephotodata.getImage() %>" style="margin:0 8px 0 2px; border:0;" height="80" width="80" align="left"/><img style="margin:0 8px 0 -88px; border:0;" height="80" width="80" align="left" title="" alt="" src="http://media2.intoday.in/btmt/images/photo-icon_140x130.png"></a>
<%
}

  
 else if(mustseephotodata.getCategoryTitle().equals("2")){
 %>
 	<a href="<%=CommonFunctions.storyURL( mustseephotodata.getSefTitle(), 1,mustseephotodata.getId()) %>" ><img src="<%=Constants.KICKER_IMG_PATH%>/<%=mustseephotodata.getImage() %>" title="<%=mustseephotodata.getImageAltText()%>" alt="<%=mustseephotodata.getImageAltText()%>" style="margin:0 8px 0 2px; border:0;" height="80" width="80" align="left" /></a>
 <%}
 
%>

		
	
			
			
			<%
 if(mustseephotodata.getCategoryTitle().equals("3")){
%>

<a href="<%=Constants.SITE_PATH+CommonFunctions.galleryURL(mustseephotodata.getSefTitle(),1,mustseephotodata.getId())%>">

<span class="story-title"><%=mustseephotodata.getTitle()%></span></a>
<%
}

  
 else if(mustseephotodata.getCategoryTitle().equals("2")){
 %>
 	<a href="<%=CommonFunctions.storyURL( mustseephotodata.getSefTitle(), 1,mustseephotodata.getId()) %>" ><span class="story-title"><%=mustseephotodata.getTitle()%></span></a>
 <%}
 
%>
			
			
			
			
			
			
			</td></tr>
<%
	if(j==mustseephoto.size()-1) {
		out.print("<tr><TD CLASS='more' STYLE='PADDING-LEFT: 2px; BORDER-BOTTOM: #c7c7c7 1px solid' BGCOLOR='#ffffff'><a href=\""+headerURL+"\">more &raquo;</A></TD></tr>");
	}
}}%>




</table>

</cache:cache>

<%!
	public static ArrayList specialCategoryData(String categoryName,int numberOfContent) throws Exception {
		ArrayList categoryListingData = new ArrayList();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String selectQuery = "";		
		StoryListDTO categoryDTO = null;
		int categoryContentCount = 0;
	
		
		
		try {
			//DbConnection dbConn = DbConnection.getInstance();
			//conn = dbConn.getConnection();
			
				DbConnection connect = null;
			DbConnection dbConn = DbConnection.getInstance("indiatoday");
			conn  = dbConn.getConnection("indiatoday");

			//System.out.println("categoryContentCount->"+categoryContentCount + " -- startLimit->" +startLimit);
			//Code for category Content Count
			selectQuery = "SELECT `content_id`,`title`,`introtext`,`kicker_image`,kicker_image_alt_text,large_kicker_image,mobile_image,`content_type`,`sef_url`,`byline`,`large_kicker_image_alt_text` FROM `jos_specialpage_manager` WHERE `published`='1' AND `special_page`=? ORDER BY `ordering`  limit ?";
			
			
			
			//System.out.println("CategoryHelper"+selectQuery);	
			pstmt = conn.prepareStatement(selectQuery);
			pstmt.setString(1, categoryName);
			pstmt.setInt(2, numberOfContent);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				categoryDTO = new StoryListDTO();
				categoryDTO.setId(rs.getInt("content_id"));				
				categoryDTO.setTitle(rs.getString("title"));
				categoryDTO.setByLine(rs.getString("byline"));				
		        categoryDTO.setImage(rs.getString("kicker_image") == null ? "" : rs.getString("kicker_image"));     
		         categoryDTO.setImageAltText(rs.getString("kicker_image_alt_text") == null ? "" : rs.getString("kicker_image_alt_text"));    
		        categoryDTO.setSefTitle(rs.getString("sef_url"));	
		       	categoryDTO.setCategoryTitle(rs.getString("content_type"));
				
				categoryListingData.add(categoryDTO);
				//System.out.println("CategoryHelper");	
			}
		} catch(Exception ex) {
			System.out.println("Issue in CategoryHelper.java -> "+ex.toString());
		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
		return categoryListingData;
	}


%>
