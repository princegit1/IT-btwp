<%@ taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %><compress:html removeIntertagSpaces="true">
<%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %>
<%@page language="java" import="java.net.*, java.util.ArrayList, com.itgd.utils.*, com.itgd.dto.GalleryDTO, com.itgd.dto.ContentListDTO, com.itgd.helper.GalleryHelper, java.sql.Connection, java.sql.ResultSet, java.sql.PreparedStatement"%>
<%@include file="../global_include.jsp"%><%
String wapBaseUrl = request.getRequestURL().substring(0,request.getRequestURL().indexOf(request.getServletPath()))+"/";
int galleryId = 0;
int currentPhotoNo = 1;
if(request.getAttribute("galleryId")!=null)
galleryId = (Integer)request.getAttribute("galleryId");
else
galleryId=262;
if(request.getAttribute("currentPhotoNo")!=null)
	currentPhotoNo = (Integer)request.getAttribute("currentPhotoNo");
else
	currentPhotoNo=2;
%><cache:cache key="<%=SITE_URL+"gallery/"+currentPhotoNo+"/"+galleryId%>" scope="application " time="901" refresh="t" ><%
int totalPhotoCount = 0;
String galleryTitle = "";
String galleryMetaTitle = "";
String galleryMetaKeywords = "";
String galleryMetaDescription = "" ;
String gallerySefTitle = "";      
GalleryDTO galleryDTO = null;
int backNo = 1;
int nextNo = 1;
int categoryId=0;
ArrayList photoDetails = GalleryHelper.photoDetail(galleryId);
if (photoDetails != null && photoDetails.size() > 0) {
for (int pCtr = 0; pCtr < photoDetails.size(); pCtr++) {
galleryDTO = (GalleryDTO) photoDetails.get(pCtr);
categoryId=   galleryDTO.getCategoryId();
if (pCtr == 0){
galleryMetaTitle=galleryDTO.getGalleryTitle();
galleryMetaKeywords = galleryDTO.getMetaKeyword();
if(galleryDTO.getPhotoMetaKeyword().trim().length() > 0)
galleryMetaKeywords = galleryMetaKeywords + ", "+ galleryDTO.getPhotoMetaKeyword();
galleryMetaDescription = galleryDTO.getMetaDescription();
totalPhotoCount = galleryDTO.getPhotoCount();
%>
<!doctype html>
<html amp>
<head>
<script async custom-element="amp-analytics" src="https://cdn.ampproject.org/v0/amp-analytics-0.1.js"></script>
<meta charset="utf-8">
<title><%=galleryDTO.getGalleryTitle()%></title>
<link itemprop="mainEntityOfPage" rel="canonical" href="http://www.businesstoday.in<%=request.getAttribute("javax.servlet.forward.request_uri").toString().replace("/lite", "").replace("/gallery/","/photoplay/")%>" />
<meta name="viewport" content="width=device-width,minimum-scale=1,initial-scale=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<script type="application/ld+json">
{
  "@context": "http://schema.org",
  "@type": "ImageObject",
  "author": "Bussiness Today",
  "contentLocation": "India",
  "contentUrl": "<%=PHOTO_BASEPATH %><%=galleryDTO.getPhotoTitle()%>",
  "datePublished": "<%=galleryDTO.getCreatedDate()%>",
  "description": "<%= galleryDTO.getGalleryTitle()%>",
  "name": "<%= galleryDTO.getGalleryTitle()%>"
}
</script>
<style amp-boilerplate>body{-webkit-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-moz-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-ms-animation:-amp-start 8s steps(1,end) 0s 1 normal both;animation:-amp-start 8s steps(1,end) 0s 1 normal both}@-webkit-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-moz-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-ms-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-o-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}</style><noscript><style amp-boilerplate>body{-webkit-animation:none;-moz-animation:none;-ms-animation:none;animation:none}</style></noscript>

<style amp-custom> *{ margin:0; padding:0;} body{ font-family:roboto; font-size:100%;}header.masthead{ padding:10px 0; border-bottom:2px solid #EAEAEA;} header.masthead i.icon-logo{ background:url(http://media2.intoday.in/businesstoday/wap/title.gif) no-repeat center center; display: block; height: 27px;text-indent: -9999px;} .maincontent{ padding:10px 20px;}.maincontent p{ color:#333; margin-bottom:18px; font:400 17px/21px roboto;} .maincontent p a{ text-decoration:none; color:#3F84FD;}.maincontent p a b{ font-weight:normal;}.maincontent h1{ font:bold 26px/30px roboto; color:#000; margin-bottom:10px;} .maincontent p.subtext{ font:400 16px/20px roboto; margin-bottom:10px;color: #666;} .maincontent .author-info{ margin-bottom:10px; overflow:hidden;} .maincontent .author-info .name{ font:400 14px/15px roboto; color:#9D9D9D; margin-bottom:5px; width:auto; float:left;}	.maincontent .author-info .datetime{ font:400 14px/15px roboto; color:#9D9D9D; width:auto; float:left;} .maincontent figure.mosimg{ margin:0 -20px 20px;} .maincontent .quotes{ border-left:3px solid #CA0000; padding:0 0 0 15px; margin:20px; font:400 16px/21px roboto; color:#424242;} .maincontent .highlight-section{ margin:30px 0;}.maincontent ul{ margin:10px 0 10px 20px;} .maincontent ul li{ padding-bottom:10px; color: #333; font: 400 17px/21px roboto;} .maincontent .highlight-section h3{ font:bold 22px/25px roboto; margin-bottom:10px;}.maincontent .highlight-section ol{  margin: 0;padding: 0; list-style-type: none; counter-reset: item;} .highlight-section ol li{color:#D30F11; font-size:30px; line-height:0; font-weight:bold; counter-increment: item; display: table; padding:5px 0;} .highlight-section ol li:before{content: counters(item, "") ""; display: table-cell; padding-right:15px; position: relative;top: 10px;}.maincontent .highlight-section ol li span{ color:#000; font:400 17px/22px roboto;}.ad-inner{ background:#EFEFEF; text-align:center; padding:5px 0; margin:0 -10px;} .ad-inner h6{ font-size:12px; color:#989898; font-weight:500;}.other-news{ padding:30px 10px;} .other-news h2{ color:#FE1322; font:bold 24px/25px roboto; margin-bottom:15px;}.other-news .othernews-row{ padding:15px 0; border-bottom:1px solid #D9D9D9; overflow:hidden;} .other-news .othernews-row .newstext{ width:70%; float:left; font:500 16px/21px roboto; color:#111;}.other-news .othernews-row .newstext .subtitile{ font:400 13px/18px roboto; color:#666;padding-top: 5px; display:none;}.other-news .othernews-row .newstext a{font:bold 16px/21px roboto; color:#000; text-decoration:none;}.other-news .othernews-row .newsimage{ width:25%; float:right;} amp-video{ margin:15px -10px;}footer.footersection{padding:10px;} footer nav.footernav{border-bottom:1px solid #d8d8d8; border-top:1px solid #d8d8d8; text-align:left; padding:6px 0;}footer nav.footernav ul li{display: inline-block; list-style:none; font-size:14px; color:#666;}footer nav.footernav ul li a{color: #1a7dcc; font-size: 14px; text-decoration: none; padding-right:20px;} footer.footersection .copyright{font-size:10px; text-align:left; color:#666;line-height: 16px;padding-top: 10px;} a.gototop{ color: #111111;float: right; font-size: 13px;position: relative;text-decoration: none;top: -17px; width: auto;}.social-icons .socalsprit{background-image:url(http://media2.intoday.in/aajtak/amp/socialicon-spritenew2.png);background-repeat: no-repeat;background-size: 70% auto;} .social-icons{ width:110px; margin:0 auto;} .social-icons a.facebooklike{background-position: center 0;display: inline-block;height:47px;text-indent: -99999px;width: 50px;} .social-icons a.twitterfollow{background-position:center -45px;display: inline-block;height:47px;text-indent: -99999px;width: 50px;}.story-content .caption{font-size:15px; color:#999; line-height:23px; display:block;}.newstext .datetime {font: 400 13px/17px roboto;color: #666; padding: 7px 0 5px;} @media (min-width:479px){.other-news .othernews-row .newstext .subtitile{ display:block;}} .sprite{ background-image:url(http://media2.intoday.in/indiatoday/amp-image/amp-socialicon.gif);}.share-icon{ margin:20px -20px 5px; padding:0;} .share-icon ul{ list-style:none; margin:0; padding:0;} .share-icon ul li{ width:31.8%; margin:0; display:inline-block; text-align:center;}.share-icon ul li:nth-child(3){width:36%;} .share-icon ul li i{ display:inline-block; background-repeat:no-repeat;}.share-icon ul li i.facebook{ background-position:0 0; width:83px; height:34px;}.share-icon ul li i.twitter{ background-position:-89px 0; width:83px; height:34px;}.share-icon ul li i.whtsapp{background-position:-177px 0; width:100px; height:34px;} .amp-ad{ background:#eee; text-align:center; padding:5px 0; margin:5px 0 0;} .amp-ad-inner{ background:#eee; text-align:center; padding:5px 0; margin:0 -20px;} .lightbox { width:100%; height:100%; background:#fff;} .lightbox .menulist{ height: 100%;
overflow-x: hidden;overflow-y: scroll; padding-top:40px;} .lightbox .menulist ul li{width: 49%; float: left; padding: 0px 0 0px 10%; box-sizing: border-box; list-style: none;} .lightbox .menulist ul li a{color: #222; font: 400 18px/18px roboto; padding: 8px 0; text-decoration:none; display:block;}.openmenu{background:url(http://media2.intoday.in/aajtak/amp/menu_icon.png) no-repeat 0 0; border:0; width:40px; height:40px; margin-left: 10px; position: absolute; top: 0px;} .closemenu{ background:url(http://media2.intoday.in/aajtak/amp/closemenu.gif) no-repeat 0 0; width:33px; height:37px; position:absolute; border:0;right: 10px; top: 10px;} figure figcaption {background: rgba(0, 0, 0, 0.5);bottom: 0;color: #ffffff;font: 500 14px/19px roboto;padding: 10px;position: absolute;}
</style>
<script async custom-element="amp-carousel" src="https://cdn.ampproject.org/v0/amp-carousel-0.1.js"></script>
<script async custom-element="amp-twitter" src="https://cdn.ampproject.org/v0/amp-twitter-0.1.js"></script>
<script async custom-element="amp-instagram" src="https://cdn.ampproject.org/v0/amp-instagram-0.1.js"></script>
<script async custom-element="amp-facebook" src="https://cdn.ampproject.org/v0/amp-facebook-0.1.js"></script>
<script async custom-element="amp-lightbox" src="https://cdn.ampproject.org/v0/amp-lightbox-0.1.js"></script>
<script async src="https://cdn.ampproject.org/v0.js"></script>
	
</head>
<body>
    <amp-lightbox id="businesstoday-menu" layout="nodisplay" class="-amp-element -amp-layout-nodisplay -amp-layout" >
        
    <div class="-amp-fill-content"><div class="lightbox">
            <button on="tap:businesstoday-menu.close" class="closemenu"></button>
            <div class="menulist">
                <ul>
					<li><a href="<%= SITE_URL %>" title="Home">Home</a></li>
                    <li><a href="<%= SITE_URL %>section/99/1/big-story.html" title="Big Story">Big Story</a></li>
                    <li><a href="<%= SITE_URL %>section/105/1/latest-headlines.html" title="Top News">Top News</a></li>
                    <li><a href="<%= SITE_URL %>section/111/1/markets.html" title="Markets">Markets</a></li>
                    <li><a href="<%= SITE_URL %>section/110/1/technology.html" title="Technology">Technology</a></li>
                    <li><a href="<%= SITE_URL %>section/101/1/sectors.html" title="Industry">Industry</a></li>
                    <li><a href="<%= SITE_URL %>section/103/1/management.html" title="Management">Management</a></li>
                    <li><a href="<%= SITE_URL %>section/102/1/opinion.html" title="Opinion">Opinion</a></li>
                    <li><a href="<%= SITE_URL %>section/125/1/from-the-mag.html" title="From The Mag">From The Mag</a></li>                                        
                </ul> 
            </div>
        </div></div></amp-lightbox>
    <header class="masthead"><button on="tap:businesstoday-menu" class="openmenu"></button><a target="_blank" href="http://media2.intoday.in/wap/btwap/images/logo.png"><i class="icon-logo">Bussiness Today</i></a></header>
    <div class="amp-ad">
    <h6>SPONSERED ADS</h6>
    <amp-ad width=320 height=50  type="adsense" data-ad-client="/1007232/AMP_BT_Photogallery_320x50_Top" data-ad-slot="/1007232/AMP_BT_Photogallery_320x50_Top"></amp-ad>
  </div>
     <div class="maincontent" role="main">
	<h1><%=galleryDTO.getGalleryTitle()%></h1>
	 <amp-carousel width="650" height="987" layout="responsive" type="slides" controls>
 <% }%>
    <figure>
    <amp-img width=650 height=425 src="<%=PHOTO_BASEPATH%><%=galleryDTO.getPhotoTitle()%>" layout=fill></amp-img>
    <figcaption><%=galleryDTO.getPhotoCaption()%></figcaption>
    </figure> 
 <%}}%>
     </amp-carousel>
  
    
  </div>
<jsp:include page="LatestGalleryLite.jsp">
<jsp:param name="galleryId" value="<%=galleryId%>"/>
<jsp:param name="categoryId" value="<%=categoryId%>"/>
</jsp:include>  
 <div class="amp-ad">
    <amp-ad width=320 height=50  type="adsense" data-ad-client="/1007232/AMP_BT_Photogallery_320x50_Bottom" data-ad-slot="/1007232/AMP_BT_Photogallery_320x50_Bottom"></amp-ad>
  </div>
<amp-analytics type="comscore">
  	<script type="application/json"> {  "vars": {   "c2": "8549097"  }	} </script>
  </amp-analytics>
  <amp-analytics type="googleanalytics" id="analytics2">
  	<script type="application/json">
		{	"vars": { "account": "UA-34080153-13" },
  			"triggers": { "defaultPageview": { "on": "visible", "request": "pageview", "vars": { "title": "<%=galleryDTO.getGalleryTitle()%>" } } }
		}
	</script>
  </amp-analytics>	
</body>
</html>
</cache:cache></compress:html>
<%!
public static ArrayList photoDetail(int galleryId) throws Exception {
	ArrayList photoList =new ArrayList();
	Connection connection = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt1 = null;
	ResultSet rs1 = null;

	GalleryDTO photoDetails = null;
	int galleryPhotoCount = 0;
    int primaryCategoryLength = 0;
    String primaryCategoryId[] = null;
	String primaryCategory="1#3";

	try {
		DbConnection connect = null;
		DbConnection dbConn = DbConnection.getInstance("indiatoday");
		connection  = dbConn.getConnection("indiatoday");
		String sql = "";

		sql = "SELECT g.id,g.Gallery_name,g.metakey,g.metadesc,p.photo_name,p.image_metakey, p.photo_title,s.name as sectionname,s.sef_url,g.section_id, " +
	      	  "DATE_FORMAT(g.created,'%M %e, %Y') as created, g.sef_url as gallery_sefurl,g.Gallery_caption,g.metakey as gallerykeywords,g.metadesc as gallerydesc, " +
	      	  "p.photo_caption,p.image_alt_text,p.photo_name_width, p.photo_name_height FROM jos_gallerynames g,jos_photogallery p,jos_sections as s " +
	      	  "WHERE g.id = ? AND g.published = 1 AND g.section_id = s.id AND s.published = 1 AND g.id = p.gallery_id AND p.enable = 1 AND s.section_type = 'photo' AND s.magazineid = '1' " +
	      	  "ORDER BY p.ordering DESC ";
		pstmt = connection.prepareStatement(sql);
        pstmt.setInt(1, galleryId);
		rs = pstmt.executeQuery();
		rs.last();
		galleryPhotoCount = rs.getRow();
		rs.beforeFirst();
		while (rs.next()) {
			photoDetails = new GalleryDTO();
			
			photoDetails.setPhotoTitle(StringUtil.isEmpty(rs.getString("photo_name")));
			photoDetails.setPhotoAltText(StringUtil.isEmpty(rs.getString("image_alt_text")));
			photoDetails.setPhotoCaption(StringUtil.isEmpty(rs.getString("photo_title")));
			photoDetails.setPhotoMetaKeyword(StringUtil.isEmpty(rs.getString("image_metakey")));
			photoDetails.setPhotoSource(StringUtil.isEmpty(rs.getString("photo_caption")));				
			photoDetails.setGalleryId(rs.getInt("id"));				
			photoDetails.setGalleryTitle(StringUtil.isEmpty(rs.getString("Gallery_name")));
			photoDetails.setGallerySefTitle(StringUtil.isEmpty(rs.getString("gallery_sefurl")));
			photoDetails.setMetaKeyword(StringUtil.isEmpty(rs.getString("gallerykeywords")));
			photoDetails.setMetaDescription(StringUtil.isEmpty(rs.getString("gallerydesc")));				
			photoDetails.setPhotoCount(galleryPhotoCount);				
			photoDetails.setCategoryId(rs.getInt("section_id"));
			photoDetails.setCategoryTitle(StringUtil.isEmpty(rs.getString("sectionname")));
			photoDetails.setCategorySefTitle(StringUtil.isEmpty(rs.getString("sef_url")));				
			
			photoList.add(photoDetails);
		}			
	} catch (Exception e) {
		System.out.println("GalleryHelper - photoDetails Exception is -->" + e);
	} finally {
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
		if(connection!=null)
			connection.close();
	}
	return photoList;
}
%>