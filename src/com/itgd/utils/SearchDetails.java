package com.itgd.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.itgd.dto.ContentListDTO;

public class SearchDetails {
	public static ArrayList<ContentListDTO> searchResult(String searchedTxt, int searchlimit, String contenttype, String contentToRemove) throws Exception {
        ArrayList<ContentListDTO> contentList;
        Connection conn = null;
        PreparedStatement selectStmt = null;
        ResultSet rs = null;
        contentList = new ArrayList<ContentListDTO>();
        String strText = "'%" + searchedTxt + "%'";
        int intLimit = searchlimit;
        StringBuilder sb = null;
        sb = new StringBuilder();
        try {
            DbConnection dbconn = null;
            dbconn = DbConnection.getInstance("indiatoday");
            conn = dbconn.getConnection("indiatoday");
            String sql = "";
            String finalStr = "";
            String[] searchTextArray = null;
            String[] searchTextArrayFinal = null;
            searchTextArray = searchedTxt.contains(" ") ? searchedTxt.split(" ") : new String[]{searchedTxt};
            int i = 0;
            while (i < searchTextArray.length) {
                String[] textRemoved = contentToRemove.split("\\#");
                int j = 0;
                while (j < textRemoved.length) {
                    if (searchTextArray[i].toLowerCase().matches(textRemoved[j])) {
                        searchTextArray[i] = "";
                    }
                    ++j;
                }
                if (searchTextArray[i] != "") {
                    finalStr = String.valueOf(finalStr) + searchTextArray[i] + " ";
                }
                ++i;
            }
            finalStr = finalStr.trim();
            if (!contenttype.equals("photo")) {
                if (finalStr.contains(" ")) {
                    sb.append("(");
                    String[] tokens1 = finalStr.split(" ");
                    int k = 0;
                    while (k < tokens1.length) {
                        finalStr = tokens1[k];
                        sb.append("(c.metakey like '%" + finalStr + "%' or c.title_alias like  '%" + finalStr + "%' or c.metadesc like '%" + finalStr + "%' or c.byline like '%" + finalStr + "%')");
                        if (k != tokens1.length - 1) {
                            sb.append(" and ");
                        }
                        ++k;
                    }
                    sb.append(")");
                } else {
                    sb.append("(c.metakey like '%" + finalStr + "%' or c.title_alias like  '%" + finalStr + "%' or c.metadesc like '%" + finalStr + "%' or c.byline like '%" + finalStr + "%')");
                }
            } else if (finalStr.contains(" ")) {
                sb.append("(");
                String[] tokens1 = finalStr.split(" ");
                int k = 0;
                //System.out.println("726... CommonFunctions.java:: sb =======>> "+sb);
                while (k < tokens1.length) {
                    finalStr = tokens1[k];
                    sb.append("c.Gallery_name like '%" + finalStr + "%' or c.metakey like  '%" + finalStr + "%' or c.metadesc like '%" + finalStr + "%' ");
                    if (k != tokens1.length - 1) {
                        sb.append(" and ");
                    }
                    ++k;
                }
                sb.append(")");
                //System.out.println("736... CommonFunctions.java:: sb =======>> "+sb);
            } else {
            	//System.out.println("738... CommonFunctions.java:: sb =======>> "+sb);
                sb.append("(c.Gallery_name like '%" + finalStr + "%' or c.metakey like  '%" + finalStr + "%' or c.metadesc like '%" + finalStr + "%' )");
            }
            sql = contenttype.equals("video") ? "select c.id, c.title, c.sef_url, c.mobile_image, c.kicker_image_alt_text from jos_content c, jos_article_section a where a.section_id=161 and c.content_type=0 and " + sb.toString() + " and c.id=a.article_id and c.published=1 group by c.id order by c.id desc limit ?" : (contenttype.equals("photo") ? "select c.id, c.Gallery_name as title, c.Gallery_name as kicker_image_alt_text, c.sef_url, c.small_image as mobile_image from jos_gallerynames c, jos_sections a where " + sb.toString() + " and c.section_id=a.id and c.published=1 and c.Gallery_name not like '%href=%' group by c.id order by c.id desc limit ?" : "select c.id, c.title, c.sef_url, c.mobile_image, c.kicker_image_alt_text from jos_content c, jos_article_section a where c.content_type=0 and " + sb.toString() + " and c.id=a.article_id and c.published=1 and c.title not like '%href=%' group by c.id order by c.id desc limit ?");
            System.out.println("CommonFunction - Searched Query->" + sql);
            selectStmt = conn.prepareStatement(sql);
            selectStmt.setInt(1, intLimit);
            rs = selectStmt.executeQuery();
            while (rs.next()) {
                ContentListDTO searchdto = new ContentListDTO();
                searchdto.setId(rs.getInt("id"));
                searchdto.setTitle(rs.getString("title"));
                searchdto.setSefTitle(rs.getString("sef_url"));
                searchdto.setImage(rs.getString("mobile_image") == null ? "" : rs.getString("mobile_image"));
                searchdto.setImageAltText(rs.getString("kicker_image_alt_text") == null ? "" : rs.getString("kicker_image_alt_text"));
                searchdto.setContentType(contenttype);
                contentList.add(searchdto);
            }
        } catch (SQLException sqls) {
            System.out.println("IT WAP Search SQLException -> " + sqls);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (selectStmt != null) {
                selectStmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return contentList;
    }
}
