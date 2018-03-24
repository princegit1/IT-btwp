
<%@page language="java" import="java.net.*,java.sql.*, java.util.ArrayList, com.itgd.utils.*, com.itgd.dto.ContentListDTO"%>
<%@include file="global_include.jsp"%>
<%@include file="global_include_budget.jsp"%>
  
<%
int categoryId =0;
int contentCount=0;
String storyIdToAvoid="0";
int galleryId=0;
String title=null;
String sefTitle=null;
String imagePath=null;
int count=0;
try
{
if(request.getParameter("categoryId")!=null && !request.getParameter("categoryId").equals("")){
	categoryId = Integer.parseInt(request.getParameter("categoryId").trim());
}
if(request.getParameter("contentCount")!=null && !request.getParameter("contentCount").equals("")){
	contentCount = Integer.parseInt(request.getParameter("contentCount"));
}
if(request.getParameter("storyIdToAvoid")!=null && !request.getParameter("storyIdToAvoid").equals("")){
	storyIdToAvoid = request.getParameter("storyIdToAvoid");
}
ArrayList photoList = (ArrayList)getLatestGalleries(categoryId, contentCount, storyIdToAvoid);
if (photoList != null && photoList.size()==0)
{

%>
<div class="heading"><a class="subheadings" href="#"><h2>IN PICTURES</h2></a></div>
        <div class="content">
           <div id="gallery-belt">
              <ul>
<%

}

if (photoList != null && photoList.size() > 0) {
	for (ContentListDTO pdto : (ArrayList<ContentListDTO>) photoList) {
		galleryId =pdto.getId();
		title = pdto.getTitle();
		sefTitle = pdto.getSefTitle();
		imagePath = pdto.getImage();
		if(count==0)
		{
		 count++;
		     %>
             
             
               <div class="heading"><a class="subheadings" href="<%=SITE_BASEPATH+CommonFunctions.galleryListURL(pdto.getContentType(),1, categoryId)%>"><h2>IN PICTURES</h2><span class="moretxt">MORE</span></a></div>
        <div class="content">
           <div id="gallery-belt">
              <ul>
             
             <% }%>
       
             
                 <li>
                    <a href="<%=SITE_BASEPATH+CommonFunctions.galleryURL(sefTitle,1, galleryId)%>"><img height="93px" width="125px" src="<%=PHOTO_BASEPATH+imagePath%>"></a>
                     <span class="newphotoicon">photo</span>
                     <p><%=title%></p>                 
                 </li> 
		     
             <%}}
			 }
			  catch(Exception exception)
			 {
              
			   System.out.println("exception from -->> m.bt gallery_chunk.jsp ");
			 }
			 %>
       </ul>
             <div class="slider-navdot">
               <a href="javascript:void(0);" id="_1" class="activenav">1</a> <a href="javascript:void(0);" id="_2">2</a><a href="javascript:void(0);" id="_3">3</a><!--<a href="javascript:void(0);" id="_4">4</a>-->
             </div>           
           </div> 
           
           
           
        </div>

