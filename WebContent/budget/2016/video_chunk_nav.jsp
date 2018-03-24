<%@page import="com.itgd.dto.VideoDTO"%>
<%@page import="com.itgd.helper.VideoHelper"%>
<%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %>
<%@page language="java" import="java.util.*,java.sql.*, java.net.*, java.util.ArrayList, com.itgd.utils.*, com.itgd.dto.StoryDTO,com.itgd.dto.ContentListDTO"%>
<cache:cache key="<%=SITE_BASEPATH+"budget/2015/video_chunk_nav.jsp"%>" scope="application " time="2" refresh="t" >
<%@include file="global_include.jsp"%>
<%@ page language="java" import="com.itgd.dto.ContentChunkDTO, com.itgd.helper.ContentChunkHelper, com.itgd.utils.*" pageEncoding="ISO-8859-1"%>


<% int videoCountDisplay = 0;
int categoryId =0;
int contentCount=0;
String storyIdToAvoid="0";
int galleryId=0;
String title=null;
String sefTitle=null;
String imagePath=null;
int count=0;

if(request.getParameter("categoryId")!=null && !request.getParameter("categoryId").equals("")){
	categoryId = Integer.parseInt(request.getParameter("categoryId").trim());
}
if(request.getParameter("contentCount")!=null && !request.getParameter("contentCount").equals("")){
	contentCount = Integer.parseInt(request.getParameter("contentCount"));
}
if(request.getParameter("storyIdToAvoid")!=null && !request.getParameter("storyIdToAvoid").equals("")){
	storyIdToAvoid = request.getParameter("storyIdToAvoid");
}
try
	 {
	ArrayList videoListData = (ArrayList) VideoHelper.latestVideoSubCategory(categoryId, contentCount, "");
	if (videoListData != null && videoListData.size() ==0)
	 {
	 %>
	    <div class="heading"><a class="subheadings" href="#"><h2>VIDEOS</h2><span class="moretxt">MORE</span></a></div>
       
              
              <%
	 }
     	if (videoListData != null && videoListData.size() > 0) {
			for (int ctr=0; ctr < videoListData.size(); ctr++) {
				VideoDTO catDetail = (VideoDTO) videoListData.get(ctr);	
			if(catDetail.getVideoKickerImage()!=null && catDetail.getVideoKickerImage().trim().length() > 0){
			imagePath=STORY_IMAGE_BASEPATH+catDetail.getVideoKickerImage().trim();
			}else{
			imagePath=NO_IMG_88x66;
			}
			if(ctr==0)
			{
			%>
			
			<div class="heading"><a class="subheadings" href="/<%=CommonFunctions.videoSubCatListURL(catDetail.getVideoComment(),1,categoryId)%>" target="_blank"><h2>VIDEOS</h2><span class="moretxt">MORE</span></a></div>
                           <div class="clearfix"></div>
          <div class="content" id="vdo_bdg">
          <div class="swiper-container">
              <div class="swiper-wrapper">
          
              <%} %>
              <div class="swiper-slide">
              
              <div class="mb_sld">
                     <a href="/<%=CommonFunctions.videoURL(catDetail.getVideoSefTitle(),1,catDetail.getVideoId())%>?nav=1"><img  width='125'  src="<%=imagePath%>" /></a>
                     <span class="newvideoicon">Video</span>
                     <p><%=catDetail.getVideoTitle()%></p> 
                     </div>               
                </div>  
<%}}
}
catch(Exception exception)
{
System.out.println(exception.getMessage());
} 

%>
 </div>
 <!--<div class="swiper-pagination pgn_vd"></div>-->
 </div>
 
             <!--<div class="slider-navdot2">
               <a href="javascript:void(0);" id="_1" class="activenav">1</a> <a href="javascript:void(0);" id="_2">2</a><a href="javascript:void(0);" id="_3">3</a>
             </div> -->           
          
         
           
           <!--end swiper -->
      </div>
                     <div class="clearfix"></div>
</cache:cache>