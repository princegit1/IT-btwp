<%!
public StoryListDTO getHighlightsData(String articleId){
	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement stmt = null;
	String selectQuery = "";
	StoryListDTO fulltextcontentDTO=null;
	try{
		DbConnection adminConn = DbConnection.getInstance("businesstoday");
		conn = adminConn.getConnection("businesstoday");
		selectQuery = "select c.id, c.`fulltext` from jos_content c where c.id="+articleId+""; 	
		System.out.println(selectQuery);
		stmt = conn.prepareStatement(selectQuery);
		rs = stmt.executeQuery();
		while(rs.next()) {
			fulltextcontentDTO = new StoryListDTO();
			fulltextcontentDTO.setId(rs.getInt("id"));
			fulltextcontentDTO.setFullDescription(rs.getString("fulltext"));
		}
	} catch (Exception e) {
			System.err.println(e.getMessage());
	} finally {
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception sqle) {
				System.err.println(sqle.getMessage());
			}
			rs = null;
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (Exception sqle) {
				System.err.println(sqle.getMessage());
			}
			stmt = null;
		}
		
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception sqle) {
				System.err.println(sqle.getMessage());
			}
			conn = null;
		}
	}
	return fulltextcontentDTO;
}
%>