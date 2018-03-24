package com.itgd.utils;

import com.itgd.dto.PathwayDTO;
import java.io.PrintStream;
import java.sql.*;
import java.util.ArrayList;

// Referenced classes of package com.itgd.utils:
//            DbConnection, StringUtil

public class UrlRedirectUtil
{

    public UrlRedirectUtil()
    {
    }

    public static ArrayList pathwayContent(int storyId)
        throws Exception
    {
        Connection conn;
        PreparedStatement pstmt;
        ResultSet rs;
        PathwayDTO pathwayDTO;
        ArrayList pathwayData;
        int pcatlength;
        String pcat[];
        String pathwayid;
        String storySefUrl;
        int issueid;
        int magazineid;
        conn = null;
        pstmt = null;
        rs = null;
        pathwayDTO = null;
        pathwayData = new ArrayList();
        String selectQuery = "";
        pcatlength = 0;
        pcat = (String[])null;
        pathwayid = "";
        storySefUrl = "";
        issueid = 0;
        magazineid = 0;
        try
        {
            DbConnection conn1 = DbConnection.getInstance("businesstoday");
            conn = conn1.getConnection("businesstoday");
            selectQuery = "SELECT c.primary_category,c.sef_url,c.issueid,c.magazineid FROM jos_content c WH" +
"ERE c.content_type='text' and c.id=?  and c.published=1 group by c.id"
;
            pstmt = conn.prepareStatement(selectQuery);
            pstmt.setInt(1, storyId);
            for(rs = pstmt.executeQuery(); rs.next();)
            {
                pathwayid = StringUtil.isEmpty(rs.getString("primary_category"));
                storySefUrl = StringUtil.isEmpty(rs.getString("sef_url"));
                issueid = rs.getInt("issueid");
                magazineid = rs.getInt("magazineid");
            }

            if(!StringUtil.isBlank(pathwayid))
            {
                if(pathwayid.indexOf("#") > 0)
                {
                    pcat = pathwayid.split("#");
                } else
                {
                    pcat = new String[1];
                    pcat[0] = pathwayid;
                }
                pcatlength = pcat.length;
            }
            rs = null;
            pstmt = null;
            switch(pcatlength)
            {
            case 4: // '\004'
                String pselectStmt4 = "SELECT sec.id as sectionid, sec.title as sectiontitle, sec.name as sectionname, " +
"sec.issue_free, sec.magazineid, cat.id as categoryid, cat.title as categorytitle" +
", cat.name as categoryname, subcat.id as subcategoryid, subcat.title as subcateg" +
"orytitle, subcat.name as subcategoryname, sub_subcat.id as subsubcategoryid, sub" +
"_subcat.title as subsubcategorytitle, sub_subcat.name as subsubcategoryname FROM" +
" jos_sections sec, jos_categories cat, jos_subcategories subcat, jos_sub_subcate" +
"gories sub_subcat WHERE sub_subcat.id = ? AND sub_subcat.published = 1 AND sub_s" +
"ubcat.sub_category = subcat.id AND subcat.published = 1 AND subcat.category = ca" +
"t.id AND cat.published = 1 AND cat.section = sec.id AND sec.published = 1"
;
                pstmt = conn.prepareStatement(pselectStmt4);
                pstmt.setInt(1, Integer.parseInt(pcat[3]));
                for(rs = pstmt.executeQuery(); rs.next(); pathwayData.add(pathwayDTO))
                {
                    pathwayDTO = new PathwayDTO();
                    pathwayDTO.setSectionId1(rs.getInt("sectionid"));
                    pathwayDTO.setSectionName1(StringUtil.replaceSingleQuote(StringUtil.isEmpty(rs.getString("sectionname"))));
                    pathwayDTO.setSectionTitle(StringUtil.replaceSingleQuote(StringUtil.isEmpty(rs.getString("sectiontitle"))));
                    pathwayDTO.setSectionId2(rs.getInt("categoryid"));
                    pathwayDTO.setSectionName2(StringUtil.replaceSingleQuote(StringUtil.isEmpty(rs.getString("categoryname"))));
                    pathwayDTO.setCategoryTitle(StringUtil.replaceSingleQuote(StringUtil.isEmpty(rs.getString("categorytitle"))));
                    pathwayDTO.setSectionId3(rs.getInt("subcategoryid"));
                    pathwayDTO.setSectionName3(StringUtil.replaceSingleQuote(StringUtil.isEmpty(rs.getString("subcategoryname"))));
                    pathwayDTO.setSubCategoryTitle(StringUtil.replaceSingleQuote(StringUtil.isEmpty(rs.getString("subcategorytitle"))));
                    pathwayDTO.setSectionId4(rs.getInt("subsubcategoryid"));
                    pathwayDTO.setSectionName4(StringUtil.replaceSingleQuote(StringUtil.isEmpty(rs.getString("subsubcategoryname"))));
                    pathwayDTO.setSubSubCategoryTitle(StringUtil.replaceSingleQuote(StringUtil.isEmpty(rs.getString("subsubcategorytitle"))));
                    pathwayDTO.setStorySefUrl(storySefUrl);
                }

                break;

            case 3: // '\003'
                String pselectStmt3 = "SELECT sec.id as sectionid, sec.title as sectiontitle, sec.name as sectionname, " +
"sec.issue_free, sec.magazineid, cat.id as categoryid, cat.title as categorytitle" +
", cat.name as categoryname, subcat.id as subcategoryid, subcat.title as subcateg" +
"orytitle, subcat.name as subcategoryname FROM jos_sections sec, jos_categories c" +
"at, jos_subcategories subcat WHERE subcat.id = ? AND subcat.published = 1 AND su" +
"bcat.category = cat.id AND cat.published = 1 AND cat.section = sec.id AND sec.pu" +
"blished = 1"
;
                pstmt = conn.prepareStatement(pselectStmt3);
                pstmt.setInt(1, Integer.parseInt(pcat[2]));
                for(rs = pstmt.executeQuery(); rs.next(); pathwayData.add(pathwayDTO))
                {
                    pathwayDTO = new PathwayDTO();
                    pathwayDTO.setSectionId1(rs.getInt("sectionid"));
                    pathwayDTO.setSectionName1(StringUtil.replaceSingleQuote(StringUtil.isEmpty(rs.getString("sectionname"))));
                    pathwayDTO.setSectionTitle(StringUtil.replaceSingleQuote(StringUtil.isEmpty(rs.getString("sectiontitle"))));
                    pathwayDTO.setSectionId2(rs.getInt("categoryid"));
                    pathwayDTO.setSectionName2(StringUtil.replaceSingleQuote(StringUtil.isEmpty(rs.getString("categoryname"))));
                    pathwayDTO.setCategoryTitle(StringUtil.replaceSingleQuote(StringUtil.isEmpty(rs.getString("categorytitle"))));
                    pathwayDTO.setSectionId3(rs.getInt("subcategoryid"));
                    pathwayDTO.setSectionName3(StringUtil.replaceSingleQuote(StringUtil.isEmpty(rs.getString("subcategoryname"))));
                    pathwayDTO.setSubCategoryTitle(StringUtil.replaceSingleQuote(StringUtil.isEmpty(rs.getString("subcategorytitle"))));
                    pathwayDTO.setStorySefUrl(storySefUrl);
                }

                break;

            case 2: // '\002'
                String pselectStmt2 = "SELECT sec.id as sectionid, sec.title as sectiontitle, sec.name as sectionname, " +
"sec.issue_free, sec.magazineid, cat.id as categoryid, cat.title as categorytitle" +
", cat.name as categoryname FROM jos_sections sec, jos_categories cat WHERE cat.i" +
"d = ? AND cat.published = 1 AND cat.section = sec.id AND sec.published = 1"
;
                pstmt = conn.prepareStatement(pselectStmt2);
                pstmt.setInt(1, Integer.parseInt(pcat[1]));
                for(rs = pstmt.executeQuery(); rs.next(); pathwayData.add(pathwayDTO))
                {
                    pathwayDTO = new PathwayDTO();
                    pathwayDTO.setSectionId1(rs.getInt("sectionid"));
                    pathwayDTO.setSectionName1(StringUtil.replaceSingleQuote(StringUtil.isEmpty(rs.getString("sectionname"))));
                    pathwayDTO.setSectionTitle(StringUtil.isEmpty(rs.getString("sectiontitle")));
                    pathwayDTO.setSectionId2(rs.getInt("categoryid"));
                    pathwayDTO.setSectionName2(StringUtil.replaceSingleQuote(StringUtil.isEmpty(rs.getString("categoryname"))));
                    pathwayDTO.setCategoryTitle(StringUtil.replaceSingleQuote(StringUtil.isEmpty(rs.getString("categorytitle"))));
                    pathwayDTO.setStorySefUrl(storySefUrl);
                }

                break;

            case 1: // '\001'
                String pselectStmt1 = "SELECT s.id as sectionid, s.title as sectiontitle, s.issue_free, s.magazineid, s" +
".name as sectionname FROM jos_sections s WHERE s.id = ? AND s.published = 1"
;
                pstmt = conn.prepareStatement(pselectStmt1);
                pstmt.setInt(1, Integer.parseInt(pcat[0]));
                for(rs = pstmt.executeQuery(); rs.next(); pathwayData.add(pathwayDTO))
                {
                    pathwayDTO = new PathwayDTO();
                    pathwayDTO.setSectionId1(rs.getInt("sectionid"));
                    pathwayDTO.setSectionName1(StringUtil.replaceSingleQuote(StringUtil.isEmpty(rs.getString("sectionname"))));
                    pathwayDTO.setSectionTitle(StringUtil.isEmpty(rs.getString("sectiontitle")));
                    pathwayDTO.setStorySefUrl(storySefUrl);
                }

                break;
            }
            if(pcatlength > 0)
            {
                pathwayDTO.setIssueid(issueid);
                pathwayDTO.setMagazineid(magazineid);
            }
        }
        catch(SQLException sqls)
        {
            System.out.println((new StringBuilder("Pathway Content (Cat Length - ")).append(pcatlength).append(") SQLException (CommonFunctions.java) -> ").append(sqls).toString());
        }
        try
        {
            if(rs != null)
            {
                rs.close();
            }
            if(pstmt != null)
            {
                pstmt.close();
            }
            if(conn != null)
            {
                conn.close();
            }
        }
        catch(SQLException e)
        {
            System.out.println((new StringBuilder("BT-SQLException In common function finally block -> ")).append(e).toString());
        }
 
        try
        {
            if(rs != null)
            {
                rs.close();
            }
            if(pstmt != null)
            {
                pstmt.close();
            }
            if(conn != null)
            {
                conn.close();
            }
        }
        catch(SQLException e)
        {
            System.out.println((new StringBuilder("BT-SQLException In common function finally block -> ")).append(e).toString());
        }
      
        try
        {
            if(rs != null)
            {
                rs.close();
            }
            if(pstmt != null)
            {
                pstmt.close();
            }
            if(conn != null)
            {
                conn.close();
            }
        }
        catch(SQLException e)
        {
            System.out.println((new StringBuilder("BT-SQLException In common function finally block -> ")).append(e).toString());
        }
        return pathwayData;
    }

    public static String getVideoCategoryUrl(int videoId)
        throws Exception
    {
        Connection conn;
        PreparedStatement pstmt;
        ResultSet rs;
        PathwayDTO pathwayDTO;
        int pcatlength;
        String pcat[];
        String pathwayid;
        String storySefUrl;
        int issueid;
        int magazineid;
        conn = null;
        pstmt = null;
        rs = null;
        pathwayDTO = null;
        String selectQuery = "";
        pcatlength = 0;
        pcat = (String[])null;
        pathwayid = "";
        storySefUrl = "";
        issueid = 0;
        magazineid = 0;
        DbConnection conn1 = DbConnection.getInstance("businesstoday");
        conn = conn1.getConnection("businesstoday");
        try
        {
          selectQuery = "SELECT c.primary_category, c.sef_url, c.issueid, c.magazineid FROM jos_content c" +
" WHERE c.content_type = 'video' AND c.id = ? AND c.published = 1 GROUP BY c.id"
;
            pstmt = conn.prepareStatement(selectQuery);
            pstmt.setInt(1, videoId);
            for(rs = pstmt.executeQuery(); rs.next();)
            {
                pathwayid = StringUtil.isEmpty(rs.getString("primary_category"));
                storySefUrl = StringUtil.isEmpty(rs.getString("sef_url"));
                issueid = rs.getInt("issueid");
                magazineid = rs.getInt("magazineid");
            }

            if(pathwayid.indexOf("#") > 0)
            {
                pcat = pathwayid.split("#");
                pcatlength = pcat.length;
            } else
            if(!StringUtil.isBlank(pathwayid))
            {
                pcat = new String[1];
                pcat[0] = pathwayid;
                pcatlength = pcat.length;
            }
        }
        catch(SQLException sqlex)
        {
            System.out.println((new StringBuilder("Found SQLException in UrlRedirectUtil.getVideoCategoryUrl(int videoId): ")).append(sqlex.getMessage()).toString());
        }
        if(rs != null)
        {
            rs.close();
        }
        if(pstmt != null)
        {
            pstmt.close();
        }
        if(rs != null)
        {
            rs.close();
        }
        if(pstmt != null)
        {
            pstmt.close();
        }
        if(rs != null)
        {
            rs.close();
        }
        if(pstmt != null)
        {
            pstmt.close();
        }
        if(StringUtil.isBlank(pcat[0]))
        {
        }
        try
        {
            switch(pcatlength)
            {
            case 4: // '\004'
                String pselectStmt4 = "SELECT secUrlRedirectGetVideoCatUrlUrlRedirectGetVideoCatUrl.id as sectionid, se" +
"cUrlRedirectGetVideoCatUrl.title as sectiontitle, secUrlRedirectGetVideoCatUrl.n" +
"ame as sectionname, secUrlRedirectGetVideoCatUrl.issue_free, secUrlRedirectGetVi" +
"deoCatUrl.magazineid, cat.id as categoryid, cat.title as categorytitle, cat.name" +
" as categoryname, subcat.id as subcategoryid, subcat.title as subcategorytitle, " +
"subcat.name as subcategoryname, sub_subcat.id as subsubcategoryid, sub_subcat.ti" +
"tle as subsubcategorytitle, sub_subcat.name as subsubcategoryname FROM jos_secti" +
"ons secUrlRedirectGetVideoCatUrl, jos_categories cat, jos_subcategories subcat, " +
"jos_sub_subcategories sub_subcat WHERE sub_subcat.id = ? AND sub_subcat.publishe" +
"d = 1 AND sub_subcat.sub_category = subcat.id AND subcat.published = 1 AND subca" +
"t.category = cat.id AND cat.published = 1 AND cat.section = secUrlRedirectGetVid" +
"eoCatUrl.id AND secUrlRedirectGetVideoCatUrl.published = 1"
;
                pstmt = conn.prepareStatement(pselectStmt4);
                pstmt.setInt(1, Integer.parseInt(pcat[3]));
                for(rs = pstmt.executeQuery(); rs.next(); pathwayDTO.setRedirectVideoSefUrl((new StringBuilder(String.valueOf(pathwayDTO.getSectionName1()))).append("/").append(pathwayDTO.getSectionName2()).append("/").append(pathwayDTO.getSectionName3()).append("/").append(pathwayDTO.getSectionName4()).append("/").append(pathwayDTO.getStorySefUrl()).append("/").append(videoId).append(".html").toString()))
                {
                    pathwayDTO = new PathwayDTO();
                    pathwayDTO.setSectionId1(rs.getInt("sectionid"));
                    pathwayDTO.setSectionName1(StringUtil.isEmpty(StringUtil.replaceSingleQuote(rs.getString("sectionname"))).trim().toLowerCase().replaceAll(" ", "-"));
                    pathwayDTO.setSectionTitle(StringUtil.replaceSingleQuote(rs.getString("sectiontitle")));
                    pathwayDTO.setSectionId2(rs.getInt("categoryid"));
                    pathwayDTO.setSectionName2(StringUtil.isEmpty(StringUtil.replaceSingleQuote(rs.getString("categoryname"))).trim().toLowerCase().replaceAll(" ", "-"));
                    pathwayDTO.setCategoryTitle(StringUtil.replaceSingleQuote(rs.getString("categorytitle")));
                    pathwayDTO.setSectionId3(rs.getInt("subcategoryid"));
                    pathwayDTO.setSectionName3(StringUtil.isEmpty(StringUtil.replaceSingleQuote(rs.getString("subcategoryname"))).trim().toLowerCase().replaceAll(" ", "-"));
                    pathwayDTO.setSubCategoryTitle(StringUtil.replaceSingleQuote(rs.getString("subcategorytitle")));
                    pathwayDTO.setSectionId4(rs.getInt("subsubcategoryid"));
                    pathwayDTO.setSectionName4(StringUtil.isEmpty(StringUtil.replaceSingleQuote(rs.getString("subsubcategoryname"))).trim().toLowerCase().replaceAll(" ", "-"));
                    pathwayDTO.setSubSubCategoryTitle(StringUtil.replaceSingleQuote(rs.getString("subsubcategorytitle")));
                    if(!StringUtil.isBlank(storySefUrl) && storySefUrl.contains(".html"))
                    {
                        pathwayDTO.setStorySefUrl(storySefUrl.replace(".html", ""));
                    }
                }

                break;

            case 3: // '\003'
                String pselectStmt3 = "SELECT secUrlRedirectGetVideoCatUrl.id as sectionid, secUrlRedirectGetVideoCatUr" +
"l.title as sectiontitle, secUrlRedirectGetVideoCatUrl.name as sectionname, secUr" +
"lRedirectGetVideoCatUrl.issue_free, secUrlRedirectGetVideoCatUrl.magazineid, cat" +
".id as categoryid, cat.title as categorytitle, cat.name as categoryname, subcat." +
"id as subcategoryid, subcat.title as subcategorytitle, subcat.name as subcategor" +
"yname FROM jos_sections secUrlRedirectGetVideoCatUrl, jos_categories cat, jos_su" +
"bcategories subcat WHERE subcat.id = ? AND subcat.published = 1 AND subcat.categ" +
"ory = cat.id AND cat.published = 1 AND cat.section = secUrlRedirectGetVideoCatUr" +
"l.id AND secUrlRedirectGetVideoCatUrl.published = 1"
;
                pstmt = conn.prepareStatement(pselectStmt3);
                pstmt.setInt(1, Integer.parseInt(pcat[2]));
                for(rs = pstmt.executeQuery(); rs.next(); pathwayDTO.setRedirectVideoSefUrl((new StringBuilder(String.valueOf(pathwayDTO.getSectionName1()))).append("/").append(pathwayDTO.getSectionName2()).append("/").append(pathwayDTO.getSectionName3()).append("/").append(pathwayDTO.getStorySefUrl()).append("/").append(videoId).append(".html").toString()))
                {
                    pathwayDTO = new PathwayDTO();
                    pathwayDTO.setSectionId1(rs.getInt("sectionid"));
                    pathwayDTO.setSectionName1(StringUtil.isEmpty(StringUtil.replaceSingleQuote(rs.getString("sectionname"))).trim().toLowerCase().replaceAll(" ", "-"));
                    pathwayDTO.setSectionTitle(StringUtil.replaceSingleQuote(rs.getString("sectiontitle")));
                    pathwayDTO.setSectionId2(rs.getInt("categoryid"));
                    pathwayDTO.setSectionName2(StringUtil.isEmpty(StringUtil.replaceSingleQuote(rs.getString("categoryname"))).trim().toLowerCase().replaceAll(" ", "-"));
                    pathwayDTO.setCategoryTitle(StringUtil.replaceSingleQuote(rs.getString("categorytitle")));
                    pathwayDTO.setSectionId3(rs.getInt("subcategoryid"));
                    pathwayDTO.setSectionName3(StringUtil.isEmpty(StringUtil.replaceSingleQuote(rs.getString("subcategoryname"))).trim().toLowerCase().replaceAll(" ", "-"));
                    pathwayDTO.setSubCategoryTitle(StringUtil.replaceSingleQuote(rs.getString("subcategorytitle")));
                    if(!StringUtil.isBlank(storySefUrl) && storySefUrl.contains(".html"))
                    {
                        pathwayDTO.setStorySefUrl(storySefUrl.replace(".html", ""));
                    }
                }

                break;

            case 2: // '\002'
                String pselectStmt2 = "SELECT secUrlRedirectGetVideoCatUrl.id as sectionid, secUrlRedirectGetVideoCatUr" +
"l.title as sectiontitle, secUrlRedirectGetVideoCatUrl.name as sectionname, secUr" +
"lRedirectGetVideoCatUrl.issue_free, secUrlRedirectGetVideoCatUrl.magazineid, cat" +
".id as categoryid, cat.title as categorytitle, cat.name as categoryname FROM jos" +
"_sections secUrlRedirectGetVideoCatUrl, jos_categories cat WHERE cat.id = ? AND " +
"cat.published = 1 AND cat.section = secUrlRedirectGetVideoCatUrl.id AND secUrlRe" +
"directGetVideoCatUrl.published = 1"
;
                pstmt = conn.prepareStatement(pselectStmt2);
                pstmt.setInt(1, Integer.parseInt(pcat[1]));
                for(rs = pstmt.executeQuery(); rs.next(); pathwayDTO.setRedirectVideoSefUrl((new StringBuilder(String.valueOf(pathwayDTO.getSectionName1()))).append("/").append(pathwayDTO.getSectionName2()).append("/").append(pathwayDTO.getStorySefUrl()).append("/").append(videoId).append(".html").toString()))
                {
                    pathwayDTO = new PathwayDTO();
                    pathwayDTO.setSectionId1(rs.getInt("sectionid"));
                    pathwayDTO.setSectionName1(StringUtil.isEmpty(StringUtil.replaceSingleQuote(rs.getString("sectionname"))).trim().toLowerCase().replaceAll(" ", "-"));
                    pathwayDTO.setSectionTitle(rs.getString("sectiontitle"));
                    pathwayDTO.setSectionId2(rs.getInt("categoryid"));
                    pathwayDTO.setSectionName2(StringUtil.isEmpty(StringUtil.replaceSingleQuote(rs.getString("categoryname"))).trim().toLowerCase().replaceAll(" ", "-"));
                    pathwayDTO.setCategoryTitle(StringUtil.replaceSingleQuote(rs.getString("categorytitle")));
                    if(!StringUtil.isBlank(storySefUrl) && storySefUrl.contains(".html"))
                    {
                        pathwayDTO.setStorySefUrl(storySefUrl.replace(".html", ""));
                    }
                }

                break;

            case 1: // '\001'
                String pselectStmt1 = "SELECT s.id as sectionid, s.title as sectiontitle, s.issue_free, s.magazineid, s" +
".name as sectionname FROM jos_sections s WHERE s.id = ? AND s.published = 1"
;
                pstmt = conn.prepareStatement(pselectStmt1);
                pstmt.setInt(1, Integer.parseInt(pcat[0]));
                for(rs = pstmt.executeQuery(); rs.next(); pathwayDTO.setRedirectVideoSefUrl((new StringBuilder(String.valueOf(pathwayDTO.getSectionName1()))).append("/").append(pathwayDTO.getStorySefUrl()).append("/").append(videoId).append(".html").toString()))
                {
                    pathwayDTO = new PathwayDTO();
                    pathwayDTO.setSectionId1(rs.getInt("sectionid"));
                    pathwayDTO.setSectionName1(StringUtil.isEmpty(StringUtil.replaceSingleQuote(rs.getString("sectionname"))).trim().toLowerCase().replaceAll(" ", "-"));
                    pathwayDTO.setSectionTitle(rs.getString("sectiontitle"));
                    if(!StringUtil.isBlank(storySefUrl) && storySefUrl.contains(".html"))
                    {
                        pathwayDTO.setStorySefUrl(storySefUrl.replace(".html", ""));
                    }
                }

                break;
            }
            
        }
        catch(SQLException sqlex)
        {
            System.out.println((new StringBuilder("Found SQLException in UrlRedirectUtil.getVideoCategoryUrl(int videoId): ")).append(sqlex.getMessage()).toString());
        }
        if(rs != null)
        {
            rs.close();
        }

        if(pathwayDTO != null)
        {
            pathwayDTO.setIssueid(issueid);
            pathwayDTO.setMagazineid(magazineid);
        }

        try
        {
            if(rs != null)
            {
                rs.close();
            }
           
        }
        catch(SQLException ex)
        {
            System.out.println((new StringBuilder("Found SQLException in UrlRedirectUtil.getVideoCategoryUrl(int videoId): ")).append(ex.getMessage()).toString());
        }
        try
        {
            if(rs != null)
            {
                rs.close();
            }
            if(pstmt != null)
            {
                pstmt.close();
            }
            if(conn != null)
            {
                conn.close();
            }
        }
        catch(SQLException ex)
        {
            System.out.println((new StringBuilder("Found SQLException in UrlRedirectUtil.getVideoCategoryUrl(int videoId): ")).append(ex.getMessage()).toString());
        }
 
        try
        {
            if(rs != null)
            {
                rs.close();
            }
            if(pstmt != null)
            {
                pstmt.close();
            }
            if(conn != null)
            {
                conn.close();
            }
        }
        catch(SQLException ex)
        {
            System.out.println((new StringBuilder("Found SQLException in UrlRedirectUtil.getVideoCategoryUrl(int videoId): ")).append(ex.getMessage()).toString());
        }
        if(pathwayDTO != null)
        {
            return pathwayDTO.getRedirectVideoSefUrl();
        } else
        {
            return "";
        }
    }
}
