package com.itgd.utils;

import java.text.CharacterIterator;
import java.text.StringCharacterIterator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtil {
	public static String replaceSpCharacters(String strToReplace) {
		String replacedString =  null;
		if(!isBlank(strToReplace)) {
			replacedString = strToReplace.replaceAll("&rsquo;", "\'").replaceAll("&lsquo;","\'").replaceAll("&nbsp;"," ").replaceAll("&mdash;","-").replaceAll("&hellip;","...").replaceAll("&#39;","'").replaceAll("&ndash;","-").replaceAll("&ldquo;", "\'").replaceAll("&minus;", "\'").replaceAll("&rdquo;", "\'").replaceAll("&eacute;", "E ").replaceAll("&agrave;", " ").replaceAll("&lt;", "<").replaceAll("&gt;", ">").replaceAll("&hellip;","...").replaceAll("_blank","'_blank'").replaceAll("<STRONG>","").replaceAll("</STRONG>","").replaceAll("<BR>","<BR />").replaceAll("<br>","<br />").replaceAll("&","and");
		} else {
			replacedString = "";
		}		
		return replacedString;
	}

	public static String replaceSpCharactersTitle(String strToReplace) {
		String replacedString = null;
		if(!isBlank(strToReplace)) {
			replacedString =  strToReplace.replaceAll("&rsquo;", "\'").replaceAll("&lsquo;","\'").replaceAll("&nbsp;"," ").replaceAll("&mdash;","-").replaceAll("&hellip;","...").replaceAll("&ndash;","-").replaceAll("&ldquo;", "\'").replaceAll("&minus;", "\'").replaceAll("&rdquo;", "\'").replaceAll("&eacute;", "E ").replaceAll("&agrave;", " ").replaceAll("&lt;", "<").replaceAll("&gt;", ">").replaceAll("&hellip;","...");
			replacedString =  replacedString.replaceAll("-"," ").replaceAll(".html","").replaceAll("&#39;","'").replaceAll("39;","'").replaceAll("mosimage", "").replaceAll("mospagebreak", "").replaceAll("{mosimage}", "").replaceAll("{mospagebreak}", "").replaceAll("[{}]", "");
		} else {
			replacedString = "";
		}
		return replacedString;
	}
	
	public static String isEmpty(String value) {
		if(isBlank(value)) {
			return "";
		} else { 
			return value.trim();
		}
	}
	
	public static boolean isBlank(String value) {
		if(value == null || value == "" || value == " " || value == "null") {
			return true;
		} else if(value != null && value.trim().length() == 0){
			return true;
		} else {
			return false;
		}
	}
	
	public static boolean isBlank(StringBuilder value) {
		if(value == null) {
			return true;
		} else if(value != null && value.length() == 0){
			return true;
		} else {
			return false;
		}
	}
	public static boolean isBlank(String[] value) {
		if(value == null) {
			return true;
		} else if(value != null && value.length == 0){
			return true;
		} else {
			return false;
		}
	}
	
	public static boolean isInteger(String value) {
		try {
			if(!StringUtil.isBlank(value) && value.trim().length() > 0) {
				Integer.parseInt(value.trim());
			}
			if(StringUtil.isBlank(value))
				return false;
		} catch (NumberFormatException nfex) {
			return false;
		}
		return true;
	}
	
	public static String replaceSingleQuote(String value) {
		if(!isBlank(value)) {
			value = value.replaceAll("\'", "");
		}
		return value;
	}
	
	public static String htmlChunks(String fullbodytext,String htmlText, String htmlFormat) {
		String htmlData = "";
		String completeHtmlData = "";
		htmlText = forRegex(htmlText);
		String[] htmlDataArray = (htmlText.trim()).split("\\~");
		int noOfQuotes = htmlDataArray.length;
		String textFormat = htmlFormat.replace("{", "\\{").replace("}", "\\}");
		try {
			for(int k=0;k<noOfQuotes ;k++)	
			{
				completeHtmlData = htmlDataArray[k];
				Pattern pa = Pattern.compile(textFormat);
				Matcher matcher = pa.matcher(fullbodytext);
				fullbodytext = matcher.replaceFirst(completeHtmlData);
				htmlData=fullbodytext;
			}
		} catch(Exception ee){
			ee.printStackTrace(); 
			htmlData = fullbodytext;
		}
		return htmlData;
	}
	private static String forRegex(String aRegexFragment) {
		final StringBuilder result = new StringBuilder();
		final StringCharacterIterator iterator =   new StringCharacterIterator(aRegexFragment);
        char character =  iterator.current();    
        while (character != CharacterIterator.DONE ){
	      /*
	       All literals need to have backslashes doubled.
	      */
	      if (character == '.') {
	        result.append("\\.");
	      }
	      else if (character == '\\') {
	        result.append("\\\\");
	      }
	      else if (character == '?') {
	        result.append("\\?");
	      }
	      else if (character == '*') {
	        result.append("\\*");
	      }
	      else if (character == '+') {
	        result.append("\\+");
	      }
	      else if (character == '&') {
	        result.append("\\&");
	      }
	      else if (character == ':') {
	        result.append("\\:");
	      }
	      else if (character == '{') {
	        result.append("\\{");
	      }
	      else if (character == '}') {
	        result.append("\\}");
	      }
	      else if (character == '[') {
	        result.append("\\[");
	      }
	      else if (character == ']') {
	        result.append("\\]");
	      }
	      else if (character == '(') {
	        result.append("\\(");
	      }
	      else if (character == ')') {
	        result.append("\\)");
	      }
	      else if (character == '^') {
	        result.append("\\^");
	      }
	      else if (character == '$') {
	        result.append("\\$");
	      }
	      else {
	        result.append(character);
	      }
	      character = iterator.next();
        }
	    return result.toString();
	 }
}
