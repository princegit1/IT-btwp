<%@ page language="java" pageEncoding="ISO-8859-1" import= "java.net.URL, java.net.ConnectException, com.itgd.parser.XmlReader, java.net.HttpURLConnection, java.util.ArrayList, com.itgd.parser.XmlItem, com.itgd.parser.DecodeXML, com.itgd.utils.Constants"%><%
String id = "";
String name = "";
String current_value = "";
String value_change = "";
String percentage_change = "";
//String strurl = "http://businesstoday.accordhostings.com/";
//String[] tokens = {"SensexNiftyFeed.aspx"};
String cat = "";
XmlReader read=null;

String fetchUrl = "http://feeds.intoday.in/btapps/market/snsexnifty.xml";	//strurl+tokens[0];

try {
	URL url = new URL(fetchUrl);	
	HttpURLConnection conn = (HttpURLConnection)url.openConnection();
	conn.connect();
	System.out.println("conn.getResponseCode() ====>> "+conn.getResponseCode()+", url ====>> "+url);
	if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
		read = new XmlReader();
		ArrayList xmlata = read.read(fetchUrl); 
		if (xmlata != null && xmlata.size() > 0) {			%>
			<tr>
				<td>
					<table width="100%" cellspacing="0" cellpadding="0" border="0">
    					<tbody>
	 						<tr><td height="22" bgcolor="#2E3094" colspan="4" class="subheading">MARKETS</td></tr>
							<tr><td class="Height5px"></td></tr>
							<tr>
<% 									for (int ii = 0; ii < xmlata.size(); ii++) {
									XmlItem item = (XmlItem) xmlata.get(ii);
									name = item.getName();
									current_value = item.getCurrent_value();
									value_change = item.getValue_change();
									percentage_change = item.getPercentage_change();
									String imgUrl = "";
									String mktUrl = "";
									if(value_change.contains("-"))
										imgUrl = MEDIA_CSS+"images/dwn.GIF";
									else
										imgUrl = MEDIA_CSS+"images/Upp.GIF";
									if(value_change.equals("SENSEX"))
										mktUrl = "bsemarketiframe.jsp";
									else
										mktUrl = "nsemarketiframe.jsp";
 									if(name.contains("SENSEX")) {	%>
 										<td class="GridDataLeft" >
 											<img width="9"  align="top" vspace="5" height="5" border="0" src="<%=imgUrl %>"><a href="bsemarketiframe.jsp" class="NewsStyle"><%=name %></a><br/>
											<%=current_value %><span class="Red">(<%=value_change %>)</span>
										</td>
<%							 			} else {  %> 
   		     							<td class="GridDataRight" ><img width="9"  align="top" vspace="5" height="5" border="0" src="<%=imgUrl %>">
  											<a href="nsemarketiframe.jsp" class="NewsStyle"><%=name %></a><br/>
											<%=current_value %><span class="Red">(<%=value_change %>)</span>
										</td>
<%										}
								}
		}	%>
							</tr>
						</tbody>
					</table>
  						<table width="100%" cellspacing="0" cellpadding="0" border="0" id="CompTbl">
   						<tbody><tr><td colspan="4" style="font-weight: bold;"><a href="http://m.businesstoday.in/marketiframe.jsp">MORE FROM MARKETS</a></td></tr>
						</tbody>
					</table>
				</td>
			</tr>				
<%		}
} catch(ConnectException ex) {
	System.out.println("Found ConnectionException in BTWAP market_xml_reader.jsp::Caused By: The server businesstoday.accordhostings.com doesnot responding... "+ex);
}	%>