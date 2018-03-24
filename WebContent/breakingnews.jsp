<%@page import = "java.util.ArrayList, com.itgd.utils.CommonFunctions, com.itgd.dto.ContentListDTO, com.itgd.utils.Constant"%>
<%ArrayList breakingCheck = (ArrayList) CommonFunctions.breakingNews();
if (breakingCheck != null && breakingCheck.size() > 0) {
	for (int i = 0; i < breakingCheck.size(); i++) {
		ContentListDTO breaking = (ContentListDTO) breakingCheck.get(i);
		//System.out.println("breaking sql ->" + breaking.getFullDescription());
%>
<table width="99%" cellpadding="0" cellspacing="0"><tr>
    <td bgcolor="#FFE91E" id="breakingC" class="breakingTXT"><span class="breakingH"><%=breaking.getContentType()%></span></td>
    <td style=" border:1px solid #FFE91E;" class="breakingTXT">  
			<%if(!breaking.getFullDescription().equals("")) { 
					out.print("<a href=\""+Constant.SITE_URL+CommonFunctions.storyURL(breaking.getSefTitle(),1, breaking.getId())+"\">"+breaking.getTitle()+"</a>");
				}else{
					out.print(breaking.getTitle());
				} %>
			<font color="#B10F0A"><%=breaking.getUpdatedTime() %> </font>
 </td>
</tr></table>
<%
	}
}
%>