package com.itgd.content;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itgd.utils.Constants;

public class VideoSubListServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int subCategoryId = 0;
		int currentPage = 1;
		String pagePath="";
		String sefTitle="";
		pagePath=request.getRequestURI();
		try {
			//System.out.println("VideoListServlet----"+pagePath);
			String[] tokens = pagePath.split("\\/");
			if(tokens.length>=2) {
				sefTitle=tokens[2];					
			}
			if(tokens.length>=3) {
				currentPage=Integer.parseInt(tokens[3]);
				if(currentPage<=1)
					currentPage=1;
			} else {
				currentPage=1;
			}
			if(tokens.length>=4) {
				String tempsubCategoryId = tokens[4];
				if(tempsubCategoryId.indexOf(".") > 0)
					tempsubCategoryId = tempsubCategoryId.substring(0, tempsubCategoryId.indexOf("."));
				subCategoryId=Integer.parseInt(tempsubCategoryId);
			}
			System.out.println("*******subCategoryId----->"+subCategoryId);
			request.setAttribute("videosubCategoryId",subCategoryId);
			request.setAttribute("currentVideoCategoryPageNo",currentPage);

			RequestDispatcher dispatcher = request.getRequestDispatcher(Constants.VIDEO_SUBLIST); 
	        dispatcher.forward(request, response);
		} catch(Exception ex) {
			System.out.println("errorSource->"+pagePath+" -- errorReason->"+ex.toString());
			//response.sendRedirect(Constant.PAGE_NOT_FOUND);
		}
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
