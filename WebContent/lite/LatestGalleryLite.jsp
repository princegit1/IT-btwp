<%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %>
<%@page language="java" import="java.sql.*,java.net.*,java.util.ArrayList,com.itgd.utils.*,com.itgd.dto.GalleryDTO,com.itgd.dto.ContentListDTO,com.itgd.helper.GalleryHelper"%>
<%@include file="../global_include.jsp"%>
<%
String galleryId = "";
String categoryId= "";
ContentListDTO pdto = null;
if(request.getParameter("galleryId")!=null)
galleryId = request.getParameter("galleryId");
if(request.getParameter("categoryId")!=null)
categoryId = request.getParameter("categoryId");

int Category = Integer.parseInt(categoryId);
%>
<div class="other-news"><h2>More Galleries</h2>
<%
ArrayList photo = (ArrayList)CommonFunctions.latestGalleries(Category,5,""+galleryId);
if (photo != null && photo.size() > 0) {
	for (int ctr = 0; ctr < photo.size(); ctr++) {
		pdto = (ContentListDTO) photo.get(ctr);
		if(!galleryId.equals(String.valueOf(pdto.getId()))) {		
			%>
			<div class="othernews-row">
			<div class="newstext">
			<a href="<%=SITE_BASEPATH+CommonFunctions.galleryURL(pdto.getSefTitle(),1, pdto.getId())%>"> <%=pdto.getTitle()%></a>
			<% if(pdto.getUpdatedTime() != null ) { %>
			<div class="datetime"><%=pdto.getUpdatedTime()%></div>
			<% } %>
			<div class="subtitile">
			<%=pdto.getTitle()%>
			</div>
			</div>
			
			<div class="newsimage"> 
			<a href="<%=SITE_BASEPATH+CommonFunctions.galleryURL(pdto.getSefTitle(),1, pdto.getId())%>">
			<amp-img width="74" height="75" layout="fixed" title="" alt="" src="<%=PHOTO_BASEPATH%><%=pdto.getImage()%>"></amp-img>
			</a>
			</div>
			</div>
			<%
		}
	}
}
%>




