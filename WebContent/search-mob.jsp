<%@taglib uri="http://htmlcompressor.googlecode.com/taglib/compressor" prefix="compress" %>
<compress:html removeIntertagSpaces="true">
<%@ taglib uri="http://www.opensymphony.com/oscache" prefix="cache" %>
<%@ page import="com.itgd.util.DbConnection, com.itgd.util.CommonFunctions, com.itgd.util.Constant, com.itgd.helper.Search, java.sql.Connection, java.util.ArrayList, org.apache.lucene.document.Document,org.apache.lucene.document.Field, java.text.SimpleDateFormat, org.apache.lucene.search.ScoreDoc, com.itgd.util.StringUtil, org.apache.lucene.analysis.Analyzer, org.apache.lucene.analysis.standard.StandardAnalyzer, org.apache.lucene.search.SortField, org.apache.lucene.search.Sort, org.apache.lucene.search.IndexSearcher, org.apache.lucene.search.Query, org.apache.lucene.search.Hits, org.apache.lucene.queryParser.QueryParser, org.apache.lucene.store.Directory, org.apache.lucene.store.FSDirectory, org.apache.lucene.index.IndexWriter, org.apache.lucene.search.TopDocs, org.apache.lucene.index.Term, org.apache.lucene.index.IndexReader, java.util.Date, java.text.DateFormat, java.util.Comparator, java.text.NumberFormat"%>
<%!
	String PHOTO_INDEXPATH = "/opt/jboss-4.2.2.GA/server/default/deploy/lucenesearch.war/businesstoday/photo/";
	String PHOTOSECTION_INDEXPATH = "/opt/jboss-4.2.2.GA/server/default/deploy/lucenesearch.war/businesstoday/photosection/";
	String STORY_INDEXPATH = "/opt/jboss-4.2.2.GA/server/default/deploy/lucenesearch.war/businesstoday/story/";
	String STORYSECTION_INDEXPATH = "/opt/jboss-4.2.2.GA/server/default/deploy/lucenesearch.war/businesstoday/storysection/";
	String VIDEO_INDEXPATH = "/opt/jboss-4.2.2.GA/server/default/deploy/lucenesearch.war/businesstoday/video/";
	String VIDEOSECTION_INDEXPATH = "/opt/jboss-4.2.2.GA/server/default/deploy/lucenesearch.war/businesstoday/videosection/";
	String SPECIAL_INDEXPATH = "/opt/jboss-4.2.2.GA/server/default/deploy/lucenesearch.war/businesstoday/special/";

	class ColumnComparator implements Comparator {
		int columnToSort;
		ColumnComparator(int columnToSort) {
			this.columnToSort = columnToSort;
		}
		//overriding compare method
		public int compare(Object o1, Object o2) {
			String[] row1 = (String[]) o1;
			String[] row2 = (String[]) o2;
			return row1[columnToSort].compareTo(row2[columnToSort]);
		}
	}	%>
<%
	String searchStatementSpecial = "";
	String[][] contentSpecialDisplayArray = null; //(id, title, sef title, content type, templatepath) 
	String searchTextConditionSpecial = "";

	String advancedSearchParameters = request.getQueryString();
	String advancedSearchCompleteURL = Constant.SITE_URL + "search.jsp?" + advancedSearchParameters;
	String contentBaseURL = Constant.SITE_URL;
	int pageCount = 1;
	int displayCountOnPage = 20;
	int displayPaginationCount = 5;
	int limitStart = 0;
	int limitEnd = displayCountOnPage;
	int lastPageNo = 0;
	String[] tempArray = null;
	String searchStatement = "";
	String searchStatementSection = "";
	int totalSearchResults = 0;
	String[][] contentDisplayArray = null; //(id, title, sef title, small image, small image alt text, introtext) 
	String[][] contentSectionDisplayArray = null; //(id, title, sef title, content type, templatepath) 
	//Code for Current Date START
	DateFormat year = new SimpleDateFormat("yyyy");
	DateFormat month = new SimpleDateFormat("M");
	DateFormat day = new SimpleDateFormat("d");
	String yearFinal = year.format(new Date());
	String monthFinal = month.format(new Date());
	if (monthFinal.length() == 1)
		monthFinal = "0" + monthFinal;
	String dayFinal = day.format(new Date());
	if (dayFinal.length() == 1)
		dayFinal = "0" + dayFinal;
	String currentDate = yearFinal + monthFinal + dayFinal;
	//Code for Current Date END

	//search criteria and parameters FROM
	String searchFileName = "search.jsp";
	String searchText = "";
	String searchWord = request.getParameter("searchword");
	String searchTextCondition = "";
	int byline = 0;
	//String searchPhrase = "any"; //any/all/exact
	String searchPhrase = "all"; //any/all/exact
	String searchType = "story"; //story/video/photo
	String searchSection = "";
	String startDate = "";
	String endDate = "";
	String startDateForm = "";
	String endDateForm = "";
	int currentPageNo = 1;
	String displayOrdering = "descending"; //ascending/descending
	searchText = StringUtil.isEmpty(request.getParameter("searchtext"));
	if (!StringUtil.isBlank(searchText)) {
		searchText = "\"" + searchText + "\"";
		if (searchText.equals("Search..."))
			searchText = "";
	}
	if (!StringUtil.isBlank(searchWord)) {
		searchText = "\"" + searchWord + "\"";
		if (searchText.equals("Search..."))
			searchText = "";
	}
	
	searchText = searchText.toLowerCase().replaceAll("\\<.*?>","").replaceAll(" or "," ").replaceAll(" and "," ");
	searchText = searchText.replaceAll("\\s+", " ");
	searchText = searchText.replaceAll("\\<.*?>", "");
	searchText = searchText.replaceAll("\\:", "").replaceAll("\\@", "").replaceAll("http://", "");
	

	if (!StringUtil.isBlank(request.getParameter("search_type"))) {
		if (request.getParameter("search_type").equals("author"))
			byline = 1;
	}

	if (!StringUtil.isBlank(request.getParameter("search_type"))) {
		if (request.getParameter("search_type").equals("edition"))
			byline = 2;
	}

	if (!StringUtil.isBlank(request.getParameter("searchphrase"))) {
		searchPhrase = request.getParameter("searchphrase");
		if (!searchPhrase.equals("exact") && !searchPhrase.equals("all") && !searchPhrase.equals("any"))
			searchPhrase = "exact";
	}
	if (!StringUtil.isBlank(request.getParameter("searchtype"))) {
		searchType = request.getParameter("searchtype");
	}
	//Modified dated on 13-01-2015 to overcome NullPointerException
	if ("text".equals(searchType))
		searchType = "story";
	//if(byline==1)
	//searchType="author";
	//else if(byline==1)
	//searchType="edition";
	//else
	//searchType="story";

	if (!StringUtil.isBlank(request.getParameter("section"))) {
		searchSection = request.getParameter("section");
	}
	if (!StringUtil.isBlank(request.getParameter("fromdate"))) {
		startDateForm = request.getParameter("fromdate");
		startDate = request.getParameter("fromdate").replaceAll("-", "").replaceAll("\\<.*?>", "").replaceAll("\\:", "\\\\:").replaceAll("\\@", "").replaceAll("http://", "");
	}
	if (!StringUtil.isBlank(request.getParameter("todate"))) {
		endDateForm = request.getParameter("fromdate");
		endDate = request.getParameter("todate").replaceAll("-", "").replaceAll("\\<.*?>", "").replaceAll("\\:", "\\\\:").replaceAll("\\@", "").replaceAll("http://", "");
	}
	// Added New logic added to remove NumberFormatException in below code for page = X
	String requestedSearchPageNum = StringUtil.isEmpty(request.getParameter("page"));
	if (!StringUtil.isBlank(requestedSearchPageNum)) {
		currentPageNo = StringUtil.isInteger(requestedSearchPageNum)?Integer.parseInt(requestedSearchPageNum):1;
	}
	// Finish New logic added to remove NumberFormatException in below code for page = X
	searchText = searchText.replaceAll("\\s+", " ");
	searchText = searchText.replace("\"", "");
	if (searchText.contains("/Money Today")) {
		searchText = searchText.replace("/Money Today", "");
	}
	String searchURL = searchFileName;
	String searchURLTab = searchFileName;
	if (searchText.trim().length() > 0) {
		searchURL = searchURL + "?searchtext=" + searchText.trim();
		if (byline == 1)
			searchURL = searchURL + "&byline=" + byline + "&search_type=author";
		//if(byline==2)
		//searchURL = searchURL + "&issueid>0";
		if (searchPhrase.trim().length() > 0)
			searchURL = searchURL + "&searchphrase=" + searchPhrase;
		if (searchSection.trim().length() > 0)
			searchURL = searchURL + "&section=" + searchSection;
		if (startDate.trim().length() > 0)
			searchURL = searchURL + "&startdate=" + startDate;
		if (endDate.trim().length() > 0)
			searchURL = searchURL + "&enddate=" + endDate;

		searchURLTab = searchURL;
		//Modified dated on 13-01-2015 to overcome NullPointerException
		if (searchType != null && searchType.trim().length() > 0)
			searchURL = searchURL + "&searchtype=" + searchType;
	} else {
		searchURL = "";
		if (startDate.trim().length() > 0)
			searchURL = searchURL + "?startdate=" + startDate;
		if (startDate.trim().length() > 0
				&& endDate.trim().length() > 0)
			searchURL = searchURL + "&enddate=" + endDate;
		if (startDate.trim().length() == 0
				&& endDate.trim().length() > 0)
			searchURL = searchURL + "?enddate=" + endDate;
		if (startDate.trim().length() == 0
				&& endDate.trim().length() == 0)
			searchURL = searchURL + "?startdate=" + currentDate
					+ "&enddate=" + currentDate;
		searchURLTab = searchURL;
	}
	//search criteria and parameters TILL
	searchStatement = searchText;
	if (!searchStatement.equals("")) {
		if (searchText.contains(" ") && searchPhrase.equals("exact")) {
			searchTextCondition = '"' + searchText + '"';
		} else if (searchText.contains(" ") && searchPhrase.equals("all")) {
			tempArray = searchText.split(" ");
			searchTextCondition = "";
			for (int i = 0; i < tempArray.length; i++) {
				searchTextCondition += tempArray[i];
				if (i < tempArray.length - 1)
					searchTextCondition += " AND ";
			}
		} else {
			tempArray = searchText.split(" ");
			searchTextCondition = "";
			for (int i = 0; i < tempArray.length; i++) {
				searchTextCondition += tempArray[i];
				if (i < tempArray.length - 1)
					searchTextCondition += " OR ";
			}
		}
		if (byline == 0) {
			if ("video".equals(searchType)) {//Modified dated on 13-01-2015 to overcome NullPointerException
				searchStatement = "(title:(" + searchTextCondition + ") metakeyword:(" + searchTextCondition + ") metadescription:(" + searchTextCondition + ") introtext:(" + searchTextCondition + ") byline:(" + searchTextCondition + ") city:(" + searchTextCondition + "))";
			} else if ("photo".equals(searchType)) {//Modified dated on 13-01-2015 to overcome NullPointerException
				searchStatement = "(title:(" + searchTextCondition + ") metakeyword:(" + searchTextCondition + ") metadescription:(" + searchTextCondition + ") byline:(" + searchTextCondition + ") photocaption:(" + searchTextCondition + ") photometakeyword:(" + searchTextCondition + ") photoalttext:(" + searchTextCondition + "))";
			} else {
				searchStatement = "(title:(" + searchTextCondition + ") metakeyword:(" + searchTextCondition + ") metadescription:(" + searchTextCondition + ") byline:(" + searchTextCondition + ") city:(" + searchTextCondition + ") fulltext:(" + searchTextCondition + ") introtext:(" + searchTextCondition + "))";
			}
		} else {
			searchStatement = " (byline:(" + searchTextCondition + "))";
		}
		String[] tempArraySpecial = null;
		tempArraySpecial = searchText.split(" ");
		searchTextConditionSpecial = "";
		for (int i = 0; i < tempArraySpecial.length; i++) {
			searchTextConditionSpecial += tempArraySpecial[i];
			if (i < tempArraySpecial.length - 1)
				searchTextConditionSpecial += " OR ";
		}
	}
	if (!searchStatement.equals("") && !startDate.equals("") && !endDate.equals("")) {
		searchStatement = searchStatement + " AND createddate:[" + startDate + " TO " + endDate + "]";
	} else if (!searchStatement.equals("") && !startDate.equals("") && endDate.equals("")) {
		searchStatement = searchStatement + " AND createddate:[" + startDate + " TO " + currentDate + "]";
	} else if (searchStatement.equals("") && !startDate.equals("") && !endDate.equals("")) {
		searchStatement = " createddate:[" + startDate + " TO " + endDate + "]";
	} else if (searchStatement.equals("") && !startDate.equals("") && endDate.equals("")) {
		searchStatement = " createddate:[" + startDate + " TO " + currentDate + "]";
	}
	if (searchStatement.trim().length() == 0) {
		searchStatement = " createddate:(" + currentDate + ")";
	}
	//Section search Function START
	//Modified dated on 13-01-2015 to overcome NullPointerException
	if (searchText != null && !searchText.trim().equals("")) {
		searchStatementSection = "(title:(" + searchTextCondition+ "))";
		searchStatementSpecial = "(title:("	+ searchTextConditionSpecial + ") metakeyword:("+ searchTextConditionSpecial + ") metadescription:("+ searchTextConditionSpecial + ") shortdescription:("+ searchTextConditionSpecial + "))";
		if ("video".equals(searchType)) {//Modified dated on 13-01-2015 to overcome NullPointerException
			try {
				IndexSearcher isS = new IndexSearcher(VIDEOSECTION_INDEXPATH);
				Analyzer analyzerS = new StandardAnalyzer();
				QueryParser parserS = new QueryParser("id", analyzerS);
				Query queryS = parserS.parse(searchStatementSection);
				Hits hitsS = isS.search(queryS);
				totalSearchResults = hitsS.length();
				contentSectionDisplayArray = new String[totalSearchResults][4];
				for (int i = 0; i < totalSearchResults; i++) {
					Document docS = hitsS.doc(i);
					contentSectionDisplayArray[i][0] = docS.get("id");
					contentSectionDisplayArray[i][1] = docS.get("title");
					contentSectionDisplayArray[i][2] = docS.get("seftitle");
					contentSectionDisplayArray[i][3] = docS.get("templatepath").trim().length() == 0 ? "" : docS.get("templatepath");
				}
				isS.close();
			} catch (Exception ee) {
				System.out.println("video section search display -> "
						+ ee.toString());
			} finally {
			}
		} else if ("photo".equals(searchType)) {//Modified dated on 13-01-2015 to overcome NullPointerException
			try {
				IndexSearcher isS = new IndexSearcher(PHOTOSECTION_INDEXPATH);
				Analyzer analyzerS = new StandardAnalyzer();
				QueryParser parserS = new QueryParser("id", analyzerS);
				Query queryS = parserS.parse(searchStatementSection);
				Hits hitsS = isS.search(queryS);
				totalSearchResults = hitsS.length();
				contentSectionDisplayArray = new String[totalSearchResults][3];
				for (int i = 0; i < totalSearchResults; i++) {
					Document docS = hitsS.doc(i);
					contentSectionDisplayArray[i][0] = docS.get("id");
					contentSectionDisplayArray[i][1] = docS.get("title");
					contentSectionDisplayArray[i][2] = docS.get("seftitle");
				}
				isS.close();
			} catch (Exception ee) {
				System.out.println("photo section search display -> " + ee.toString());
			} finally {
			}
		} else {
			try {
				IndexSearcher isS = new IndexSearcher(STORYSECTION_INDEXPATH);
				Analyzer analyzerS = new StandardAnalyzer();
				QueryParser parserS = new QueryParser("id", analyzerS);
				Query queryS = parserS.parse(searchStatementSection);
				Hits hitsS = isS.search(queryS);
				totalSearchResults = hitsS.length();
				contentSectionDisplayArray = new String[totalSearchResults][5];
				for (int i = 0; i < totalSearchResults; i++) {
					Document docS = hitsS.doc(i);
					contentSectionDisplayArray[i][0] = docS.get("id");
					contentSectionDisplayArray[i][1] = docS.get("title");
					contentSectionDisplayArray[i][2] = docS.get("seftitle");
					contentSectionDisplayArray[i][3] = docS.get("templatepath");
					contentSectionDisplayArray[i][4] = docS.get("contenttype");
				}
				isS.close();
			} catch (Exception ee) {
				System.out.println("photo section search display -> " + ee.toString());
			} finally {
			}
			try {
				IndexSearcher isSp = new IndexSearcher(SPECIAL_INDEXPATH);
				Analyzer analyzerSp = new StandardAnalyzer();
				QueryParser parserSp = new QueryParser("title",	analyzerSp);
				Query querySp = parserSp.parse(searchStatementSpecial);
				Hits hitsSp = isSp.search(querySp);
				totalSearchResults = hitsSp.length();
				contentSpecialDisplayArray = new String[totalSearchResults][2];
				for (int i = 0; i < totalSearchResults; i++) {
					Document docSp = hitsSp.doc(i);
					contentSpecialDisplayArray[i][0] = docSp.get("title");
					contentSpecialDisplayArray[i][1] = docSp.get("url");
				}
				isSp.close();
			} catch (Exception ee) {
				System.out.println("special search display -> "+ ee.toString());
			} finally {
			}
		}
	}
	//Section search Function END

	//Modified dated on 13-01-2015 to overcome NullPointerException
	if (searchStatement != null && !searchStatement.trim().equals("")) {
		if ("video".equals(searchType)) { //Modified dated on 13-01-2015 to overcome NullPointerException
			try {
				IndexSearcher is = new IndexSearcher(VIDEO_INDEXPATH);
				Analyzer analyzer = new StandardAnalyzer();
				QueryParser parser = new QueryParser("id", analyzer);
				Query query = parser.parse(searchStatement);
				SortField sortField = new SortField("createddatetime", true);
				Sort sort = new Sort(sortField);
				TopDocs results = is.search(query, null, 500000, sort);
				totalSearchResults = results.totalHits;
				if (totalSearchResults % displayCountOnPage == 0) {
					pageCount = totalSearchResults / displayCountOnPage;
				} else {
					pageCount = (totalSearchResults / displayCountOnPage) + 1;
				}
				lastPageNo = pageCount;
				if (currentPageNo < 1 || currentPageNo > pageCount)
					currentPageNo = 1;
				limitStart = (currentPageNo - 1) * displayCountOnPage;

				if (currentPageNo == pageCount && totalSearchResults % displayCountOnPage != 0) {
					limitEnd = totalSearchResults % displayCountOnPage;
					contentDisplayArray = new String[limitEnd][10];
				} else {
					if (totalSearchResults >= displayCountOnPage) {
						contentDisplayArray = new String[displayCountOnPage][10];
					} else {
						contentDisplayArray = new String[totalSearchResults][10];
					}
				}
				ScoreDoc[] hits = null;
				if (results.totalHits > 0) {
					hits = results.scoreDocs;
				}
				for (int i = 0, ctr = 0; i < totalSearchResults && ctr < limitEnd; i++) {
					int tempCtr = hits[i].doc;
					Document doc = is.doc(tempCtr);
					if (i >= limitStart) {
						contentDisplayArray[ctr][0] = doc.get("id");
						contentDisplayArray[ctr][1] = doc.get("title");
						contentDisplayArray[ctr][2] = doc.get("seftitle");
						contentDisplayArray[ctr][3] = doc.get("byline").trim().length() == 0 ? "" : doc.get("byline");
						contentDisplayArray[ctr][4] = doc.get("city").trim().length() == 0 ? "" : doc.get("city");
						contentDisplayArray[ctr][5] = doc.get("createddatedisplay").trim().length() == 0 ? "" : doc.get("createddatedisplay");
						contentDisplayArray[ctr][6] = doc.get("image").trim().length() == 0 ? "" : doc.get("image");
						contentDisplayArray[ctr][7] = doc.get("imagealttext").trim().length() == 0 ? "": doc.get("imagealttext");
						contentDisplayArray[ctr][8] = doc.get("introtext").trim().length() == 0 ? "": doc.get("introtext");
						contentDisplayArray[ctr][9] = doc.get("contenttype");
						ctr++;
					}
				}
				is.close();
				hits = null;
			} catch (Exception ee) {
				System.out.println("photo_search.jsp -> "
						+ ee.toString());
			} finally {
			}
		} else if ("photo".equals(searchType)) {//Modified dated on 13-01-2015 to overcome NullPointerException
			try {
				IndexSearcher is = new IndexSearcher(PHOTO_INDEXPATH);
				Analyzer analyzer = new StandardAnalyzer();
				QueryParser parser = new QueryParser("id", analyzer);
				Query query = parser.parse(searchStatement);
				SortField sortField = new SortField("createddatetime", true);
				Sort sort = new Sort(sortField);
				TopDocs results = is.search(query, null, 500000, sort);
				totalSearchResults = results.totalHits;

				if (totalSearchResults % displayCountOnPage == 0) {
					pageCount = totalSearchResults / displayCountOnPage;
				} else {
					pageCount = (totalSearchResults / displayCountOnPage) + 1;
				}
				lastPageNo = pageCount;
				if (currentPageNo < 1 || currentPageNo > pageCount)
					currentPageNo = 1;
				limitStart = (currentPageNo - 1) * displayCountOnPage;

				if (currentPageNo == pageCount
						&& totalSearchResults % displayCountOnPage != 0) {
					limitEnd = totalSearchResults % displayCountOnPage;
					contentDisplayArray = new String[limitEnd][6];
				} else {
					if (totalSearchResults >= displayCountOnPage) {
						contentDisplayArray = new String[displayCountOnPage][6];
					} else {
						contentDisplayArray = new String[totalSearchResults][6];
					}
				}

				ScoreDoc[] hits = null;
				if (results.totalHits > 0) {
					hits = results.scoreDocs;
				}

				for (int i = 0, ctr = 0; i < totalSearchResults && ctr < limitEnd; i++) {
					int tempCtr = hits[i].doc;
					 Document doc = is.doc(tempCtr);
					//Document doc = hits.doc(i);
					if (i >= limitStart) {
						contentDisplayArray[ctr][0] = doc.get("id");
						contentDisplayArray[ctr][1] = doc.get("title");
						contentDisplayArray[ctr][2] = doc.get("seftitle");
						contentDisplayArray[ctr][3] = doc.get("createddatedisplay").trim()
								.length() == 0 ? "" : doc.get("createddatedisplay");
						contentDisplayArray[ctr][4] = doc.get("image").trim().length() == 0 ? "" : doc.get("image");
						contentDisplayArray[ctr][5] = doc.get("introtext").trim().length() == 0 ? "" : doc.get("introtext");
						ctr++;
					}
				}
				is.close();
				hits = null;
			} catch (Exception ee) {
				System.out.println("photo_search.jsp -> " + ee.toString());
			} finally {
			}
		} else {
			try {
				IndexSearcher is = new IndexSearcher(STORY_INDEXPATH);
				Analyzer analyzer = new StandardAnalyzer();
				QueryParser parser = new QueryParser("id", analyzer);
				Query query = parser.parse(searchStatement);
				SortField sortField = new SortField("id", true);
				Sort sort = new Sort(sortField);
				TopDocs results = is.search(query, null, 500000, sort);
				totalSearchResults = results.totalHits;

				if (totalSearchResults % displayCountOnPage == 0) {
					pageCount = totalSearchResults / displayCountOnPage;
				} else {
					pageCount = (totalSearchResults / displayCountOnPage) + 1;
				}
				lastPageNo = pageCount;
				if (currentPageNo < 1 || currentPageNo > pageCount)
					currentPageNo = 1;
				limitStart = (currentPageNo - 1) * displayCountOnPage;

				if (currentPageNo == pageCount && totalSearchResults % displayCountOnPage != 0) {
					limitEnd = totalSearchResults % displayCountOnPage;
					contentDisplayArray = new String[limitEnd][12];
				} else {
					if (totalSearchResults >= displayCountOnPage) {
						contentDisplayArray = new String[displayCountOnPage][12];
					} else {
						contentDisplayArray = new String[totalSearchResults][12];
					}
				}
				ScoreDoc[] hits = null;
				if (results.totalHits > 0) {
					hits = results.scoreDocs;
				}

				for (int i = 0, ctr = 0; i < totalSearchResults && ctr < limitEnd; i++) {
					//Document doc = hits.doc(i);
					int tempCtr = hits[i].doc;
					Document doc = is.doc(tempCtr);
					if (i >= limitStart) {
						contentDisplayArray[ctr][0] = doc.get("id");
						contentDisplayArray[ctr][1] = doc.get("title");
						contentDisplayArray[ctr][2] = doc.get("seftitle");
						contentDisplayArray[ctr][3] = doc.get("byline").trim().length() == 0 ? "" : doc.get("byline");
						contentDisplayArray[ctr][4] = doc.get("city").trim().length() == 0 ? "" : doc.get("city");
						contentDisplayArray[ctr][5] = doc.get("createddatedisplay").trim().length() == 0 ? "" : doc.get("createddatedisplay");
						contentDisplayArray[ctr][6] = doc.get("image").trim().length() == 0 ? "" : doc.get("image");
						contentDisplayArray[ctr][7] = doc.get("imagealttext").trim().length() == 0 ? "": doc.get("imagealttext");
						contentDisplayArray[ctr][8] = doc.get("introtext").trim().length() == 0 ? "": doc.get("introtext");
						contentDisplayArray[ctr][9] = doc.get("issueid").trim().length() == 0 ? "": doc.get("issueid");
						contentDisplayArray[ctr][10] = doc.get("issuedate").trim().length() == 0 ? "": doc.get("issuedate");
						contentDisplayArray[ctr][11] = doc.get("issuestatus").trim().length() == 0 ? "": doc.get("issuestatus");
						ctr++;
					}
				}
				is.close();
				hits = null;
			} catch (Exception ee) {
				System.out.println("story_search.jsp -> "
						+ ee.toString());
			} finally {
			}
		}
	}
%>
<cache:cache key="<%=advancedSearchCompleteURL%>" scope="application " time="611" refresh="t" >
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">   
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="ga.jsp"/>
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Business Today: Latest Business News, India economy News, Stock Markets, Sensex, Mutual Funds and Indian Tax </title> 
<meta name="keywords" content="Latest Business News from top companies in India or World, Indian economy News, Sensex updates, BSE, NSE, stock exchange news. All about Mutual Funds, investing in India, new market. Daily stock markets news, insurance, income tax filing information from Business Today. Specials on Best B-schools, BT 500 list, Best companies in India." />
<meta name="description" content="Business news, India business news today, stock markets news, financial news, business news headlines, business news online site, BSE new, NSE new top business news, stock news, latest finance news india, top companies, Sensex, Mutual Funds, India Tax, Tax filing, saral, Insurance, loans. Best B-schools, Best B-schools in India, BT 500, top 500 companies in india, best companies in India." />
<meta name="robots" content="noindex, nofollow" />
<link href="<%=Constant.SITE_URL + Constant.CSS_PATH%>common.css" rel="stylesheet" type="text/css" />
<link href="<%=Constant.SITE_URL + Constant.CSS_PATH%>default.css" rel="stylesheet" type="text/css" />
<link href="<%=Constant.SITE_URL + Constant.CSS_PATH %>search.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=Constant.SITE_URL + Constant.JS_PATH %>ddtabmenu.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="<%=Constant.SITE_URL + Constant.CSS_PATH%>calendar-mos.css" title="green" />
<script language="JavaScript" src="<%=Constant.SITE_URL + Constant.JS_PATH %>calc.js" type="text/javascript"></script>
<!-- import the calendar script -->
<script type="text/javascript" src="<%=Constant.SITE_URL + Constant.JS_PATH %>calendar_mini.js"></script>
<!-- import the language module -->
<script type="text/javascript" src="<%=Constant.SITE_URL + Constant.JS_PATH %>calendar-en.js"></script>
<script type="text/javascript" src="<%=Constant.SITE_URL + Constant.JS_PATH %>search.js"></script>
 <link href='http://fonts.googleapis.com/css?family=Roboto:700,500,400,900,300,200,100' rel='stylesheet' type='text/css' />
<script src="http://media2.intoday.in/businesstoday/js/jquery.min.1.8.2.js" type="text/javascript"></script>
<link href="<%=Constant.SITE_URL + Constant.CSS_PATH %>homepage-new.css" type="text/css" rel="stylesheet" />
  <link href="<%=Constant.SITE_URL + Constant.CSS_PATH %>responsive.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
ddtabmenu.definemenu("ddtabs3", 0);
</script>
<style>
table#register, .normalsearchtext_search, .normalsearchtext, #searchinner #search_inner .pagenate{ font-family:roboto;} .normalsearchtext_search, .normalsearchtext{ font-size:15px;}
#search_page .searchinfo fieldset{ background:#fff; padding:10px; width:641px;}
#search_page .searchinfo fieldset a{color: #004990; font: 500 16px/25px roboto; text-decoration: none;}
#search_page .searchinfo fieldset a:hover{font: 500 16px/25px roboto;text-decoration: none;}
#search_page .searchinfo fieldset span{ font-size:13px; padding:5px 0; font-family:roboto; line-height:18px;}
#searchinner #search_inner a{ padding:0px 5px; font-family:roboto;}
#search_page input{ margin-right:8px;}
.searchtext_result h3{ font-size:17px;}
 </style>
</head>
<body>
<div id="container">     
<!-- Top Nav Start -->
<!-- Top Nav End -->
<!-- Middle page + Right Navigation Page Satrt -->
<script>
 	function validatesearchad(modsearch) {
		var srchtextvalue = document.getElementById(modsearch);
		if(srchtextvalue.value=='') { alert('Please enter text to search.'); return false;	}
		if(srchtextvalue.value!='') {
			if(srchtextvalue.value!='') {
				var x=srchtextvalue.value;	var y = '';	var iChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.- ";
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
<div id="page">
<div id="searchlisting">
<div id="pathway" style="margin:0px 0 10px 0;"> <div class="pathone"><a href="<%=Constant.SITE_URL%>">Home</a></div> <div class="pathtwo"><span class="selected">Search</span></div></div>
<div id="search_page">
<%
		if (contentDisplayArray != null && contentDisplayArray.length > 0) {
			int dispFrom = (currentPageNo - 1) * displayCountOnPage + 1;
			int dispTill = currentPageNo * displayCountOnPage;
			if (totalSearchResults <= dispTill)
				dispTill = totalSearchResults;
%>
<!-- <form action="search.jsp" method="post"  >-->
<table id="register" width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody><tr>
<td class="searchtext_result" style="padding-left: 10px; font-family:roboto;" align="left">
<br>
<%	if (searchText != null && !"null".equals(searchText)) {  %>
<h3>Total <%=NumberFormat.getIntegerInstance().format(totalSearchResults) %> results found. Search for <b>[ <%=searchText%> ]</b></h3> 
<% 	} else {  %>
<h3>Total <%=NumberFormat.getIntegerInstance().format(totalSearchResults) %> results found. Search for <b>[ <%=StringUtil.isEmpty(searchText)%> ]</b></h3> 
<% 	} %>
</td></tr></tbody></table>

<table id="register" border="0" cellpadding="0" cellspacing="0">
<tbody><tr><td class="searchtext_result" style="text-align: left; height: 30px;padding-left: 10px; font-family:roboto;">
Results <%	out.print(dispFrom + "-" + dispTill + " of "+ NumberFormat.getIntegerInstance().format(totalSearchResults));	%>
</tr></tbody></table>
<table id="register" border="0" cellpadding="0" cellspacing="0">
<tbody><tr>
<td class="searchinfo">
<% if (currentPageNo == 1) {
	if (contentSpecialDisplayArray != null) {
		for (int i = 0; i < contentSpecialDisplayArray.length; i++) {
			out.print("<fieldset style=\"margin: 8px 0pt;\"> <div class=\"search_title\">	<h2>");
			out.print("<span><font color=\"#FF0000\" SIZE=\"2\">Special</font></span>: <a href=\""+ contentSpecialDisplayArray[i][1]+ "\" target=\"_blank\">"+ contentSpecialDisplayArray[i][0]+ "</a>");
			out.print("</h2></div></fieldset>");
		}
	}
	if (contentSectionDisplayArray != null) {
		if ("story".equals(searchType)) {//Modified dated on 13-01-2015 to overcome NullPointerException
			for (int i = 0; i < contentSectionDisplayArray.length; i++) {
				out.print("<fieldset style=\"margin: 8px 0pt;\"> <div class=\"search_title\">	<h2>");
				if (contentSectionDisplayArray[i][4].equals("section")) {
					if (contentSectionDisplayArray[i][0].equals("168")) {
						out.print("<a href=\""+Constant.SITE_URL+"debatelist/168/1/b-school-debate.html\">"+ contentSectionDisplayArray[i][1]+ "</a>");
					} else {
						out.print("<a href=\""+ CommonFunctions.sectionListingURL(Integer.parseInt(contentSectionDisplayArray[i][0]),1,contentSectionDisplayArray[i][2])+ "\">"+ contentSectionDisplayArray[i][1]+ "</a>");
					}
				} else if (contentSectionDisplayArray[i][4].equals("category")) {
					out.print("<a href=\""+ CommonFunctions.categoryListingURL(Integer.parseInt(contentSectionDisplayArray[i][0]),	1,	contentSectionDisplayArray[i][2]) + "\">"+ contentSectionDisplayArray[i][1]	+ "</a>");
				}
				out.print("</h2></div></fieldset>");
			}
		}
		if ("photo".equals(searchType)) {//Modified dated on 13-01-2015 to overcome NullPointerException
			for (int i = 0; i < contentSectionDisplayArray.length; i++) {
				out.print("<fieldset style=\"margin: 8px 0pt;\"> <div class=\"search_title\">	<h2><a href=\""	+ contentBaseURL+ CommonFunctions.galleryURL(contentSectionDisplayArray[i][2],1,Integer.parseInt(contentSectionDisplayArray[i][0]))	+ "\">"+ contentSectionDisplayArray[i][1]+ "</a></h2></div></fieldset>");
			}
		}
		if ("video".equals(searchType)) {//Modified dated on 13-01-2015 to overcome NullPointerException
			for (int i = 0; i < contentSectionDisplayArray.length; i++) {
				out.print("<fieldset style=\"margin: 8px 0pt;\"> <div class=\"search_title\">	<h2><a href=\""+ contentBaseURL+ CommonFunctions.videoListURL(contentSectionDisplayArray[i][2], 1, Integer.parseInt(contentSectionDisplayArray[i][0])) + "\">" + contentSectionDisplayArray[i][1] + "</a></h2></div></fieldset>");
			}
		}
	}
}
if ("video".equals(searchType)) { //Modified dated on 13-01-2015 to overcome NullPointerException
for (int i = 0; i < contentDisplayArray.length; i++) {
	String videoTempURL = CommonFunctions.videoURL(contentDisplayArray[i][2], 1, Integer.parseInt(contentDisplayArray[i][0]));			%>
	<fieldset style="margin: 8px 0pt;"> 
	<div class="search_title">	<h2><a href="<%=videoTempURL%>"><%=contentDisplayArray[i][1]%></a></h2></div>
	<%
		if ((byline == 1 && !contentDisplayArray[i][3].equals("")) || !contentDisplayArray[i][4].equals("") || !contentDisplayArray[i][5].equals("")) {
							if (byline == 1	&& !contentDisplayArray[i][3].equals("")) {
								out.print("<span class=\"highlight\"  style=\"color:#d71920;font-weight:bold;font-size:13px\">" + contentDisplayArray[i][3] + "</span><br/>");
							}
							if (!contentDisplayArray[i][4].equals("") || !contentDisplayArray[i][5].equals("")) {
								out.print("<span>");
								if (!contentDisplayArray[i][4].equals(""))
									out.print(contentDisplayArray[i][4]);
								if (!contentDisplayArray[i][4].equals("") && !contentDisplayArray[i][5].equals(""))
									out.print(", ");
								if (!contentDisplayArray[i][5].equals(""))
									out.print(contentDisplayArray[i][5]);
								out.print("</span><br/>");
							} 
						}
						out.print("<div style=\"font:400 15px/20px roboto; text-decoration: none; padding:5px 0 0; color:#5e5e5e;\">");
						if ("photo".equals(searchType)) {//Modified dated on 13-01-2015 to overcome NullPointerException
							if (!contentDisplayArray[i][1].equals("null")) {
								out.print(contentDisplayArray[i][1]);
							}
						} else {
							if (!contentDisplayArray[i][8].equals("null")) {
								out.print(contentDisplayArray[i][8]);
							}
						}
						out.print("</div></fieldset><div class=\"clear\"></div>");
					}
	} else if ("photo".equals(searchType)) {//Modified dated on 13-01-2015 to overcome NullPointerException

	for (int i = 0; i < contentDisplayArray.length; i++) {
%>
	<fieldset style="margin: 8px 0pt;"> <div class="search_title">	<h2>
    	
	<a href="<%=CommonFunctions.galleryURL(
									contentDisplayArray[i][2], 1,
									Integer.parseInt(contentDisplayArray[i][0]))%>"><%=contentDisplayArray[i][1]%></a></h2></div>
<%
	out.print("<div style=\"font: 400 15px/20px roboto; text-decoration: none;color:#5e5e5e;\">");
					if ("photo".equals(searchType)) {//Modified dated on 13-01-2015 to overcome NullPointerException
						if (!contentDisplayArray[i][5].equals("null")) {
							out.print(contentDisplayArray[i][5]);
						}
					} else {
						if (!contentDisplayArray[i][8].equals("null")) {
							out.print(contentDisplayArray[i][8]);
						}
					}
					out.print("</div></fieldset><div class=\"clear\"></div>");
				}
			} else {
				for (int i = 0; i < contentDisplayArray.length; i++) {
				String storyUrl = CommonFunctions.suggestedStoryUrl(Integer.parseInt(contentDisplayArray[i][0]));
					if(!StringUtil.isBlank(storyUrl)) { %>		
		<fieldset style="margin: 8px 0pt;"> <div class="search_title">
		<!-- for bschool debate  -->	
		<%
				if (contentDisplayArray[i][0].equals("201097") || contentDisplayArray[i][0].equals("200279") || contentDisplayArray[i][0].equals("199254")) {
			%><h2><a href="<%=Constant.SITE_URL %>debate/<%=contentDisplayArray[i][0]%>/<%=contentDisplayArray[i][2]%>" target="_blank"><%=contentDisplayArray[i][1]%></a></h2><%
				} else {   %>
					<h2><a href="<%= Constant.SITE_URL + storyUrl %>" target="_blank"><%=contentDisplayArray[i][1]%></a></h2>
<%				}	%>
</div>
<%	if ((byline == 1 && !StringUtil.isBlank(contentDisplayArray[i][3])) || !StringUtil.isBlank(contentDisplayArray[i][4]) || !StringUtil.isBlank(contentDisplayArray[i][5])) {		
		if (!StringUtil.isBlank(contentDisplayArray[i][3]) && ("Aprajita Sharma".equalsIgnoreCase(contentDisplayArray[i][3]) || "Alokesh Bhattacharyya".equalsIgnoreCase(contentDisplayArray[i][3]))) {		%>
			<a href="<%= Constant.SITE_URL + "author/" + contentDisplayArray[i][3].toLowerCase().replace(Constant.SPACE, Constant.MINUS) %>" target="_blank"><span class="highlight" style="color:#d71920;font-weight:bold; font-size:13px"><%=contentDisplayArray[i][3] %></span></a><br/>
<%		} else {
			String[] andSeparator = null;
			if(contentDisplayArray[i][3].contains(Constant.AND)) {
				andSeparator = new String[2];
				andSeparator = contentDisplayArray[i][3].split(Constant.AND);
			}
			if(!StringUtil.isBlank(andSeparator) && andSeparator.length > 1 && ("Alokesh Bhattacharyya".equalsIgnoreCase(andSeparator[0]) || "Aprajita Sharma".equalsIgnoreCase(andSeparator[0]))) {	%>
				<a href="<%= Constant.SITE_URL + "author/" + andSeparator[0].toLowerCase().replace(Constant.SPACE, Constant.MINUS) %>" target="_blank"><span class="highlight" style="color:#d71920;font-weight:bold; font-size:13px"><%=andSeparator[0] %></span></a><span class="highlight" style="color:#d71920;font-weight:bold; font-size:13px"> and <%=andSeparator[1] %></span><br/>
<%			} else if(!StringUtil.isBlank(andSeparator) && andSeparator.length > 1 && ("Alokesh Bhattacharyya".equalsIgnoreCase(andSeparator[1]) || "Aprajita Sharma".equalsIgnoreCase(andSeparator[1]))) {	%>
				<span class="highlight" style="color:#d71920;font-weight:bold; font-size:13px"><%=andSeparator[0] %> and </span><a href="<%= Constant.SITE_URL + "author/" + andSeparator[1].toLowerCase().replace(Constant.SPACE, Constant.MINUS) %>" target="_blank"><span class="highlight" style="color:#d71920;font-weight:bold; font-size:13px"><%=andSeparator[1] %></span></a><br/>
<%			} else {	%>
				<span class="highlight" style="color:#d71920;font-weight:bold; font-size:13px"><%= contentDisplayArray[i][3] %></span><br/>
<%			}
		}
		if (!StringUtil.isBlank(contentDisplayArray[i][4]) || !StringUtil.isBlank(contentDisplayArray[i][5])) {		%>
			<span>
<%				if (!StringUtil.isBlank(contentDisplayArray[i][4])) { 	
					out.print(contentDisplayArray[i][4]);
				}
				if (!StringUtil.isBlank(contentDisplayArray[i][4]) && !StringUtil.isBlank(contentDisplayArray[i][5])) {
					out.print(", ");
				}
				if (!StringUtil.isBlank(contentDisplayArray[i][5])) {
					if (!StringUtil.isBlank(contentDisplayArray[i][9]) && Integer.parseInt(contentDisplayArray[i][9]) > 0) {
						if (!StringUtil.isBlank(contentDisplayArray[i][10]) && !Constant.ZERO.equalsIgnoreCase(contentDisplayArray[i][10])) {	%>
							<strong>Edition:</strong><%= contentDisplayArray[i][10] %>
<%						} else {
							out.print(contentDisplayArray[i][5]);
						}
					} else {
						out.print(contentDisplayArray[i][5]);
					}
				}	%>
			</span><br/>
<%		}
	}	%>
	<div style="font: 400 15px/20px roboto; text-decoration: none; padding:5px 0 0; color:#5e5e5e;">
<%	if ("photo".equals(searchType)) {//Modified dated on 13-01-2015 to overcome NullPointerException
		if (!StringUtil.isBlank(contentDisplayArray[i][1])) {
			out.print(contentDisplayArray[i][1]);
		}
	} else {
		if (!StringUtil.isBlank(contentDisplayArray[i][8])) {
			out.print(contentDisplayArray[i][8]);
		}
	}	%>
	</div></fieldset><div class="clear"></div>
<%	}	// End-if 
	} // End For loop
}	// End Else Loop		%>
</td>
</tr >
<tr><td colspan="3" height="5"></td></tr>
<tr>
<td colspan="3" align="center">
<div id="searchinner">
<div id="search_inner" style="padding-bottom:9px;">
<span class="pagenate">PAGES  <%=currentPageNo%>  OF  <%=lastPageNo%>&nbsp;&nbsp;</span>  
<%  	}  %>
<%
	if (searchURL.contains("\""))
			searchURL = searchURL.replace("\"", "");
		if (currentPageNo > 1)
			out.println("<a href=\""+ Constant.SITE_URL + searchURL+ "&page=1\"><img src='images/arw1.gif' style='margin:8px 10px -5px 5px; border:none;'/></a>");

		int nextPageNo = (((currentPageNo % displayPaginationCount) == 0 ? (currentPageNo / displayPaginationCount): (currentPageNo / displayPaginationCount) + 1) * displayPaginationCount) + 1;
		int previousPageNo = (((currentPageNo % displayPaginationCount) != 0 ? (currentPageNo / displayPaginationCount) - 1: (currentPageNo / displayPaginationCount) - 2) * displayPaginationCount) + 1;
		int dispPageCountFrom = (((currentPageNo % displayPaginationCount) != 0 ? (currentPageNo / displayPaginationCount): (currentPageNo / displayPaginationCount) - 1) * displayPaginationCount) + 1;
		if (currentPageNo > displayPaginationCount)
			out.println("<a href=\""+ Constant.SITE_URL + searchURL+ "&page="+ previousPageNo+ "\"><img src='images/arw3.gif' style='margin:8px 10px -5px 5px; border:none;'/></a>");
		if (lastPageNo > 1) {
			for (int pageNo = dispPageCountFrom; pageNo < dispPageCountFrom + displayPaginationCount; pageNo++) {
				if (pageNo == currentPageNo)
					out.println("<a href=\""+ Constant.SITE_URL + searchURL+ "&page="+ pageNo+ "\" style=\"cursor: pointer; color: red\">"+ pageNo + "</a>");
				else if (pageNo <= lastPageNo && pageNo != currentPageNo)
					out.println("<a href=\""+ Constant.SITE_URL + searchURL + "&page=" + pageNo + "\" style=\"cursor: pointer; color: black\">" + pageNo + "</a>");
			}
		}
		if (nextPageNo <= lastPageNo)
			out.println("<a href=\"" + Constant.SITE_URL + searchURL + "&page=" + nextPageNo + "\"><img src='images/arw4.gif' style='margin:8px 10px -5px 5px; border:none;'/></a>");

		if (currentPageNo < lastPageNo)
			out.println("<a href=\"" + Constant.SITE_URL + searchURL + "&page=" + lastPageNo + "\"><img src='images/arw2.gif' style='margin:8px 10px -5px 5px; border:none;'/></a>");
%>
</td>
</tr>
</tbody></table>
<form action="search.jsp" name="searchform" method="get" id="searchform" onSubmit="return validatesearchad('search_searchwordd')">
<div style="margin-top: 10px;">
<table width="100%" bgcolor="#fff" cellpadding="0" cellspacing="0">
<tbody><tr><td>
<div id="overDiv" style="position: absolute; visibility: hidden; z-index: 10000;"></div>


<!-- import the calendar script -->
<table id="register" style="border: 1px solid #bababa; margin: 0px 0pt 0pt 0px;" width="100%" align="left" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0">
<tbody><tr>
<td colspan="2"></td>
</tr>
<tr>
<td colspan="4" height="8"></td>
</tr> 
<tr valign="middle">
<td class="normalsearchtext_search" style="padding-left: 15px;" width="25%">
<label for="search_searchword">
Search Keyword </label>			  </td>
<td colspan="3" class="normalsearchtext" width="75%" nowrap="nowrap">
<%	if (searchText == null || searchText.equals("") || searchText.equals("null")) {	%>
<input class="topnav_searchtext" value="" size="20" id="search_searchwordd" name="searchword"  type="text" style="border:1px solid #D0D0D0;padding:2px 5px;">
<%	} else {	%>
<input class="topnav_searchtext" value="<%=searchText%>" size="20" id="search_searchwordd" name="searchword"  type="text" style="border:1px solid #D0D0D0;">
<%	}	%>			
<%	if (request.getParameter("search_type") == null || request.getParameter("search_type").equals("") || request.getParameter("search_type").equals("null")) {			%>
<input class="none" name="search_type" value="article" checked="checked" type="radio">&nbsp;By Stories &nbsp;
<input class="none" name="search_type" value="author" type="radio">&nbsp;By Author &nbsp;
<!--<input class="none" name="search_type" value="edition" type="radio"> &nbsp;By Edition-->
<%	} else {	%>
<%	if (request.getParameter("search_type").equals("author")) {	%>
<input class="none" name="search_type" value="article"  type="radio">&nbsp;By Stories &nbsp;
<input class="none" name="search_type" value="author" checked="checked" type="radio">&nbsp;By Author &nbsp;
<!--<input class="none" name="search_type" value="edition" type="radio"> &nbsp;By Edition-->
<%	} else if (request.getParameter("search_type").equals("article")) {		%>
<input class="none" name="search_type" value="article"  checked="checked" type="radio">&nbsp;By Stories &nbsp;
<input class="none" name="search_type" value="author"  type="radio">&nbsp;By Author &nbsp;
<!--<input class="none" name="search_type" value="edition" type="radio"> &nbsp;By Edition-->
<%	} else if (request.getParameter("search_type").equals("edition")) {	%>
<input class="none" name="search_type" value="article"   type="radio">&nbsp;By Stories &nbsp;
<input class="none" name="search_type" value="author"  type="radio">&nbsp;By Author &nbsp;
<!--<input class="none" name="search_type" value="edition" checked="checked" type="radio"> &nbsp;By Edition-->
<%	}	}	%>
</td>
</tr>
<tr>
<td height="8" colspan="4"></td>
</tr> 
<tr>
<td height="1" colspan="4" bgcolor="#dddddd"></td>
</tr>
<tr>
<td height="8" colspan="4"></td>   
</tr> 
<tr>
<td class="normalsearchtext_search" style="padding-left: 15px;" width="25%">Search Parameter</td>
<td colspan="3" class="normalsearchtext"><span>
<%	if (request.getParameter("searchphrase") == null || request.getParameter("searchphrase").equals("")	|| request.getParameter("searchphrase").equals("null")) {	%>
<input class="none" name="searchphrase" id="searchphraseany" value="any"  type="radio"> 
<label for="searchphraseany">Any words </label> 
<input class="none" name="searchphrase" id="searchphraseall" value="all" checked="checked" type="radio">
<label	for="searchphraseall">All words</label> 
<input class="none" name="searchphrase" id="searchphraseexact" value="exact" type="radio">
<label	for="searchphraseexact">Exact phrase</label> 
<% 	} else {	 %>
<%	if (request.getParameter("searchphrase").equals("any")) {	%>
<input class="none" name="searchphrase" id="searchphraseany" value="any" checked="checked" type="radio"> 
<label for="searchphraseany">Any words </label> 
<input class="none" name="searchphrase" id="searchphraseall" value="all"  type="radio">
<label	for="searchphraseall">All words</label> 
<input class="none" name="searchphrase" id="searchphraseexact" value="exact" type="radio"><label>Exact phrase</label> 
<% 	} else if (request.getParameter("searchphrase").equals("all")) {	 %>
<input class="none" name="searchphrase" id="searchphraseany" value="any" type="radio"> 
<label for="searchphraseany">Any words </label> 
<input class="none" name="searchphrase" id="searchphraseall" value="all" checked="checked" type="radio">
<label	for="searchphraseall">All words</label> 
<input class="none" name="searchphrase" id="searchphraseexact" value="exact" type="radio"><label>Exact phrase</label> 
<% 	} else if (request.getParameter("searchphrase").equals("exact")) {	 %>
<input class="none" name="searchphrase" id="searchphraseany" value="any"  type="radio"> 
<label for="searchphraseany">Any words </label> 
<input class="none" name="searchphrase" id="searchphraseall" value="all"  type="radio">
<label	for="searchphraseall">All words</label> 
<input class="none" name="searchphrase" id="searchphraseexact" value="exact" checked="checked" type="radio"><label>Exact phrase</label> 
<% 	} 	}	 %>
</span></td>
</tr>	
<tr>
<td colspan="4" height="8"></td>
</tr> 
<tr>
<td colspan="4" bgcolor="#dddddd" height="1"></td>
</tr>
<tr>
<td colspan="4" height="8"></td>
</tr> 
<tr valign="middle">
<td class="normalsearchtext_search" style="padding-left: 15px;">
<label for="search_ordering">
Date				</label>				</td>
<td class="normalsearchtext">From  <% if (startDate == null || startDate.equals("") || startDate.equals("null")) {	%>
<input name="fromdate" id="fromdate" readonly="readonly" size="12" maxlength="19" value="" type="text">
<%	} else {	%>
<input name="fromdate" id="fromdate" readonly="readonly" size="12" maxlength="19" value='<%=startDateForm%>' type="text">
<%	}	%>
<input class="button_search" value="..." onClick="return showCalendar('fromdate', 'y-mm-dd');" type="reset">
<%	if (endDate == null || endDate.equals("") || endDate.equals("null")) {	%>
<input name="todate" id="todate" readonly="readonly" size="12" maxlength="19" value="" type="text">
<%	} else {	%>
<input name="todate" id="todate" readonly="readonly" size="12" maxlength="19" value='<%=endDateForm%>' type="text">
<%	}	%>
<input class="button_search" value="..." onClick="return showCalendar('todate', 'y-mm-dd');" type="reset"> (yyyy-mm-dd)	
</tr>
<tr>
<td colspan="4" height="8"></td>
</tr>
<tr>
<td colspan="4" bgcolor="#dddddd" height="1"></td>
</tr>

<tr valign="middle">
<td class="normalsearchtext_search" style="padding-left: 15px;">
<label for="search_ordering">
Search Order				</label>				</td>
<td class="normalsearchtext">
<select name="ordering" id="search_ordering">
<% if (request.getParameter("ordering") == null	|| request.getParameter("ordering").equals("")	|| request.getParameter("ordering").equals("null")) {	%>
<option value="newest" selected="selected">Newest first</option>
<option value="oldest">Oldest first	</option>
<option value="alpha">Alphabetical</option>
<%	} else {	%>
<%	if (request.getParameter("ordering").equals("newest")) {	%>
<option value="newest" selected="selected">Newest first</option>
<option value="oldest">Oldest first	</option>
<option value="alpha">Alphabetical</option>
<%	} else if (request.getParameter("ordering").equals("oldest")) {		%>
<option value="newest" >Newest first</option>
<option value="oldest" selected="selected">Oldest first	</option>
<option value="alpha">Alphabetical</option>
<%	} else if (request.getParameter("ordering").equals("alpha")) {	%>
<option value="newest" >Newest first</option>
<option value="oldest">Oldest first	</option>
<option value="alpha" selected="selected">Alphabetical</option>
<%	}	}	%>
</select>
</td>
</tr>
<tr valign="middle">
<td colspan="2"></td>
</tr>
<tr>
<td colspan="4" height="8"></td>
</tr> 
<tr>
<td colspan="4" bgcolor="#dddddd" height="1"></td>
</tr>
<tr>
<td colspan="4" height="8"></td>
</tr> 
<tr>
<td style="padding-left: 130px;"></td>
<td align="left"><input name="submit" value="" class="send_button_search" type="submit"></td>
</tr>
<tr><td colspan="2" height="10"></td></tr>
</table>
</td></tr></tbody></table>
</div>
</form>
<br>
<%	if (totalSearchResults == 0) {	%><h3>Total 0 results found. Search for [<%=searchText%>]</h3><%	}	%>
</div>
</div>
<!-- Right Navigation Start -->
<div id="sidebar">

</div>
<!-- Right Navigation Ends -->
</div>
<!-- Middle page + Right Navigation Page Ends -->
<!-- Footer Navigation Starts -->

<!-- Footer Navigation Ends -->
</div>
</body>
</html>
</cache:cache>
</compress:html>