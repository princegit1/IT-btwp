package com.itgd.content;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class VideoServlet extends HttpServlet
{

    public VideoServlet()
    {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        int videoId = 0;
        String sefTitle = "";
        int currentPage = 1;
        String pagePath = "";
        pagePath = request.getRequestURI();
        String pageToRedirect = "/video.jsp";
        try
        {
            String tokens[] = pagePath.split("\\/");
            String tempStoryId = tokens[tokens.length - 1];
            if(tempStoryId.indexOf(".") > 0)
            {
                tempStoryId = tempStoryId.substring(0, tempStoryId.indexOf("."));
            }
            videoId = Integer.parseInt(tempStoryId);
            currentPage = Integer.parseInt(tokens[tokens.length - 2]);
            request.setAttribute("currentVideoId", Integer.valueOf(videoId));
            request.setAttribute("currentVideoPageNo", Integer.valueOf(currentPage));
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
