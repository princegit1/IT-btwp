<%@page language="java" import="com.itgd.utils.StringUtil"%>
<%
String chartBeatSecName = StringUtil.replaceSingleQuote(StringUtil.isEmpty(request.getParameter("chartBeatSecName")));
String chartBeatAuthName = StringUtil.replaceSingleQuote(StringUtil.isEmpty(request.getParameter("chartBeatAuthName")));
String chartBeatTitleName = StringUtil.replaceSingleQuote(StringUtil.isEmpty(request.getParameter("chartBeatTitleName")));
%>
<script type='text/javascript'>
    var _sf_async_config={};
    /** CONFIGURATION START **/
    _sf_async_config.uid = 60355;
    _sf_async_config.domain = 'businesstoday.in';
    _sf_async_config.useCanonical = true;
	_sf_async_config.sections = '<%= chartBeatSecName%>';
	_sf_async_config.authors = '<%= chartBeatAuthName%>';
	_sf_async_config.title = '<%= chartBeatTitleName %>';
	
    /** CONFIGURATION END **/
    (function(){
      function loadChartbeat() {
        window._sf_endpt=(new Date()).getTime();
        var e = document.createElement('script');
        e.setAttribute('language', 'javascript');
        e.setAttribute('type', 'text/javascript');
        e.setAttribute('src', '//static.chartbeat.com/js/chartbeat.js');
        document.body.appendChild(e);
      }
      var oldonload = window.onload;
      window.onload = (typeof window.onload != 'function') ?
         loadChartbeat : function() { oldonload(); loadChartbeat(); };
    })();
</script>