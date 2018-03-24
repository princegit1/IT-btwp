<%@page language="java" import="java.text.*,java.sql.*,java.util.Date,java.util.*,com.itgd.dto.PhotoPlayDTO,com.itgd.dto.RelatedContentDTO,com.itgd.util.DbConnection,com.itgd.util.Constant"%>
 <%
   galleryid=38;
   String galleryName="";
    thumbImage=""; 
   String photoCatname=""; 
 String sef_url=""; 
   ArrayList galleryList = photoplayData();
   if (galleryList != null && galleryList.size() > 0) {
	for (int j = 0; j < galleryList.size(); j++) {
		PhotoPlayDTO photoplayDTO = (PhotoPlayDTO) galleryList.get(j);
 		galleryid=photoplayDTO.getGalleryId();
 		galleryName=photoplayDTO.getGalleryTitle();
   		thumbImage=photoplayDTO.getThumbimage(); 
   		photoCatname=photoplayDTO.getSectionName(); 
   		sef_url=photoplayDTO.getSefUrl().replace(".html","");
		if(j==0){
	 %>
	 <tr><td class="TOPHeading">More Galleries</td></tr>
               <%} %>  
                <tr>  <td style="font-size: 0px;" class="LatestNews2"><h2><a href="<%=Constant.SITE_URL %>photoplay/<%=sef_url %>/1/<%=galleryid %>.html" class="LatestNews2"><%=galleryName %></a></h2></td></tr>
                 <%}}%> 
                
<%!
	public static ArrayList photoplayData() throws Exception {
		ArrayList photoplayData = new ArrayList();
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String selectQuery = "";
		PhotoPlayDTO photoplayDTO = null;
		int PhotoCount = 0;
		
		
		try {
			DbConnection dbConn = DbConnection.getInstance();
			conn = dbConn.getConnection();
			
			selectQuery="";
			pstmt=null;
			rs=null;
			selectQuery = "SELECT g.id,g.Gallery_name, g.thumb_image, g.sef_url,s.id AS photo_category, s.name AS photo_catname FROM jos_gallerynames g,jos_sections s WHERE g.section_id IN('38','39') AND g.published=1 AND g.section_id=s.id AND s.published=1 AND s.section_type='photo' AND s.magazineid=1 ORDER BY g.ordering DESC LIMIT 4 ";
			System.out.println(selectQuery);
			pstmt = conn.prepareStatement(selectQuery);
			rs = pstmt.executeQuery();
			while(rs.next()) {
			  	photoplayDTO = new PhotoPlayDTO();
				photoplayDTO.setGalleryId(rs.getInt("id"));
				photoplayDTO.setGalleryTitle(rs.getString("Gallery_name"));
				photoplayDTO.setThumbimage(rs.getString("thumb_image") == null ? "" : rs.getString("thumb_image"));
				photoplayDTO.setSectionName(rs.getString("photo_catname"));
				photoplayDTO.setSefUrl(rs.getString("sef_url"));
				photoplayData.add(photoplayDTO);
				
			}
		} catch(Exception ex) {
			System.out.println("Issue in Photo Paly Helper-> "+ex.toString());
		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
		return photoplayData;
	}
%>
	