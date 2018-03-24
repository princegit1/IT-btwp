<!-- Begin comScore Tag --> 
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
	
	  <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tbody>
                <tr>
                    <td style="background-color: #d71920; height: 4px">
                    </td>
                </tr>
                <tr>
                    <td>

                        <a href="<%=Constant.SITE_URL %>index.jsp">
                            <img style="border-style: none" src="<%=Constant.SITE_URL %>image/busines_Logo.png" alt="Business Today"
                                width="221px" height="41px" />
                        </a>
                    </td>
                </tr>
                <tr>
                    <td style="height: 1px">
                    </td>
                </tr>

                <tr>
                    <td class="dtime" style="padding-left: 5px; border-bottom: #d8d8d8 1px solid; color: #FFFFFF"
                        align="left" background="<%=Constant.SITE_URL %>/image/bg.gif" height="18">
                        
                         <% 
   DateFormat fmt = new SimpleDateFormat("MMMM d |HH:mm");
   String now = fmt.format(new Date()); 
%> 
                                <%= now%> IST</td>
                </tr>
            </tbody>
        </table>