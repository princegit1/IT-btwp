<%@ page import="java.sql.*,java.util.ArrayList"%><%
	String upQuery = "";
	Connection cn = null;
	ResultSet rs = null;
	Statement stmt = null;
	String msg = "";
	String lastbuildDate = "";
int leadStoryExpanded=0;
	String category = "";
	String url		=	"jdbc:mysql://itgd_miscdb1:3306/btmt";
	String uname	=	"itgd_mbtmt";
	String pass		=	"!tgd@mb+m+@105";				
			try { 
	Class.forName("com.mysql.jdbc.Driver").newInstance();
    			cn = DriverManager.getConnection(url,uname, pass);
				upQuery = "SELECT id FROM jos_content order by id desc limit 1";
				
				stmt = cn.createStatement();
				rs = stmt.executeQuery(upQuery);
			
					while (rs.next()) {
				leadStoryExpanded = rs.getInt("id");
			
				}
				
				out.println("result-->"+leadStoryExpanded);

			} catch (Exception e) {
				out.print("CONNECTION NOT FOUND == "+url+" || "+uname+" || "+pass);
				
			} finally {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (cn != null)
					cn.close();
			}
		
%>