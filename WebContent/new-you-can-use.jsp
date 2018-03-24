<%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %>
<%@page language="java" import="java.net.*, java.util.ArrayList, com.itgd.utils.*, com.itgd.dto.StoryListDTO,com.itgd.dto.StoryListDTO,java.sql.*"%>
<%@include file="global_include.jsp"%>

<cache:cache key="<%=SITE_URL+"new-you-can-use.jsp"%>" scope="application " time="600" refresh="t" >

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr><td height="8"></td></tr>
<tr><td class="breadcrumb">

</td></tr>

<tr><td height="7"></td></tr><tr><td bgcolor="#2E3094" class="subheading">NEWS YOU CAN USE </td></tr>


	<%

ArrayList mustseephoto = (ArrayList) specialCategoryData("news_you_can_use",6);
if(mustseephoto != null && mustseephoto.size() > 0){
StoryListDTO  mustseephotodata=null;
  	for (int j = 0; j < mustseephoto.size(); j++) {  
    	  mustseephotodata = (StoryListDTO) mustseephoto.get(j);
    	
  %>
  
  	<tr><td  bgcolor="#FFFFFF" style="border-bottom:1px solid #DBDBDB;"><div style="margin-left:5px; line-height:20px;">
  <%  	

 if("3".equals(mustseephotodata.getCategoryTitle())){
%>

<a href="<%=Constants.SITE_PATH+CommonFunctions.galleryURL(mustseephotodata.getSefTitle(),1,mustseephotodata.getId())%>">

<img src="<%= Constants.GALLERY_IMG_PATH+mustseephotodata.getMetaTitle() %>" style="margin:0 8px 0 2px; border:0;" height="80" width="80" align="left"/><img style="margin:0 8px 0 -88px; border:0;" height="80" width="80" align="left" title="" alt="" src="http://media2.intoday.in/btmt/images/photo-icon_140x130.png"></a>
<%
}

  
 else if("2".equals(mustseephotodata.getCategoryTitle())){
 %>
 	<a href="<%=CommonFunctions.storyURL( mustseephotodata.getSefTitle(), 1,mustseephotodata.getId()) %>" ><img src="<%=Constants.KICKER_IMG_PATH%>/<%=mustseephotodata.getImage() %>" title="<%=mustseephotodata.getImageAltText()%>" alt="<%=mustseephotodata.getImageAltText()%>" style="margin:0 8px 0 2px; border:0;" height="80" width="80" align="left" /></a>
 <%}
 
%>
					<%
 if("3".equals(mustseephotodata.getCategoryTitle())){
%>

<a href="<%=Constants.SITE_PATH+CommonFunctions.galleryURL(mustseephotodata.getSefTitle(),1,mustseephotodata.getId())%>">

<span class="story-title"><%=mustseephotodata.getTitle()%></span></a>
<%
}

  
 else if("2".equals(mustseephotodata.getCategoryTitle())){
 %>
 	<a href="<%=CommonFunctions.storyURL( mustseephotodata.getSefTitle(), 1,mustseephotodata.getId()) %>" ><span class="story-title"><%=mustseephotodata.getTitle()%></span></a>
 <%}
 
 else if("1".equals(mustseephotodata.getCategoryTitle())) {// For video URLs{
 %>
 	<a href="<%=CommonFunctions.videoURL( mustseephotodata.getSefTitle(), 1,mustseephotodata.getId()) %>" ><span class="story-title"><%=mustseephotodata.getTitle()%></span></a>
 <%}
 
%>
			
			
	</div></td></tr>		
			
			
			
<%
	
}}%>



	</div></td></tr>

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
                categoryDTO.setMetaTitle(rs.getString("mobile_image") == null ? "" : rs.getString("mobile_image"));  
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