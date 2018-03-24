<%!
public static final String SITE_URL = "http://m.businesstoday.in/";
public static final String cacheURL="http://m.businesstoday.in/";
public static final String SITE_BASEPATH = "http://m.businesstoday.in/";  
public static final String NO_IMG_88x66 = "http://media2.intoday.in/businesstoday_wap/resources/css/images/noimage_88x66.gif";
public static final String PHOTO_BASEPATH = "http://media2.intoday.in/btmt/images/Photo_gallery/";
public static final String STORY_IMAGE_BASEPATH = "http://media2.intoday.in/btmt/images/stories/";
public static final String BULLET_IMAGE_PATH = "http://media2.intoday.in/businesstoday_wap/resources/css/images/blue_squire_bullet.jpg";

public static final String S3_CSS_VER = "1.0.2";
public static final String S3_JS_VER = "1.0.0";
public static final String MEDIA_JS = "http://media2.intoday.in/businesstoday_wap/"+S3_JS_VER+"/resources/js/";
public static final String MEDIA_CSS = "http://media2.intoday.in/businesstoday_wap/"+S3_CSS_VER+"/resources/css/";



//Common Functions
String replaceSpCharacters(String strToReplace){
	String replacedString =  strToReplace.replaceAll("&rsquo;", "\'").replaceAll("&lsquo;","\'").replaceAll("&nbsp;"," ").replaceAll("&mdash;","-").replaceAll("&hellip;","...").replaceAll("&#39;","'").replaceAll("&ndash;","-").replaceAll("&ldquo;", "\'").replaceAll("&minus;", "\'").replaceAll("&rdquo;", "\'").replaceAll("&eacute;", "E ").replaceAll("&agrave;", " ").replaceAll("&lt;", "<").replaceAll("&gt;", ">").replaceAll("&quot;","'").replaceAll("&lsquo;","'");
	return replacedString;
}
String replaceSpCharactersTitle(String strToReplace) {
	String replacedString =  strToReplace.replaceAll("&rsquo;", "\'").replaceAll("&lsquo;","\'").replaceAll("&nbsp;"," ").replaceAll("&mdash;","-").replaceAll("&hellip;","...").replaceAll("&","&amp;").replaceAll("&ndash;","-").replaceAll("&ldquo;", "\'").replaceAll("&minus;", "\'").replaceAll("&rdquo;", "\'").replaceAll("&eacute;", "E ").replaceAll("&agrave;", " ").replaceAll("&lt;", "<").replaceAll("&gt;", ">").replaceAll("&hellip;","...");
	replacedString =  replacedString.replaceAll("-"," ").replaceAll(".html","").replaceAll("&#39;","'").replaceAll("39;","'");
	return replacedString;
}
public String stripNonValidXMLCharacters(String in) {
	StringBuffer out = new StringBuffer();
	char current; 

	if (in == null || ("".equals(in))) return "";
	for (int i = 0; i < in.length(); i++) {
		current = in.charAt(i); 
		if ((current == 0x9) ||
			(current == 0xA) ||
			(current == 0xD) ||
			((current >= 0x20) && (current <= 0xD7FF)) ||
			((current >= 0xE000) && (current <= 0xFFFD)) ||
			((current >= 0x10000) && (current <= 0x10FFFF)))
			out.append(current);
	}
	return out.toString();
}		%>