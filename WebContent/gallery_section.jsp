<%@page language="java" import="java.text.*,java.sql.*,java.util.Date,java.util.*,com.itgd.dto.PhotoPlayDTO,com.itgd.dto.RelatedContentDTO,com.itgd.util.DbConnection,com.itgd.util.Constant"%>
 <%
  int galleryid=38;
   String galleryName="";
   String thumbImage=""; 
   String photoCatname=""; 
    String sef_url=""; 
 %>
 
 <!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="ctl00_Head1"><title>
	Business Today: Business News, Latest Stock Market and Economy News India from Businesstoday.in
</title><meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="HandheldFriendly" content="true" />
<meta id="ctl00_key" name="Keywords" content="Latest Business News - Businesstoday.in one of the best business magazine in India which offers you latest updates about stocks, NSE, BSE, Top Companies, Markets, Sectors, Banking, interviews and money management tips." />
<meta id="ctl00_desc" name="Description" content="latest Business News, Indian economy News, Sensex updates, BSE, NSE, stock exchange news, Mutual Funds, investing in India, new market. Daily stock markets news, insurance, income tax filing information." />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link type="text/css" rel="stylesheet" href="http://m.businesstoday.in/morenews.css" />
 

</head>
<body style="margin: 0px; padding: 0px;">
<%@include file="top.jsp" %> 
      <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tbody>

                <tr>
                    <td style="height: 8px">
                    </td>
                </tr>
                <tr>
                    <td width="50%" align="left" style="border-bottom: #cdcdcd 1px solid" bgcolor="#ffffff"
                        class="path">
                        
                        <a class="More" href="<%=Constant.SITE_URL %>index.jsp"><b>Home >></b></a>PHOTOS
                        </td>

                </tr>
            </tbody>
        </table>
<div class="LatestNews">
    <table cellspacing="0" cellpadding="0" border="0" width="100%" style="color: black;">
            <tbody>
 <%
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
	 <tr><td class="TOPHeading">PHOTOS</td></tr>
               <%} %>  
               <tr align="center" valign="top"> <td  ><h2><a href="<%=Constant.SITE_URL %>photoplay/<%=sef_url %>/1/<%=galleryid %>.html" class="LatestNews2"><img alt="<%=galleryName %>" src="<%=Constant.PHOTO_GALLERY_PATH %>/<%=thumbImage %>"></a></h2></td></tr>
                <tr align="center" valign="top">  <td style="font-size: 0px;" class="LatestNews2"><h2><a href="<%=Constant.SITE_URL %>photoplay/<%=sef_url %>/1/<%=galleryid %>.html" class="LatestNews2"><%=galleryName %></a></h2></td></tr>
                 <%}}%> 
                  <%@include file="footer.jsp" %> 
</body>
</html> 
                
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
			selectQuery = "SELECT g.id,g.Gallery_name, g.thumb_image, g.sef_url,s.id AS photo_category, s.name AS photo_catname FROM jos_gallerynames g,jos_sections s WHERE g.section_id IN('38','39') AND g.published=1 AND g.section_id=s.id AND s.published=1 AND s.section_type='photo' AND s.magazineid=1 ORDER BY g.ordering DESC LIMIT 3 ";
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
	