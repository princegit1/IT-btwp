<%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %>
<%@page language="java" import="java.net.*, java.util.ArrayList, com.itgd.utils.*, com.itgd.dto.ContentListDTO"%>
<%@include file="global_include.jsp"%>
<%
String categoryId = "4";
int contentCount = 5;
String storyIdToAvoid="0";
String imagePath="";
if(request.getParameter("categoryId")!=null && !request.getParameter("categoryId").equals("")){
	categoryId = request.getParameter("categoryId");
}
if(request.getParameter("contentCount")!=null && !request.getParameter("contentCount").equals("")){
	contentCount = Integer.parseInt(request.getParameter("contentCount"));
}
if(request.getParameter("storyIdToAvoid")!=null && !request.getParameter("storyIdToAvoid").equals("")){
	storyIdToAvoid = request.getParameter("storyIdToAvoid");
}
int pcatlength = 0;
String pcatids[] = null;
if(categoryId.indexOf("#") > 0) {
	pcatids = categoryId.split("#");
} else {
	pcatids = new String[1];
	pcatids[0] = categoryId;
}
pcatlength = pcatids.length;
String headerURL = "";


%>
<cache:cache key="http://m.businesstoday.in/budget/2015/latest_stories_chunk_budget.jsp?categoryId=<%=categoryId %>&contentCount=<%=contentCount %>" scope="application" time="300" refresh="t" > 

<%
try
{
ArrayList lsAL = null;
String catTitle="";
lsAL = (ArrayList)CommonFunctions.latestStories(categoryId, contentCount, storyIdToAvoid);
if (lsAL != null && lsAL.size() ==0) {
%>
   <div class="heading"><a class="subheadings" href="#"><h2>INDIA INC ON BUDGET</h2><span class="moretxt">MORE</span></a></div>
     
        <div class="content">
           <div class="listcontent">
<%
}
if (lsAL != null && lsAL.size() > 0) {
	for (int ctr = 0; ctr < lsAL.size(); ctr++) {
		ContentListDTO cDTO = (ContentListDTO) lsAL.get(ctr);
		if (ctr == 0) {
			if(pcatlength==1)
				headerURL = SITE_BASEPATH+CommonFunctions.sectionURL(cDTO.getCurrentCategorySefTitle(), 1, cDTO.getCurrentCategoryId());
			else if(pcatlength==2) 
				headerURL = SITE_BASEPATH+CommonFunctions.categoryURL(cDTO.getCurrentCategorySefTitle(), 1, cDTO.getCurrentCategoryId());
			else if(pcatlength==3) 
				headerURL = SITE_BASEPATH+CommonFunctions.subCategoryURL(cDTO.getCurrentCategorySefTitle(), 1, cDTO.getCurrentCategoryId());
			else if(pcatlength==4) 
				headerURL = SITE_BASEPATH+CommonFunctions.subSubCategoryURL(cDTO.getCurrentCategorySefTitle(), 1, cDTO.getCurrentCategoryId());
				
				if(cDTO.getCurrentCategoryTitle().equals("SECTORS")){
				catTitle="Industry ";
				}else if(cDTO.getCurrentCategoryTitle().equals("Best Advice I Ever Got")){
				catTitle="Specials ";
				}else if(cDTO.getCurrentCategoryTitle().equals("India - A hotspot of hope")){
				catTitle="SPECIAL: 66 reasons of hope";
				}else if(cDTO.getCurrentCategoryTitle().equals("India's Coolest Start-ups 2013")){
				catTitle="SPECIAL: COOLEST START-UPS OF INDIA";
				}else if(cDTO.getCurrentCategoryTitle().equals("Lok Sabha Elections 2014")){
				catTitle="Saffronomics: Potential & Pitfalls";
				}else if(cDTO.getCurrentCategoryTitle().equals("Money")){
				catTitle="Personal Finance";
				}else if(cDTO.getCurrentCategoryTitle().equals("Talking heads") || cDTO.getCurrentCategoryTitle().equals("TALKING HEADS")){
				catTitle="Opinion";
				}else{
				catTitle=cDTO.getCurrentCategoryTitle();
				}
				}
				
				if(cDTO.getImage()!=null && cDTO.getImage().trim().length() > 0)
				{
				imagePath=STORY_IMAGE_BASEPATH+cDTO.getImage().trim();
				}
				else
				{
				imagePath=NO_IMG_88x66;
				}
				
				if(ctr==0)
				{
		     %>
             
              <div class="heading"><a class="subheadings" href="<%=SITE_BASEPATH+CommonFunctions.categoryURL(cDTO.getCurrentCategorySefTitle(),1,cDTO.getCurrentCategoryId())%>"><h2>INDIA INC ON BUDGET</h2><span class="moretxt">MORE</span></a></div>
     
        <div class="content">
           <div class="listcontent">
           
           
           <%}%>
		   
		       <div class="row clearfix">
               <div class="list-img"><a href="/<%=CommonFunctions.storyURL(cDTO.getSefTitle(),1,cDTO.getId())%>"><img src="<%=imagePath%>"></a></div>
               <div class="list-content"><a href="/<%=CommonFunctions.storyURL(cDTO.getSefTitle(),1,cDTO.getId())%>"><%=cDTO.getTitle()%></a></div>
               </div> 
             <%}}
			 }
			  catch(Exception exception)
			 {
			 
			   System.out.println("exception from -->> m.bt budget.expert_speak_stories_chunk.jsp ");
			 }
			 %>
               
         </div>
        
        
        </div>      

</cache:cache>
