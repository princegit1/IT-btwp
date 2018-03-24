   <%
 
    contentAL22 = (ArrayList)getLatestStories("178#696", 4, "0");
    if (contentAL22 != null && contentAL22.size() > 0) {
        for (int ctr = 0; ctr < contentAL22.size(); ctr++) {
            ContentListDTO cDTO = (ContentListDTO) contentAL22.get(ctr);
            if (ctr == 0) {%>
            
               <div class="budget-heading red"><a  href="<%=SITE_BASEPATH+CommonFunctions.categoryURL(cDTO.getCurrentCategorySefTitle(),1,cDTO.getCurrentCategoryId())%>"><strong>RAILWAY</strong> BUDGET </a></div>
      
            <div class="whitebox">
         <div class="content">
         
             	<div style="text-align:center; width:100%">
                   <h3><a href="<%=SITE_BASEPATH+CommonFunctions.storyURL(cDTO.getSefTitle(),1, cDTO.getId())%>"><%=cDTO.getTitle()%></a></h3>
               </div>
               
               <div style="width:300px; margin:0 auto">
             <iframe width="300" height="170" frameborder="0" id="livetv_video1" scrolling="no" allowfullscreen="" src="http://new.livestream.com/accounts/11965022/events/3778278/player?width=560&amp;height=315&amp;autoPlay=true&amp;mute=false"></iframe>
             </div>
                 <div class="heiglight-section clearfix">
                 <h3>Highlights</h3>
                 <iframe width="290" height="400" frameborder="0" align="left" style="margin-left:10px; margin-top:12px;" scrolling="no" marginwidth="0" src="http://businesstoday.intoday.in/highlights/chunk_unionbudget_highlights2015.jsp?id=216116&amp;chunkHeight=439"></iframe>
                 
                 <h4><a target="_blank" href="http://businesstoday.intoday.in/highlights/chunk_unionbudget_highlights2015.jsp?id=216116&amp;chunkHeight=439">More</a></h4>
                 
                 </div>
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