<%
String URL1 = request.getRequestURI();
String add_tempvar="";
int add_categoryid=0;
if(request.getAttribute("add_categoryid")!=null)
{
add_categoryid=(Integer)request.getAttribute("add_categoryid"); 
//out.println("------------>"+add_categoryid);
}
if(URL1.matches("/index.jsp") || URL1.matches("/"))  
{
%>
<!-- Ad Slot 1 tag: --><!-- begin ZEDO for channel:- BT Homepage Top, Publisher: Bussiness Today WAP, Ad Dimension: 320x50 Mobile-320x50 -->
<div id="zt_408558_1" style="display:show"><script id="zt_408558_1" language="javascript">if(typeof zmt_mtag !='undefined' && typeof zmt_mtag.zmt_render_placement !='undefined') { zmt_mtag.zmt_render_placement(p408558_1); } </script></div>
<!-- end ZEDO for channel: - BT Homepage Top, Publisher: Bussiness Today WAP, Ad Dimension: 320x50 Mobile-320x50 -->

<% } else { if((request.getRequestURI().contains("section.jsp") ||request.getRequestURI().contains("story.jsp")||request.getRequestURI().contains("category.jsp")) && (add_categoryid==110 || add_categoryid==57|| add_categoryid==58|| add_categoryid==59|| add_categoryid==60|| add_categoryid==72  )){%>

<% } else { %>
	 
<!-- Ad Slot 1 tag: --><!-- begin ZEDO for channel:- BT ROS Top, Publisher: Bussiness Today WAP, Ad Dimension: 320x50 Mobile-320x50 --> 
<div id="zt_477283_1" style="display:show"><script id="zt_477283_1" language="javascript"> 
if(typeof zmt_mtag !='undefined' && typeof zmt_mtag.zmt_render_placement !='undefined') {
     zmt_mtag.zmt_render_placement(p477283_1); 
}
</script>
</div>
<!-- end ZEDO for channel: - BT ROS Top, Publisher: Bussiness Today WAP, Ad Dimension: 320x50 Mobile-320x50 -->
<% }} %>
 <div class="banner" style="margin-bottom:10px;margin-top:5px"> 
		<a href="http://specials.indiatoday.com/survey/coolest-startups2017/registration.jsp" target="_blank">
			<img src="http://media2.intoday.in/businesstoday/1.0.3/resources/cooleststartup/2017/images/mbanner2017.jpg" alt="COOLEST START-UPS 2017">
		</a>
	</div>
<div class="colum" id ="static_coolest_banner" style="margin-top:20px;"><script>storyRelatedAjaxInclude("http://alpham.businesstoday.in/staticcontent_chunk.jsp?contentTitle=Coolest-startup-banner")</script></div>

	 