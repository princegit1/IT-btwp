package com.itgd.content;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import com.itgd.utils.Constants;
public class CategoryServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CategoryServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

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
		String pageToRedirect=Constants.CATEGORY_PAGE;	
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

			request.setAttribute("sectionId",id); 
			request.setAttribute("currentPageNo",currentPageNumber);
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

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
