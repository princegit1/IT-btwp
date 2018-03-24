<%String staticContentTitle="";
if(request.getParameter("contentTitle")!=null && !request.getParameter("contentTitle").equals("")){
	staticContentTitle = request.getParameter("contentTitle");
}
%>
<%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %> 
<%@ page language="java" import="com.itgd.dto.StaticContentDTO,com.itgd.utils.CommonFunctions, com.itgd.utils.Constant"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %>
<cache:cache key="<%=Constant.SITE_URL + "staticcontent_chunk.jsp?staticContentTitle="+staticContentTitle%>" scope="application" time="2" > 
<%@page language="java" import="java.util.*,com.itgd.utils.*,com.itgd.dto.StoryDTO,java.sql.*"%> 
<% ArrayList gamesContent = (ArrayList) Staticcontent(staticContentTitle); 
if(gamesContent != null && gamesContent.size() > 0) {
 StoryDTO gamesdata = (StoryDTO) gamesContent.get(0); 
 out.println(gamesdata.getFullDescription()); }
  %> </cache:cache>

<%!
public static ArrayList Staticcontent(String staticTitle) {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs=null;
	StoryDTO staticcontentdata;
	ArrayList datalist = new ArrayList();
	try {
		DbConnection connect = DbConnection.getInstance("indiatoday");
		conn = connect.getConnection("indiatoday");
		String sql = "select contComStatic.title, contComStatic.introtext as staticintro FROM jos_content as contComStatic WHERE contComStatic.title = '" + staticTitle + "' AND contComStatic.published = 1 LIMIT 1 ";
		//System.out.println(staticTitle+sql);
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery(sql);				
		while (rs.next()) {
			staticcontentdata = new StoryDTO();
			staticcontentdata.setTitle(StringUtil.isEmpty(rs.getString("title")));
			staticcontentdata.setFullDescription(StringUtil.isEmpty(rs.getString("staticintro")));
			
			datalist.add(staticcontentdata);
		}
		
	} catch (Exception e) {
		System.out.println("Exception is in static content function ;" + e);
	} finally{
		try {
			if(rs!=null)				
				rs.close();				
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		} catch (SQLException e) {					
			System.out.println("BT-SQLException In common function finally block -> " + e);
		} 
		
	}
	return datalist;
}



%>


