<script>
$(document).ready(function(){
$('#mnav').click(function(){
$('.budgetnav').slideToggle('slow');
});


$('.searchtop').click(function(){
		$('.searchbox').slideToggle();
	});
	
	$('.searchtext').click(function(){
		//$(this).hide();
		$('.sear').show();
		
	});
	$('.sear').blur(function(){
		$(this).hide();
		$('.searchtext').show();
	});
	

});

</script>
<style>

body{margin:0; padding:0; font-family:Arial, Helvetica, sans-serif; font-size:12px;}
h1, h2, h3{margin:5px auto;}
a{ text-decoration:none;}
.lead{color:#2e3094; font-size:18px;}
.cf:before, cf:after{content:''; display:table}
.cf:after{clear:both;}
ul{margin:0; padding:0; overflow:hidden;}
ul li{list-style:none; }
.wrapper{ width:320px; border-top:5px solid #d81920; margin:auto;}
.bottom-border{ border-bottom:5px solid #2e3094;}
.container{width:95%; margin:0 auto;overflow:hidden; line-height:35px; font-family:Arial, Helvetica, sans-serif;}
.header1{width:100%; height:45px; background:#fff; padding:7px 0; border-top:5px solid #d81920;}
.header2{width:100%; height:28px; color:white; line-height:28px;
background: #2e3094; /* Old browsers */
background: -moz-linear-gradient(left, #2e3094 0%, #d6000a 100%); /* FF3.6+ */
background: -webkit-gradient(linear, left top, right top, color-stop(0%,#2e3094), color-stop(100%,#d6000a)); /* Chrome,Safari4+ */
background: -webkit-linear-gradient(left, #2e3094 0%,#d6000a 100%); /* Chrome10+,Safari5.1+ */
background: -o-linear-gradient(left, #2e3094 0%,#d6000a 100%); /* Opera 11.10+ */
background: -ms-linear-gradient(left, #2e3094 0%,#d6000a 100%); /* IE10+ */
background: linear-gradient(to right, #2e3094 0%,#d6000a 100%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#2e3094', endColorstr='#d6000a',GradientType=1 ); /* IE6-9 */}
.heading h2{ margin-left:6px;}
.searchtop {
    border: medium none;
    cursor: pointer;
    height: 25px;
    margin: 2px 3px;
    width: 28px;
}
.searchtop {
    background: url("http://media2.intoday.in/businesstoday_wap/1.0.0/resources/css/images/search.png") no-repeat scroll 0 4px rgba(0, 0, 0, 0);
    width: 21px !important;
}
.budget-header {
    background: none repeat scroll 0 0 #2e3094;
    color: #fff;
    font-family: Arial,Helvetica,sans-serif;
    font-size: 28px;
    line-height: 24px;
    margin-bottom: 15px;
    margin-top: 5px;
    padding: 10px;
    position: relative;
}
.budget-header a{ color:#fff; font-size: 28px; text-decoration:none;}
#mnav {
    background: url("http://media2.intoday.in/businesstoday/mobile/budgetmnav.jpg") no-repeat scroll 0 0 rgba(0, 0, 0, 0);
    cursor: pointer;
    height: 13px;
    position: absolute;
    right: 12px;
    text-indent: -9999px;
    top: 16px;
    width: 23px;
}
.budgetnav {
    background: none repeat scroll 0 0 #fff;
    box-shadow: -16px 3px 23px 0 rgba(50, 50, 50, 0.61);
    padding: 0 10px 10px;
    position: absolute;
    right: 0;
    top: 44px;
    width: 200px;
    z-index: 999;
}
.budgetnav ul li {
    border-bottom: 1px solid #ededed;
    margin: 0;
    padding: 0;
}
.budgetnav ul li a {
    color: #707070;
    display: block;
    font-size: 15px;
    line-height: 15px;
    padding: 10px 0; font-family:Arial, Helvetica, sans-serif;
 text-decoration:none;}
.searchbox {
    background: none repeat scroll 0 0 #bbbbbb;
    display: none;
    width: 100%;
}
.searchbox-inner {
    margin-left: 51px;
    overflow: hidden;
    padding: 5px 0;
    width: 227px;
}
</style>

<div class="header1"><a href="http://m.businesstoday.in/"><img src="http://media2.intoday.in/businesstoday_wap/1.0.0/resources/css/images/title.png" style="margin-top:8px; margin-left:6px;"></a></div>
 <div class="header2"><span style="float:left; margin-left:6px;"> 
 <%	
java.util.Calendar currentDate = java.util.Calendar.getInstance();
java.text.SimpleDateFormat formatter=   new  java.text.SimpleDateFormat("MMM d | HH:mm");
String dateNow = formatter.format(currentDate.getTime());
out.println(dateNow+" IST"); %>
  </span>
  <!--<a href="#" style="color:white; float:right; text-decoration:none; font-weight:bold; background:url(search.jpg) no-repeat right; padding-right:22px;">SEARCH</a>-->
  
  <div style="float:right">
  	<form action="http://m.businesstoday.in/search.jsp" method="get" name="search">
	<!--<input class="sear" type="text" maxlength="40" onfocus="if(this.value=='search...') this.value='';" onblur="if(this.value=='') this.value='search...';" value="search..." class="textboxs" alt="search" name="searchword" style="display:none">  -->
    <span class="searchtext">SEARCH</span>      
	<input type="button" value="" class="searchtop"  name="submit">
	</form>
  </div>
   </div>
  <div class="searchbox" style="display: none;">
  <div class="searchbox-inner"><form action="http://m.businesstoday.in/search.jsp" method="get" name="search"><input type="text" name="searchword" style="float:left">
  <input type="submit" style="float:left;background:#d80017; color:white; border:none;margin: 2px;    padding: 1px;" value="SUBMIT">
  </form>
  </div>
  </div>
  
<div class="budget-header"> <a href="http://m.businesstoday.in/budget/2016/index.jsp" ><strong>BUDGET</strong> 2016 </a>   <div id="mnav">Navigation</div>
<div class="budgetnav" style="display:none">
  <ul>
    <%-- <li><a href="http://m.businesstoday.in/category/budget-news/1/679.html">Latest News</a></li>--%>
    
    <li><a href="http://businesstoday.intoday.in/categorylist/711/1/budget-2015-key-announcements.html">Key announcements</a></li>
      <li><a href="http://m.businesstoday.in/category/reactions-to-budget-2015/1/712.html">Reactions</a></li>
        <li><a href="http://m.businesstoday.in/category/budget-2015-sector-breakup/1/714.html">Hits and Misses</a></li>
        <li><a href="http://m.businesstoday.in/category/india-inc-on-budget/1/716.html">CEO speak</a></li> 
          <li><a href="http://m.businesstoday.in/category/tax-changes-in-budget-2015/1/713.html">Your finances</a></li>     
      <li><a href="http://m.businesstoday.in/category/budget-2015-impact-on-stocks/1/715.html">Stocks impact</a></li>    
      <li><a href="http://m.businesstoday.in/category/budget-news/1/679.html">Other News</a></li>     
       <li><a href="http://m.businesstoday.in/category/economic-survey/1/710.html">Economic Survey</a></li>
         <li><a href="http://m.businesstoday.in/category/railway-budget-2015-16/1/696.html">Railway Budget</a></li>
    <%-- <li><a href="http://m.businesstoday.in/category/executive-wish-list/1/702.html">Executive wish list </a></li>--%>
         <li><a href="http://m.businesstoday.in/videocategory/Union Budget 2015-16 /1/46.html">Videos</a></li>
        <li><a href="http://m.businesstoday.in/gallerylist/budget-2015-16/1/187.html">Slideshows</a></li>
        
   
        
<%--     <li><a href="http://m.businesstoday.in/category/expectations/1/698.html">Expectations</a></li>
     <li><a href="http://m.businesstoday.in/category/key-action-points/1/708.html">On the agenda</a></li>--%>
    
    
      
    
    </ul>


</div>
</div>
