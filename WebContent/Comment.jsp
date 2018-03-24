<%@ page language="java" import="java.util.*, com.mobile.util.*" pageEncoding="ISO-8859-1"%>
<%
	String storyId = request.getParameter("sid");
	if(storyId==null)
		storyId = "0";
	String secId = request.getParameter("secid");
	if(secId==null)
		secId = "0";

	String msg = request.getParameter("message");
	if(msg==null)
		msg = "";
 %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="googleanalytics_top.jsp"%>
<html>
<head>
<META http-equiv="Content-Type" content="text/html;charset=iso-8859-1">
<title>IT WAP site</title>
<link rel="stylesheet" href="css/mobile.css" type="text/css">
<script language="javascript">
function cemail(val){
	if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(val.value)){
		return (true)
	}
	return false;
}
function ajaxFunction(){
	var frm=document.feedback;
	if(frm.NAME.value=="")
	{
		alert("Please enter Name");
		frm.NAME.focus();
		return false;
	}
	if (frm.FNAME.value!="") {
		var alp = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ";
		for (var i=0;i<frm.FNAME.value.length;i++){
			temp=frm.FNAME.value.substring(i,i+1);
			if (alp.indexOf(temp)==-1){
				alert("First name should accept only alphabets[a-z,A-Z]");
				frm.FNAME.focus();
				return false;
			}
		}
	}
		
	if(frm.EMAIL.value=="")
	{
		alert("Please enter Email Id");
		frm.EMAIL.focus();
		return false;
	}
	if(cemail(frm.EMAIL)==false)
	{
		alert( "Please enter valid email ID" );
		frm.EMAIL.focus();
		return false;
	}
	if(frm.Location.value=="")
	{
		alert("Please enter city");
		frm.Location.focus();
		return false;
	}
	if (frm.Location.value!="") {
		var alp = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ";
		for (var i=0;i<frm.Location.value.length;i++){
			temp=frm.Location.value.substring(i,i+1);
			if (alp.indexOf(temp)==-1){
				alert("City should accept only alphabets[a-z,A-Z]");
				frm.Location.focus();
				return false;
			}
		}
	}
frm.submit();
}
</script>
</head>
<body>
<%@ include file="topnav.jsp"%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr><td height="8"></td></tr>
<tr><td class="breadcrumb"> <a href="home">HOME</a> &raquo; Comment</td></tr>
<tr><td align="left" valign="top"><form name="feedback" action="saveComment.jsp" method="post" onsubmit="javascript:return ajaxFunction()">
<input type="hidden" name="storyid" value="<%=storyId%>">
<input type="hidden" name="secid" value="<%=secId%>">
	<table border="0" cellpadding="0" cellspacing="5" style="font:bold 11px arial; color:#5A5A5A;">
      <tr><td style="font:bold 12px arial; text-transform:uppercase;" >have your say</td></tr>
      <tr><td><span class="star" style="font-size:11px; ">*&nbsp;Mandatory</span></td></tr>
      <tr><td><span class="star">*</span>&nbsp;Name: <input type="text" name="NAME" /></td></tr>
      <tr><td><span class="star">*</span>&nbsp;Email: <input type="text" name="EMAIL" /></td></tr>
	  <tr><td>Display Email Id: <input type="radio" name="disp_email"  class="none" checked="checked" value="1"/>Yes<input type="radio" name="disp_email"  class="none" value="0"/>No</td></tr>
      <tr><td><span class="star">*</span>&nbsp;City: <input type="text" name="Location" /></td></tr>
      <tr><td>Message: <textarea name="message"></textarea></td></tr>
      <tr><td><input name="submit" type="submit" value="Submit" class="send_button"/></td></tr>
	   <tr><td align="left"><div style="color: rgb(97, 96, 96); padding-bottom: 20px; border-top:2px solid #eaeaea; font-weight:normal"><br/><span style="color: rgb(0, 0, 0);"><strong>Disclaimer:</strong></span><br>Please note that all your comments, feedback and suggestions are published on our websites unless found libellous, inciteful, defamatory, vulgar, pornographic and abusive. We also like to specify that the comments are views of the surfers alone and do not necessarily reflect those of the India Today Group. </div></td></tr>
    </table>
</form></td></tr>
</table>
<div style="height:12px;"></div>
<%@ include file="othercategories.html"%>
<%@include file="hotzone.html"%>
<%@ include file="bottomnav.html"%>
<%@include file="googleanalytics_bottom.jsp"%></body>
</html>