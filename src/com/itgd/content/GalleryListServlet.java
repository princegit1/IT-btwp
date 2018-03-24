package com.itgd.content;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itgd.utils.Constants;

public class GalleryListServlet extends HttpServlet {

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

		int id = 0;
		int currentPageNumber = 1;
		String pagePath="";
		pagePath=request.getRequestURI();
		String pageToRedirect=Constants.GALLERY_LIST;	
		try {
			String[] tokens = pagePath.split("\\/");
/*			for(int i=0; i<tokens.length; i++) {
				System.out.println(i + "  --  " + tokens[i]);
			}
*/			String tempId = tokens[tokens.length-1];
			if(tempId.indexOf(".") > 0)
				tempId = tempId.substring(0, tempId.indexOf("."));
			id=Integer.parseInt(tempId);
			currentPageNumber=Integer.parseInt(tokens[tokens.length-2]);
			if(currentPageNumber<=1)
				currentPageNumber=1;

			request.setAttribute("categoryId",id);
			request.setAttribute("currentPageNo",currentPageNumber);
		} catch(Exception ex) {
			System.out.println("errorSource->"+pagePath+" -- errorReason->"+ex.toString());
			pageToRedirect=Constants.PAGE_NOT_FOUND;
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(pageToRedirect);
        dispatcher.forward(request, response);
	}
}
