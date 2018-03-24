<script>
function validatesearch(modsearch) {
var srchtextvalue = document.getElementById(modsearch);
if(srchtextvalue.value=='') { alert('Please enter text to search.'); return false;  }
if(srchtextvalue.value!='') { if(srchtextvalue.value!='') { var x=srchtextvalue.value; var y = ''; var iChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 "; for (var i = 0; i < x.length; i++) { if (!(iChars.indexOf(x.charAt(i)) != -1)) { } else { y += x.charAt(i); } } srchtextvalue.value = y; } } return true; }
</script>  
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
<tr><td style="background-color: #d71920; height: 5px"></td></tr>
<tr><td align="left" valign="top" bgcolor="#FFFFFF"><a href="<%=SITE_URL%>"><img src="<%=MEDIA_CSS%>images/title.png"  border="0" align="left" ></a></td></tr>      
<tr><td align="left" valign="middle" height="23px" background="<%=MEDIA_CSS%>images/bg.gif" style="padding-left: 5px; border-bottom: #d8d8d8 1px solid; color: #FFFFFF" class="dtime">
<div style="float:left; margin-top:1px;">
<%	
java.util.Calendar currentDate = java.util.Calendar.getInstance();
java.text.SimpleDateFormat formatter=   new  java.text.SimpleDateFormat("MMM d | HH:mm");
String dateNow = formatter.format(currentDate.getTime());
out.println(dateNow+" IST"); %></div>
<div align="right" style="float:right">
<script type="text/javascript">
function toggleDiv(divId) {	$("#"+divId).toggle();	}
</script>
<a href="javascript:toggleDiv('myContent');"><div style="float:left; font-size:14px; color:#fff;margin-right:2px">SEARCH</div> <img src="<%=MEDIA_CSS%>images/search.png" border="0" align="left"></a>   </div>
<div id="myContent" style="display: none;float: left; width: 99.8%; border-top:1px solid #D8D8D8; background-color:#F7F7F8; padding:2px; text-align:center">
<form action="search.jsp" method="get" name="search" onSubmit="return validatesearch('search');">
<input type="text" maxlength="40" placeholder="Type To search" value="" class="textboxs" id="search" name="searchword">        
<input type="submit" value="GO" name="submit">
</form>
</div>
</td></tr></table>
<%String sectionNameforAddDisplay="";%>