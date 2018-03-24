<%@ page contentType="text/xml; charset=ISO-8859-1" %><%@ page import="java.sql.*"%><%@page import="java.io.IOException, java.io.File, java.io.FileOutputStream,java.util.ArrayList"%><%@ page import="com.itgd.utils.DbConnection,com.itgd.dto.StoryDTO"%><%
	int ARTICLES_LIMIT = 25;	
	String PUBDATE = ", DATE_FORMAT(SUBTIME(c.created, '5:30:00'), '%a, %d %b %Y %T GMT') as pubdate";	
	String WEBURL = "http://m.businesstoday.in/";
	String WEBPATH = "http://m.businesstoday.in/";		
	String XMLPATH = "c://home/";	
	String SUBSCRIPTION_TAG = "<item>\n<title>Subscribe Now</title>\n<link>http://m.businesstoday.in/subscription.html</link>\n<description> Subscribe now for your favourite magazines</description>\n</item>\n";
	int SECID_DEFAULT = 105;	
	String SITE_TITLE = "Business Today";	
	String SITE_LOGO = "http://m.businesstoday.in/images/bt-logo.gif";	
	String DEFAULT_STORYCAT = "http://m.businesstoday.in/sectionlist/105/1/latest-headlines.html";
	String XMLURL="http://m.businesstoday.in/";	
	int siteid = 1;
	int generate = 0;
	String secName="";
	try {
	
		siteid = 6;
		if(request.getParameter("generate")!=null) 
		generate = Integer.parseInt(request.getParameter("generate"));
		
		if(request.getParameter("secname")!=null) 
		secName = request.getParameter("secname");
		
		} catch(NumberFormatException ee) {
			System.out.println("rssStory.jsp -> "+ee.toString());
			response.sendRedirect("pagenotfound.jsp?msg=Requested Page does not exist.");
		}

	int storysections_exists = 1;	
	int secid1 = SECID_DEFAULT;
	int secid2 = 0;
	int secid3 = 0;
	int secid4 = 0;

	try {
		if(request.getParameter("sid")!=null)
			secid1 = Integer.parseInt(request.getParameter("sid"));
		if(request.getParameter("cid")!=null)
			secid2 = Integer.parseInt(request.getParameter("cid"));
		if(request.getParameter("scid")!=null)
			secid3 = Integer.parseInt(request.getParameter("scid"));
		if(request.getParameter("sscid")!=null)
			secid4 = Integer.parseInt(request.getParameter("sscid"));
		
	} catch (Exception ee) {		
		response.sendRedirect("pagenotfound.jsp?msg=Requested Page for 'id' does not exist.");
	}

	Connection cn=null;
	PreparedStatement pstmt = null;
	ResultSet rs=null;
	String secname1 = "";	
	StringBuffer rssSB = new StringBuffer();
	String selectQuery="";
	String kicker="";
	String headline="";
	int counter=0;
	int contentId=0;
	int catid= 0;
	String URL = "";
	int articles_fetched = 0;
	String metakey="";
	String secname = secName;
	String secname_togenerate = secName;
	String section_link=DEFAULT_STORYCAT;
	String story_link=DEFAULT_STORYCAT;
	String contentPublishedField="state";
	String sectionSefUrl = "";
	ArrayList latestList = new ArrayList();
	String latestArticleIds = "0"; 
			
		try
		{
		DbConnection adminConn = DbConnection.getInstance("indiatoday");
		cn = adminConn.getConnection("indiatoday");			
		if(secid1==0){ 
		selectQuery ="SELECT c.id as contentId,c.metakey,c.issueid,d.name,c.primary_category,c.title as headline,c.sef_url as URL,c.introtext as introtext,c.fulltext as kicker, js.id as secid1, js.title as secname1 ,  js.sef_url as secname1_sefurl,DATE_FORMAT(c.created , '%Y-%m-%d') as pubdate FROM jos_article_section ars,jos_content c, jos_sections js,jos_magazine_categories d where c.issueid=(select max(id) from jos_magazine_categories where published=1 and section=1) and c.issueid=d.id and js.issue_free=0 and ars.article_id=c.id and ars.section_id='20' and js.published=1 and c.published=1 group by c.id order by ars.ordering desc limit 30";
		}else if(secid1==105){
		selectQuery ="SELECT c.id as contentId,c.metakey,c.primary_category,c.title as headline,c.sef_url as URL,c.introtext as introtext,c.fulltext as kicker, js.id as secid1, js.title as secname1 ,  js.sef_url as secname1_sefurl, DATE_FORMAT(c.created , '%Y-%m-%d') as pubdate FROM jos_article_section ars,jos_content c, jos_sections js where ars.section_id='"+secid1+"' and ars.article_id=c.id and ars.section_id=js.id and js.published=1 and c.published=1 group by c.id order by ars.ordering desc limit 30";
		}else{		
		selectQuery ="SELECT c.id as contentId,c.metakey,c.primary_category,c.title as headline,c.sef_url as URL,c.introtext as introtext,c.fulltext as kicker, js.id as secid1, js.title as secname1 ,  js.sef_url as secname1_sefurl, DATE_FORMAT(c.created , '%Y-%m-%d') as pubdate FROM jos_article_section ars,jos_content c, jos_sections js where ars.section_id='"+secid1+"'  and ars.article_id=c.id and ars.section_id=js.id and js.published=1 and c.published=1 group by c.id order by ars.ordering desc limit 30";
		}		
		pstmt = cn.prepareStatement(selectQuery);
		rs = pstmt.executeQuery();
		rs.last();
		articles_fetched = rs.getRow();
		rs.beforeFirst(); 

		rssSB.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
		rssSB.append("<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\"  xmlns:mobile=\"http://www.google.com/schemas/sitemap-mobile/1.0\">\n");
			
			while(rs.next()){
				contentId = rs.getInt("contentId");
				kicker = replaceSpCharacters(rs.getString("kicker")).replaceAll("\\<.*?>","");
				headline =  replaceSpCharacters(rs.getString("headline")).replaceAll("\\<.*?>","");
				metakey=replaceSpCharacters(rs.getString("metakey")).replaceAll("\\<.*?>","");
				if(storysections_exists==1 ) 
				URL = replaceSpCharacters(rs.getString("URL")).replaceAll("\\<.*?>","");	
					if(!headline.contains("<a href") & metakey.trim().length() > 0) {			
					rssSB.append("<url>\n"); 					
					rssSB.append("<loc><![CDATA["+WEBPATH + "story/"+URL.replace(".html", "")+"/1/"+contentId+".html]]></loc>\n");
					rssSB.append("<lastmod>"+rs.getString("pubdate")+"</lastmod>\n");					
					rssSB.append("<mobile:mobile/>\n"); 
					rssSB.append("</url>\n"); 			
					}
				counter++;	
			}
			rssSB.append("</urlset>");
			out.println(rssSB.toString());
			/* - XML file generating from - */
			if(generate==1) {
			
				String fileName="bt_"+secname_togenerate.toLowerCase().replaceAll(" ","")+"_sitemap_news";
				int fileGenerated= generateXmlFile(rssSB.toString(), fileName, XMLPATH); 
				if(fileGenerated==1)
					System.out.println(XMLPATH+fileName+FILE_EXT+" file has been created.");
			}
			/* - XML file generating till - */
	} catch(Exception ee){
			System.out.println("rssStory.jsp -> Data Fetching Error -->"+ee.toString());
		} finally{
			if(pstmt!=null)
				pstmt.close();
			if(rs!=null)
				rs.close();
			if(cn!=null)
			cn.close();
		}
	
%><%!
String FILE_EXT =".xml";
// Headlines Today
String WEBURL_HLT = "http://headlinestoday.intoday.in";
String WEBPATH_HLT = "http://headlinestoday.intoday.in/site/headlines_today/";

String replaceSpCharacters(String strToReplace) 
{
	String replacedString =  strToReplace.replaceAll("&rsquo;", "\'").replaceAll("&lsquo;","\'").replaceAll("&nbsp;"," ").replaceAll("&mdash;","-").replaceAll("&hellip;","...").replaceAll("&#39;","'").replaceAll("&ndash;","-").replaceAll("&ldquo;", "\'").replaceAll("&minus;", "\'").replaceAll("&rdquo;", "\'").replaceAll("&eacute;", "E ").replaceAll("&agrave;", " ").replaceAll("&lt;", "<").replaceAll("&gt;", ">").replaceAll("&hellip;","...").replaceAll("_blank","'_blank'").replaceAll("<STRONG>","").replaceAll("</STRONG>","").replaceAll("<BR>","<BR />").replaceAll("<br>","<br />").replaceAll("&","and");
	return replacedString;
}

String replaceSpCharactersTitle(String strToReplace) 
{
	String replacedString =  strToReplace.replaceAll("&rsquo;", "\'").replaceAll("&lsquo;","\'").replaceAll("&nbsp;"," ").replaceAll("&mdash;","-").replaceAll("&hellip;","...").replaceAll("&ndash;","-").replaceAll("&ldquo;", "\'").replaceAll("&minus;", "\'").replaceAll("&rdquo;", "\'").replaceAll("&eacute;", "E ").replaceAll("&agrave;", " ").replaceAll("&lt;", "<").replaceAll("&gt;", ">").replaceAll("&hellip;","...");
	replacedString =  replacedString.replaceAll("-"," ").replaceAll(".html","").replaceAll("&#39;","'").replaceAll("39;","'").replaceAll("mosimage", "").replaceAll("mospagebreak", "").replaceAll("{mosimage}", "").replaceAll("{mospagebreak}", "").replaceAll("[{}]", "");
	return replacedString;
}

public int generateXmlFile(String xmlData, String fileName, String xmlPath) {
	
	int fileGenerated = 0;
	try {
		String xmllocalpath = "";
		fileName = fileName.toLowerCase().replaceAll("%20", "").replaceAll(":", "");
		File sourceFile = new File(fileName+".xml");
		if (sourceFile.exists()) {
			File file = (new File(fileName));
			xmllocalpath = xmlPath + fileName;// reviews.xml";
			FileOutputStream out = new FileOutputStream(xmllocalpath);
			out.write(xmlData.getBytes());
			out.close();
		} else {
			xmllocalpath = xmlPath + fileName + FILE_EXT;
			FileOutputStream fos1 = new FileOutputStream(xmllocalpath);
			fos1.write(xmlData.getBytes());
			fos1.flush();
			fos1.close();
		}
		fileGenerated=1;		
	} catch (IOException ioe) {
	ioe.printStackTrace();
		System.out.println("XML generation error for <"+fileName+"> under  <"+xmlPath+" location.");
	}
	return fileGenerated;
}


	
	public  ArrayList CoverStory()throws SQLException
	{
	
		Connection conn = null;
		Statement stmtcover = null;
		ResultSet rscover=null;
		StoryDTO cover;
		ArrayList cov = new ArrayList();
		try
		{
			DbConnection adminConn = DbConnection.getInstance("indiatoday");
			conn = adminConn.getConnection("indiatoday");
			String sql = "SELECT c.id as contentId FROM jos_article_section ars,jos_content c, jos_sections js where ars.section_id='105' and ars.article_id=c.id and ars.section_id=js.id and js.published=1 and c.published=1 order by ars.ordering desc limit 4";
				
			stmtcover = conn.createStatement();
			rscover = stmtcover.executeQuery(sql);
			while (rscover.next()){
				cover = new StoryDTO();				
				cover.setId(rscover.getInt("contentId"));				
				cov.add(cover);				
			}
			
			
		}
		catch (Exception e){
			System.out.println("Exception is: " + e);
		}finally{
			if(stmtcover!=null)
				stmtcover.close();
			if(rscover!=null)
				rscover.close();
			if(conn!=null)
				conn.close();
		}
	
 return cov;
	}

%>