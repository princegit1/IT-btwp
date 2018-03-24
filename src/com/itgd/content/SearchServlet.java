package com.itgd.content;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

import com.itgd.utils.Constants;

public class SearchServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int currentPageNumber = 1;
		String searchingText = ""; 
		String contentType = "text"; 
		String pagePath=request.getRequestURI();
		String pageToRedirect=Constants.SEARCH_PAGE;	
		try {
			searchingText = request.getParameter("searchword");
			if(request.getParameter("contenttype")!=null)
				contentType = request.getParameter("contenttype");
			if(request.getParameter("cpage")!=null)
				currentPageNumber = Integer.parseInt(request.getParameter("cpage"));
			
			request.setAttribute("searchingText",searchingText);
			request.setAttribute("contentType",contentType);
			request.setAttribute("currentPageNumber",currentPageNumber);
			System.out.println("searchingText->"+searchingText);
			System.out.println("contentType->"+contentType);
			System.out.println("currentPageNumber->"+currentPageNumber);
		} catch(Exception ex) {
			System.out.println("errorSource->"+pagePath+" -- errorReason->"+ex.toString());
			pageToRedirect=Constants.PAGE_NOT_FOUND;
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(pageToRedirect);
        dispatcher.forward(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
