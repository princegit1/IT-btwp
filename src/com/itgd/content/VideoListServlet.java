package com.itgd.content;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class VideoListServlet extends HttpServlet
{

    public VideoListServlet()
    {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        int categoryId = 42;
        int currentPage = 1;
        String pagePath = "";
        pagePath = request.getRequestURI();
        String pageToRedirect = "/videolist.jsp";
        try
        {
            String tokens[] = pagePath.split("\\/");
            for(int i = 0; i < tokens.length; i++)
            {
                System.out.println((new StringBuilder(String.valueOf(i))).append("  --  ").append(tokens[i]).toString());
            }

            String tempId = tokens[tokens.length - 1];
            if(tempId.indexOf(".") > 0)
            {
                tempId = tempId.substring(0, tempId.indexOf("."));
            }
            categoryId = Integer.parseInt(tempId);
            currentPage = Integer.parseInt(tokens[tokens.length - 2]);
            if(currentPage <= 1)
            {
                currentPage = 1;
            }
            request.setAttribute("videoCategoryId", Integer.valueOf(categoryId));
            request.setAttribute("currentVideoCategoryPageNo", Integer.valueOf(currentPage));
        }
        catch(Exception ex)
        {
            System.out.println((new StringBuilder("errorSource->")).append(pagePath).append(" -- errorReason->").append(ex.toString()).toString());
            pageToRedirect = "/pagenotfound.jsp";
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(pageToRedirect);
        dispatcher.forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
        out.println("<HTML>");
        out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
        out.println("  <BODY>");
        out.print("    This is ");
        out.print(getClass());
        out.println(", using the POST method");
        out.println("  </BODY>");
        out.println("</HTML>");
        out.flush();
        out.close();
    }
}
