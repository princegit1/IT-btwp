
 <%
  
    contentAL22 = (ArrayList)getLatestStories("178#710", 4, "0");
    if (contentAL22 != null && contentAL22.size() > 0) {
        for (int ctr = 0; ctr < contentAL22.size(); ctr++) {
            ContentListDTO cDTO = (ContentListDTO) contentAL22.get(ctr);
            if (ctr == 0) {%>
            <div class="budget-heading red"><a  href="<%=SITE_BASEPATH+CommonFunctions.categoryURL(cDTO.getCurrentCategorySefTitle(),1,cDTO.getCurrentCategoryId())%>"><strong>ECONOMIC</strong> SURVEY</a></div>
            <div class="whitebox">
             
      <%--   <div class="heading"><a class="subheadings" href="<%=SITE_BASEPATH+CommonFunctions.categoryURL(cDTO.getCurrentCategorySefTitle(),1,cDTO.getCurrentCategoryId())%>"><h2>EXPECTATIONS</h2><span class="moretxt">MORE</span></a></div>
       --%>  <div class="content">
             <h3><a href="<%=SITE_BASEPATH+CommonFunctions.storyURL(cDTO.getSefTitle(),1, cDTO.getId())%>"><%=cDTO.getTitle()%></a></h3>
             <div class="storyimg"><a href="<%=SITE_BASEPATH+CommonFunctions.storyURL(cDTO.getSefTitle(),1, cDTO.getId())%>"><img src="<%=STORY_IMAGE_BASEPATH+cDTO.getImage().trim()%>" /></a></div>
             <ul>
            
            <% 
			
			}
			else
			{
			%>
            
          <li><a href="<%=SITE_BASEPATH+CommonFunctions.storyURL(cDTO.getSefTitle(),1, cDTO.getId())%>"><%=cDTO.getTitle()%></a></li>
           
  
  <%}}}%>
     
        
                            
             </ul>
            
        
        </div>
      </div>