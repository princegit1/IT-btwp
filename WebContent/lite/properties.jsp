<%
Properties property=new Properties();
try
{
	property.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("feedsurl.properties"));
}
catch(Exception e)
{
	//e.printStackTrace();
}
%>

