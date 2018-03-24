<!-- Begin comScore Tag --> 
<!--<script src="http://cdn51.vizury.com/pam/api/pam.js?name=PAM_IND_MWeb_BusinessToday&id=7270&v=1.2&geo=ap"></script>-->
<script> 
  var _comscore = _comscore || [];
  _comscore.push({ c1: "2", c2: "8549097" });
  (function() {
    var s = document.createElement("script"), el = document.getElementsByTagName("script")[0]; s.async = true;
    s.src = (document.location.protocol == "https:" ? "https://sb" : "http://b") + ".scorecardresearch.com/beacon.js";
    el.parentNode.insertBefore(s, el);
  })();
</script> 

<noscript> 
  <img src="http://b.scorecardresearch.com/p?c1=2&c2=8549097&cv=2.0&cj=1" />
</noscript> 
<!-- End comScore Tag -->
<script>
         function validatesearch(modsearch)
          {
                   var srchtextvalue = document.getElementById(modsearch);
                   if(srchtextvalue.value=='') {
                             alert('Please enter text to search.');
                             return false;
                   }
                   if(srchtextvalue.value!='') {
                             if(srchtextvalue.value!='') {
                                      var x=srchtextvalue.value;
                                      var y = '';
                                      var iChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ";
                                      for (var i = 0; i < x.length; i++) {
                                                if (!(iChars.indexOf(x.charAt(i)) != -1)) {
                                                } else {
                                                          y += x.charAt(i);
                                                }
                                      }
                               srchtextvalue.value = y;
                             }
                   }
                   return true;
          }
</script>  
	
<table width="100%"  border="0" cellspacing="0" cellpadding="0"><tr>
                            <td style="background-color: #d71920; height: 5px">
                            </td>
                        </tr><tr>
            <td align="left" valign="top" bgcolor="#FFFFFF"><a href="<%=SITE_URL%>">
           <img src="http://media2.intoday.in/businesstoday_wap/1.0.0/resources/css/images/title.png"  border="0" align="left" > 
            <!--<img src="http://media2.intoday.in/images/diwali/BT_Mob_Diwali.gif"  border="0" align="left" >-->
            </a> 
              
                        
                        
                        </td>
                        
                       
                        </tr>      
<tr><td align="left" valign="middle" height="23px" background="http://media2.intoday.in/businesstoday_wap/1.0.0/resources/css/images/bg.gif" style="padding-left: 5px; border-bottom: #d8d8d8 1px solid; color: #FFFFFF" class="dtime">
<div style="float:left; margin-top:1px;">
<%	
java.util.Calendar currentDate = java.util.Calendar.getInstance();
java.text.SimpleDateFormat formatter=   new  java.text.SimpleDateFormat("MMM d | HH:mm");
String dateNow = formatter.format(currentDate.getTime());
out.println(dateNow+" IST"); %></div>
<div align="right" style="float:right">
<script type="text/javascript">
function toggleDiv(divId) { 
	$("#"+divId).toggle();
}
</script>
<a href="javascript:toggleDiv('myContent');"><div style="float:left; font-size:14px; color:#fff;margin-right:2px">SEARCH</div> <img src="http://media2.intoday.in/businesstoday_wap/1.0.0/resources/css/images/search.png" border="0" align="left"></a>   </div>
<div id="myContent" style="display: none;float: left; width: 99.8%; border-top:1px solid #D8D8D8; background-color:#F7F7F8; padding:2px; text-align:center">
<form action="search.jsp" method="get" name="search" onSubmit="return validatesearch('search');">
<input type="text" maxlength="40" placeholder="Type To search" value="" class="textboxs" id="search" name="searchword">        
<input type="submit" value="GO" name="submit">
</form>
</div>
</td></tr></table>
<%String sectionNameforAddDisplay="";%>