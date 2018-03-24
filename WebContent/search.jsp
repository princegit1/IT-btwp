<%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %>
<%@page language="java" import="java.net.*, java.util.ArrayList, com.itgd.utils.*, com.itgd.dto.ContentListDTO,java.sql.*"%>
<%@include file="global_include.jsp"%>
<%
String wapBaseUrl = request.getRequestURL().substring(0,request.getRequestURL().indexOf(request.getServletPath()))+"/";
//System.out.println("wapBaseUrl->"+wapBaseUrl);
//System.out.println("SITE_URL->"+SITE_URL);
String searchingText = ""; 
int currentPageNumber = 1;
if(request.getAttribute("currentPageNumber")!=null) 
	currentPageNumber = (Integer)request.getAttribute("currentPageNumber");
String contentType="text";
int pagesCount = 5;
String searchFileName = "search.jsp";
String searchURL = searchFileName;
if(request.getParameter("searchword")!=null)
	searchingText = request.getParameter("searchword")
.replaceAll("\\<.*?>","").replaceAll("\\:","\\\\:").replaceAll("\\@","").replaceAll("\"","\\\\\"").replaceAll("http://","");
if(request.getParameter("contenttype")!=null)
	contentType = request.getParameter("contenttype");
if(request.getParameter("cpage")!=null)
	currentPageNumber = Integer.parseInt(request.getParameter("cpage"));
searchURL = searchURL + "?searchword=" + searchingText.trim();
searchURL = searchURL + "&contenttype=" + contentType.trim();
%>
<cache:cache key="<%=SITE_URL+"search/"+searchingText+"/"+contentType+"/"+currentPageNumber%>" scope="application" time="0" >
<%
int ctrStart = 0;
int ctrToDisplay=10;
int ctrToFetch=ctrStart+ctrToDisplay;
String removeText="the#it#and#or#is#are#that#this#in#on#of#they#to#a#an#there#which#from#be#how#who";

ArrayList sAL =null;

sAL = searchResult(searchingText, ctrToFetch, currentPageNumber, contentType, removeText);

String totalcount = searchResult1(searchingText, ctrToFetch, contentType, removeText);
int totalPageCount = Integer.parseInt(totalcount);
System.out.println("totalcount==>>>"+totalcount);
//out.println("totalcount==>>>"+totalcount);
if(sAL!=null && sAL.size()>0){
	for (int ctr=ctrStart; ctr < sAL.size(); ctr++) {
		ContentListDTO sDTO = (ContentListDTO) sAL.get(ctr);
		if (ctr == ctrStart) {

 %>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<%//@include file="googleanalytics_top.jsp"%>
<html><head>
<%@include file="googleanalytics.jsp"%> 
<base href="<%=SITE_URL%>"/>
<META http-equiv="Content-Type" content="text/html;charset=iso-8859-1">
<title>Business Today - Breaking News on Your Mobile Phone</title>
<meta name="description" content="India Today Mobile Search" />
<meta name="keywords" content="India Today Mobile Search" />
<!-- Css optimization begin -->
<script> var cb = function() {var l = document.createElement('link'); l.rel = 'stylesheet dns-prefetch';   
    l.href = '<%=MEDIA_CSS+"mobile-mini.css"%>'; 
    var h = document.getElementsByTagName('head')[0]; h.parentNode.insertBefore(l, h); };
    var raf = requestAnimationFrame || mozRequestAnimationFrame ||
              webkitRequestAnimationFrame || msRequestAnimationFrame;
    if (raf) raf(cb);
    else window.addEventListener('load', cb);
</script> 
<!-- Css optimization end --> 
<meta name="viewport" id="viewport" content="width=device-width; initial-scale=1.0; minimum-scale=1.0; maximum-scale=1.0; user-scalable=no;"></meta>
<style>
.pagination {margin: 8px auto 15px;width:300px;text-align:center; }
.pagination ul li{list-style:none; display:inline; padding:0; margin:2px; background:none;font-family:Arial, Helvetica, sans-serif;}
.pagination ul li a{ text-decoration:none; color:#FFF; padding:4px; text-align:center; background:#000}
.prevnext { padding:4px; color:#fff; background:#000; text-align:center;}
.pagination ul li a:hover{ text-decoration:none; color:#FFF; padding:4px; text-align:center; background:#c0110e}
.pagination ul li a.currentpage{text-decoration:none; color:#FFF; padding:4px; text-align:center; background:#c0110e}

</style>  
<%@include file="zedo-adCode-ros.jsp"%>
</head><body> 
<%@include file="zedo-adCode-ros-logo.jsp"%>
<%@ include file="topnav.jsp"%>
<div align="center" style="margin-top:5px"><%@include file="top_add.jsp" %> </div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr><td height="8"></td></tr>
<tr><td class="breadcrumb">
	<a href="<%=SITE_URL%>">Home</a> &raquo; Search
</td></tr>

<tr><td bgcolor="#F5F5F5"><table cellpadding="0" cellspacing="0" width="100%"><tr><td width="50%" class="<%if(contentType.equals("photo")){out.print("de");}%>active" align="center"><a href="search.jsp?searchword=<%=searchingText%>&contenttype=text">ARTICLE</a></td><td width="50%" class="<%if(contentType.equals("text")){out.print("de");}%>active" align="center"><a href="search.jsp?searchword=<%=searchingText%>&contenttype=photo">PHOTO</a></td></tr></table></td></tr>

<%}%>

<%if(sDTO.getContentType().equals("text")) {%>
	<tr><td  bgcolor="#FFFFFF" style="border-bottom:1px solid #DBDBDB;"><div style="margin-left:5px; line-height:20px;">
	<%if(sDTO.getImage().trim().length() > 0) {%>
		<a href="<%=SITE_BASEPATH+CommonFunctions.storyURL(sDTO.getSefTitle(),1, sDTO.getId())%>"><img src="<%=STORY_IMAGE_BASEPATH+sDTO.getImage().trim()%>" width="80" height="80" align="left" style="margin:0 8px 0 2px; border:0;"/></a>
	<% } else {%>
		<a href="<%=SITE_BASEPATH+CommonFunctions.storyURL(sDTO.getSefTitle(),1, sDTO.getId())%>"><img src="<%=NO_IMG_88x66%>" width="80" height="80" align="left" style="margin:0 8px 0 2px; border:0;"/></a>
	<% }%>
	<a href="<%=SITE_BASEPATH+CommonFunctions.storyURL(sDTO.getSefTitle(),1, sDTO.getId())%>"><span class="story-title"><%=sDTO.getTitle()%></span></a>
	</div></td></tr>
<%} else if(sDTO.getContentType().equals("photo")) {%>
	<tr><td  bgcolor="#FFFFFF" style="border-bottom:1px solid #DBDBDB;">
	<%if(sDTO.getImage().trim().length() > 0) {%>
		<div class="strimgrepeat" style="margin-left:5px;"><a href="<%=SITE_BASEPATH+CommonFunctions.galleryURL(sDTO.getSefTitle(),1, sDTO.getId())%>"><img src="<%=PHOTO_BASEPATH+sDTO.getImage().trim()%>" width="80" height="66" align="left" style="margin:0 8px 0 2px; border:0;"/><span class="strphotoicon"></span></a></div>
	<% } else {%>
		<div class="strimgrepeat" style="margin-left:5px;"><a href="<%=SITE_BASEPATH+CommonFunctions.galleryURL(sDTO.getSefTitle(),1, sDTO.getId())%>"><img src="<%=NO_IMG_88x66%>" width="80" height="66" align="left" style="margin:0 8px 0 2px; border:0;"/><span class="strphotoicon"></span></a></div>
	<% }%>
	<div class="story-title"><a href="<%=SITE_BASEPATH+CommonFunctions.galleryURL(sDTO.getSefTitle(),1, sDTO.getId())%>"><span class="story-title"><%=sDTO.getTitle()%></span></a>
	</div></td></tr>

<%}
}	
}%>			
</table><div style="height:12px;"></div>

<div class="pagination"><ul>
<%
int lastPageNo = totalPageCount / ctrToDisplay;
int afterLastPageCount = totalPageCount % ctrToDisplay;
//out.println("lastPageNo"+lastPageNo);  
//out.println("afterLastPageCount"+afterLastPageCount);
if(afterLastPageCount>0) {
	lastPageNo+=1;
}
	int nextPageNo = currentPageNumber + 1;
	//out.println("nextPageNo"+nextPageNo);
	int previousPageNo = currentPageNumber-1;
	//out.println("previousPageNo"+previousPageNo);
	if (currentPageNumber > 1)
		out.println("<li><a href=\'"+ Constant.SITE_URL + searchURL+ "&page=1\'>First</a></li>");
	int dispPageCountFrom = (((currentPageNumber % pagesCount) !=0 ? (currentPageNumber / pagesCount) : (currentPageNumber / pagesCount)-1) * pagesCount)+1;
	if(currentPageNumber > pagesCount)
	//out.println("Constant.SITE_URL::"+Constant.SITE_URL);
		out.println("<li><a href='"+ Constant.SITE_URL + searchURL+ "&cpage="+ previousPageNo+ "\'>Prev</a></li>"); 
	
	if(lastPageNo>1) {			
		for(int pageNo=dispPageCountFrom; pageNo<dispPageCountFrom+pagesCount; pageNo++) {
			if(pageNo==currentPageNumber)
				out.println("<li><a class='currentpage' href='"+ searchURL+ "&cpage="+ pageNo+ "'>"+ pageNo + "</a></li>");
			else if (pageNo<=lastPageNo && pageNo!=currentPageNumber)
				out.println("<li><a  href='"+ Constant.SITE_URL + searchURL + "&cpage=" + pageNo + "'>" + pageNo + "</a></li>"); 
		}
	}
	if(nextPageNo < lastPageNo)
		out.println("<li><a href='" + Constant.SITE_URL + searchURL + "&cpage=" + nextPageNo + "\'>Next</a></li>");
	if (currentPageNumber < lastPageNo)
		out.println("<li><a href='" + Constant.SITE_URL + searchURL + "&cpage=" + lastPageNo + "\'>Last</li>");
%>
	</ul>
	  </div>
<%	if (totalPageCount == 0) {	%><h3>Total 0 results found. Search for [<%=searchingText%>]</h3><%	}	%>
 <%@ include file="othercategories.html"%> <div style="height:12px;"></div>  <%@include file="hotzone.html"%>  <%@include file="ringtones.html"%>  <%@ include file="bottomnav.html"%>

<!-- afp footer code starts here added on 10032016 Re: Lenovo Yoga SPARK campaign-->
<script type="text/javascript">	var adgf_p1="28";	var adgf_p2="0";	var adgf_p3="0";	var adgf_p4="";	var adgf_p5="";	var adgFtSc=document.createElement("script");	adgFtSc.id="adg_pixel_footer_script";	document.body.appendChild(adgFtSc);	adgFtSc.async=true;	var adgScParam="p1="+adgf_p1+"&p2="+adgf_p2+"&p3="+adgf_p3+"&p4="+adgf_p4+"&p5="+adgf_p5;	adgFtSc.src="http://adgebra.co.in/afpf/afpf.js?"+adgScParam;</script>
<noscript>	<iframe id='adg_footer_pixel_script' src="http://adgebra.co.in/afpf/afpf?p1=28&amp;p2=0&amp;p3=1&amp;p4=&amp;p5=" width="0" height="0" frameBorder="0" scrolling="no" marginheight="0" marginwidth="0">
</iframe>
</noscript> <!-- afp footer code ends here -->	
 <!-- code to optimize js begin-->
<script type="text/javascript">
function downloadJSAtOnload() {
var element = document.createElement("script");
element.src = "<%=MEDIA_JS+"jquery-1.4.2.min.js"%>";
document.body.appendChild(element);
}
if (window.addEventListener)
window.addEventListener("load", downloadJSAtOnload, false);
else if (window.attachEvent)
window.attachEvent("onload", downloadJSAtOnload);
else window.onload = downloadJSAtOnload;
</script>
<!-- code to optimize js end-->

</body>
</html>  
</cache:cache>

<%!
	    private  String searchResult1(String searchedTxt, int searchlimit, String contenttype, String contentToRemove) throws Exception {
        Connection conn = null;
        PreparedStatement selectStmt = null;
        ResultSet rs = null;
        String strText = "'%" + searchedTxt + "%'";
        int intLimit = searchlimit;
        StringBuilder sb = null;
        sb = new StringBuilder();
        String count ="";
        try {
        	
        	
            DbConnection dbconn = null;
            dbconn = DbConnection.getInstance("indiatoday");
            conn = dbconn.getConnection("indiatoday");
            String sql = "";
            String finalStr = "";
            String[] searchTextArray = null;
            String[] searchTextArrayFinal = null;
            searchTextArray = searchedTxt.contains(" ") ? searchedTxt.split(" ") : new String[]{searchedTxt};
            int i = 0;
            while (i < searchTextArray.length) {
                String[] textRemoved = contentToRemove.split("\\#");
                int j = 0;
                while (j < textRemoved.length) {
                    if (searchTextArray[i].toLowerCase().matches(textRemoved[j])) {
                        searchTextArray[i] = "";
                    }
                    ++j;
                }
                if (searchTextArray[i] != "") {
                    finalStr = String.valueOf(finalStr) + searchTextArray[i] + " ";
                }
                ++i;
            }
            finalStr = finalStr.trim();
            if (!contenttype.equals("photo")) {
                if (finalStr.contains(" ")) {
                    sb.append("(");
                    String[] tokens1 = finalStr.split(" ");
                    int k = 0;
                    while (k < tokens1.length) {
                        finalStr = tokens1[k];
                        sb.append("(c.metakey like '%" + finalStr + "%' or c.title_alias like  '%" + finalStr + "%' or c.metadesc like '%" + finalStr + "%' or c.byline like '%" + finalStr + "%')");
                        if (k != tokens1.length - 1) {
                            sb.append(" and ");
                        }
                        ++k;
                    }
                    sb.append(")");
                } else {
                    sb.append("(c.metakey like '%" + finalStr + "%' or c.title_alias like  '%" + finalStr + "%' or c.metadesc like '%" + finalStr + "%' or c.byline like '%" + finalStr + "%')");
                }
            } else if (finalStr.contains(" ")) {
                sb.append("(");
                String[] tokens1 = finalStr.split(" ");
                int k = 0;
                System.out.println("726... CommonFunctions.java:: sb =======>> "+sb);
                while (k < tokens1.length) {
                    finalStr = tokens1[k];
                    sb.append("c.Gallery_name like '%" + finalStr + "%' or c.metakey like  '%" + finalStr + "%' or c.metadesc like '%" + finalStr + "%' ");
                    if (k != tokens1.length - 1) {
                        sb.append(" and ");
                    }
                    ++k;
                }
                sb.append(")");
                System.out.println("736... CommonFunctions.java:: sb =======>> "+sb);
            } else {
            	System.out.println("738... CommonFunctions.java:: sb =======>> "+sb);
                sb.append("(c.Gallery_name like '%" + finalStr + "%' or c.metakey like  '%" + finalStr + "%' or c.metadesc like '%" + finalStr + "%' )");
            }
            sql = contenttype.equals("photo") ? "select count(DISTINCT c.id) as totalcount from jos_gallerynames c, jos_sections a where " + sb.toString() + " and c.section_id=a.id and c.published=1 and c.Gallery_name not like '%href=%' " : "select count(DISTINCT c.id) as totalcount from jos_content c, jos_article_section a where c.content_type=0 and " + sb.toString() + " and c.id=a.article_id and c.published=1 and c.title not like '%href=%' ";
            System.out.println("CommonFunction - Searched Query->" + sql);
            selectStmt = conn.prepareStatement(sql);
            //selectStmt.setInt(1, intLimit);
            rs = selectStmt.executeQuery();
            while (rs.next()) {
            	          	
            	count = rs.getString("totalcount");
            	System.out.println("totalcount"+count);
                
            }
            System.out.println("totalcount===>>>"+count);
        } catch (SQLException sqls) {
            System.out.println("IT WAP Search SQLException -> " + sqls);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (selectStmt != null) {
                selectStmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return count;
    }



public static ArrayList<ContentListDTO> searchResult(String searchedTxt, int searchlimit, int currentPageNumber, String contenttype, String contentToRemove) throws Exception {
   System.out.println("inside method");
	ArrayList<ContentListDTO> contentList;
    Connection conn = null;
    PreparedStatement selectStmt = null;
    ResultSet rs = null;
    contentList = new ArrayList<ContentListDTO>();
    String strText = "'%" + searchedTxt + "%'";
    int intLimit = 0;
    int vEndLimit = 0;
    StringBuilder sb = null;
    sb = new StringBuilder();
    try {
    	System.out.println("currentPageNumber====>>>"+currentPageNumber);
    	if(currentPageNumber > 0) {
    		intLimit = (currentPageNumber-1)*searchlimit;
		}
    	
    	vEndLimit = searchlimit;
        DbConnection dbconn = null;
        dbconn = DbConnection.getInstance("indiatoday");
        conn = dbconn.getConnection("indiatoday");
        String sql = "";
        String finalStr = "";
        String[] searchTextArray = null;
        String[] searchTextArrayFinal = null;
        searchTextArray = searchedTxt.contains(" ") ? searchedTxt.split(" ") : new String[]{searchedTxt};
        int i = 0;
        while (i < searchTextArray.length) {
            String[] textRemoved = contentToRemove.split("\\#");
            int j = 0;
            while (j < textRemoved.length) {
                if (searchTextArray[i].toLowerCase().matches(textRemoved[j])) {
                    searchTextArray[i] = "";
                }
                ++j;
            }
            if (searchTextArray[i] != "") {
                finalStr = String.valueOf(finalStr) + searchTextArray[i] + " ";
            }
            ++i;
        }
        finalStr = finalStr.trim();
        if (!contenttype.equals("photo")) {
            if (finalStr.contains(" ")) {
                sb.append("(");
                String[] tokens1 = finalStr.split(" ");
                int k = 0;
                while (k < tokens1.length) {
                    finalStr = tokens1[k];
                    sb.append("(c.metakey like '%" + finalStr + "%' or c.title_alias like  '%" + finalStr + "%' or c.metadesc like '%" + finalStr + "%' or c.byline like '%" + finalStr + "%')");
                    if (k != tokens1.length - 1) {
                        sb.append(" and ");
                    }
                    ++k;
                }
                sb.append(")");
            } else {
                sb.append("(c.metakey like '%" + finalStr + "%' or c.title_alias like  '%" + finalStr + "%' or c.metadesc like '%" + finalStr + "%' or c.byline like '%" + finalStr + "%')");
            }
        } else if (finalStr.contains(" ")) {
            sb.append("(");
            String[] tokens1 = finalStr.split(" ");
            int k = 0;
            //System.out.println("726... CommonFunctions.java:: sb =======>> "+sb);
            while (k < tokens1.length) {
                finalStr = tokens1[k];
                sb.append("c.Gallery_name like '%" + finalStr + "%' or c.metakey like  '%" + finalStr + "%' or c.metadesc like '%" + finalStr + "%' ");
                if (k != tokens1.length - 1) {
                    sb.append(" and ");
                }
                ++k;
            }
            sb.append(")");
            //System.out.println("736... CommonFunctions.java:: sb =======>> "+sb);
        } else {
        	//System.out.println("738... CommonFunctions.java:: sb =======>> "+sb);
            sb.append("(c.Gallery_name like '%" + finalStr + "%' or c.metakey like  '%" + finalStr + "%' or c.metadesc like '%" + finalStr + "%' )");
        }
        sql = contenttype.equals("video") ? "select c.id, c.title, c.sef_url, c.mobile_image, c.kicker_image_alt_text from jos_content c, jos_article_section a where a.section_id=161 and c.content_type=0 and " + sb.toString() + " and c.id=a.article_id and c.published=1 group by c.id order by c.id desc limit " +intLimit + ", " +vEndLimit : (contenttype.equals("photo") ? "select c.id, c.Gallery_name as title, c.Gallery_name as kicker_image_alt_text, c.sef_url, c.small_image as mobile_image from jos_gallerynames c, jos_sections a where " + sb.toString() + " and c.section_id=a.id and c.published=1 and c.Gallery_name not like '%href=%' group by c.id order by c.id desc limit " +intLimit + ", " +vEndLimit : "select c.id, c.title, c.sef_url, c.mobile_image, c.kicker_image_alt_text from jos_content c, jos_article_section a where c.content_type=0 and " + sb.toString() + " and c.id=a.article_id and c.published=1 and c.title not like '%href=%' group by c.id order by c.id desc limit " +intLimit + ", " +vEndLimit);
        System.out.println("modified query " + sql);
        selectStmt = conn.prepareStatement(sql);
        //selectStmt.setInt(1, intLimit);
        rs = selectStmt.executeQuery();
        while (rs.next()) {
            ContentListDTO searchdto = new ContentListDTO();
            searchdto.setId(rs.getInt("id"));
            searchdto.setTitle(rs.getString("title"));
            searchdto.setSefTitle(rs.getString("sef_url"));
            searchdto.setImage(rs.getString("mobile_image") == null ? "" : rs.getString("mobile_image"));
            searchdto.setImageAltText(rs.getString("kicker_image_alt_text") == null ? "" : rs.getString("kicker_image_alt_text"));
            searchdto.setContentType(contenttype);
            contentList.add(searchdto);
        }
    } catch (SQLException sqls) {
        System.out.println("modified method exception " + sqls);
    } finally {
        if (rs != null) {
            rs.close();
        }
        if (selectStmt != null) {
            selectStmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
    return contentList;
}






%>