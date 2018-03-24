<%@page language="java" import="java.util.*, java.sql.*, java.net.*, java.util.ArrayList, com.itgd.utils.*, com.itgd.dto.*"%>
<%@include file="../global_include.jsp"%>
<%@include file="global_include_budget.jsp"%>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">

<%
int hp=0;
if(request.getParameter("hp") != null) {
	try {
		hp = Integer.parseInt(request.getParameter("hp"));
	} catch (Exception ex) {
		hp=0;
	}
}

if(hp < 0 && hp > 1)
	hp=0;

if(hp==0)
	out.println("<tr><td height='22' bgcolor='#303092' class='subheading'><a href=\""+SITE_URL+"budget/index.jsp\">Highlights</a></td></tr><tr><td height='5' bgcolor='#FFFFFF'></td></tr>");

String contentId="192721";
if(request.getParameter("id") != null)
	contentId = request.getParameter("id");

int count=0;
StoryListDTO topobj = getHighlightsData(contentId);

int counter=0; 
int articleId=0;
String completeNews="";
try {
if (topobj!= null) {	
	articleId = topobj.getId();	
	//System.out.println(articleId);
	String words[]=topobj.getFullDescription().replaceAll("\\<.*?>","").split(" ");	
	for (int ii=0 ; ii < words.length ; ii++){ 
	   if (words[ii].contains("Highlight")) 
		  count += 1; 
	} 
	//System.out.println(count);
	for (int j=count ; j >0 ; j--){ 
		String str=topobj.getFullDescription();    	
		int a1 = str.indexOf("Highlight"+j+":");		
		String aa = str.substring(a1, str.length());
		int a2 = aa.indexOf("#");
		String ab = aa.substring(0, a2);
		String tempStr = "Highlight "+j+":";		
		if (tempStr.equals("Highlight "+j+":")) {
			completeNews = ab.substring(ab.indexOf(tempStr)+ tempStr.length());	
			//out.println("<li>"+completeNews);
			if(j==count||j==count-1){
%> 
				<tr><td bgcolor="#FFFFFF" style="border-bottom:1px solid #DBDBDB;"><img src="http://m.indiatoday.in/itwapsite/images/blue_squire_bullet.jpg" align="left" width="3" height="3" style="margin:7px 5px 0 1px;"><font style="color:#000000;font-size:14px;text-decoration:none" ><%=completeNews%></font></td></tr>
<%			}
		}
	}
}
}catch(Exception e){}
%>            
<tr><TD CLASS="more" STYLE="PADDING-LEFT: 2px; BORDER-BOTTOM: #c7c7c7 1px solid" BGCOLOR="#ffffff"><a href="<%=SITE_URL%>budget/story_highlights.jsp?id=<%=contentId%>">more highlights &raquo;</A></TD></tr>
</table>