package com.itgd.content;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class VideoSectionServlet extends HttpServlet
{

    public VideoSectionServlet()
    {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        String pagePath = "";
        pagePath = request.getRequestURI();
        try
        {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/videosection.jsp");
            dispatcher.forward(request, response);
        }
        catch(Exception ex)
        {
            System.out.println((new StringBuilder("errorSource->")).append(pagePath).append(" -- errorReason->").append(pagePath).toString());
            response.sendRedirect("/pagenotfound.jsp");
        }
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
