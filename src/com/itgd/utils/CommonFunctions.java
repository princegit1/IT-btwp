package com.itgd.utils;

import com.itgd.dto.ContentListDTO;
import com.itgd.dto.PathwayDTO;
import com.itgd.dto.RelatedContentDTO;
import com.itgd.dto.StoryListDTO;
import com.itgd.utils.DbConnection;
import com.itgd.utils.StringUtil;
import com.itgd.utils.UrlRedirectUtil;
import java.io.PrintStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CommonFunctions {
    public static String suggestedVideoListURL(String primaryCatName) {
        if (primaryCatName != null && primaryCatName.contains(" ")) {
            primaryCatName = primaryCatName.trim().toLowerCase().replaceAll(" ", "-");
        } else if (primaryCatName != null && primaryCatName.length() > 0) {
            primaryCatName = primaryCatName.trim().toLowerCase();
        }
        return "videos/" + primaryCatName + "/";
    }

    public static String suggestedVideoURL(String videoSefTitle, int pageNum, int videoId, String videoCatTitle) {
        if (videoSefTitle != null && videoSefTitle.indexOf(".html") > 0) {
            videoSefTitle = videoSefTitle.replaceAll(".html", "");
        }
        if (videoCatTitle != null && videoCatTitle.contains(" ")) {
            videoCatTitle = videoCatTitle.trim().toLowerCase().replaceAll(" ", "-");
        } else if (videoCatTitle != null && videoCatTitle.length() > 0) {
            videoCatTitle = videoCatTitle.trim().toLowerCase();
        }
        return "videos/" + videoCatTitle + "/" + videoSefTitle + "/" + videoId + ".html";
    }

    public static String photoURL(int id, int photoNum, String sefUrl) {
        String photoUrl = "photoplay/" + sefUrl.replace(".html", "") + "/" + photoNum + "/" + id + ".html";
        return photoUrl;
    }

    public static String suggestedStoryUrl(int id) {
        String newContentUrl;
        newContentUrl = null;
        String[] pathwayCatNames = null;
        String storySefUrl = null;
        int issueId = 0;
        int magazineId = 0;
        StringBuffer filterCatBuff = null;
        try {
            ArrayList<PathwayDTO> pathwayDataList = UrlRedirectUtil.pathwayContent(id);
            if (pathwayDataList == null || pathwayDataList.size() <= 0) {
                PathwayDTO pathwayDTO = pathwayDataList.get(0);
                pathwayCatNames = new String[]{StringUtil.isEmpty(pathwayDTO.getSectionName1()).toLowerCase().replaceAll(" ", "-"), StringUtil.isEmpty(pathwayDTO.getSectionName2()).toLowerCase().replaceAll(" ", "-"), StringUtil.isEmpty(pathwayDTO.getSectionName3()).toLowerCase().replaceAll(" ", "-"), StringUtil.isEmpty(pathwayDTO.getSectionName4()).toLowerCase().replaceAll(" ", "-")};
                storySefUrl = pathwayDTO.getStorySefUrl();
                issueId = pathwayDTO.getIssueid();
                magazineId = pathwayDTO.getMagazineid();
                filterCatBuff = new StringBuffer();
                int index = 0;
                while (index < pathwayCatNames.length) {
                    if (!StringUtil.isBlank(pathwayCatNames[index])) {
                        if (index == 0 && "".equalsIgnoreCase(pathwayDTO.getSectionName1())) {
                            filterCatBuff.append("topics").append("/");
                        } else if (index == 0 && "specials".equalsIgnoreCase(pathwayDTO.getSectionName1())) {
                            filterCatBuff.append("exclusive").append("/");
                        } else {
                            filterCatBuff.append(pathwayCatNames[index]).append("/");
                        }
                    }
                    ++index;
                }
                if (issueId > 0) {
                    switch (magazineId) {
                        case 2: 
                            newContentUrl = "moneytoday/" + filterCatBuff.toString() + storySefUrl.replace(".html", "") + "/" + "story" + "/" + id + ".html";
                            break;
                        case 6: 
                            newContentUrl = "gadget/" + filterCatBuff.toString() + storySefUrl.replace(".html", "") + "/" + "story" + "/" + id + ".html";
                            break;
                        case 1: 
                            newContentUrl = "in depth".equalsIgnoreCase(pathwayDTO.getSectionName1()) ? String.valueOf(filterCatBuff.toString()) + storySefUrl.replace(".html", "") + "/" + "story" + "/" + id + ".html" : ("specials".equalsIgnoreCase(pathwayDTO.getSectionName1()) ? String.valueOf(filterCatBuff.toString()) + storySefUrl.replace(".html", "") + "/" + "story" + "/" + id + ".html" : "magazine/" + filterCatBuff.toString() + storySefUrl.replace(".html", "") + "/" + "story" + "/" + id + ".html");
                            break;
                        default:
                        	newContentUrl = "in depth".equalsIgnoreCase(pathwayDTO.getSectionName1()) ? String.valueOf(filterCatBuff.toString()) + storySefUrl.replace(".html", "") + "/" + "story" + "/" + id + ".html" : ("specials".equalsIgnoreCase(pathwayDTO.getSectionName1()) ? String.valueOf(filterCatBuff.toString()) + storySefUrl.replace(".html", "") + "/" + "story" + "/" + id + ".html" : String.valueOf(filterCatBuff.toString()) + storySefUrl.replace(".html", "") + "/" + "story" + "/" + id + ".html");
                        	break;
                    }
                } else {
                	newContentUrl = "in depth".equalsIgnoreCase(pathwayDTO.getSectionName1()) ? String.valueOf(filterCatBuff.toString()) + storySefUrl.replace(".html", "") + "/" + "story" + "/" + id + ".html" : ("specials".equalsIgnoreCase(pathwayDTO.getSectionName1()) ? String.valueOf(filterCatBuff.toString()) + storySefUrl.replace(".html", "") + "/" + "story" + "/" + id + ".html" : String.valueOf(filterCatBuff.toString()) + storySefUrl.replace(".html", "") + "/" + "story" + "/" + id + ".html");
                }
            }
        } catch (Exception ex) {
            System.out.println("Found Exception in CommonFunctions.suggestedStoryUrl(" + id + "): Caused By: " + ex.getMessage());
        }
        return newContentUrl;
    }

    public static String storyURL(String contentSefTitle, int pageNum, int contentId) {
        String finalSefTitle = contentSefTitle;
        if (finalSefTitle.indexOf(".html") > 0) {
            finalSefTitle = finalSefTitle.replaceAll(".html", "");
        }
        String contentUrl = "story/" + finalSefTitle + "/" + pageNum + "/" + contentId + ".html";
        return contentUrl;
    }

    public static String sectionURL(String sectionSefTitle, int pageNum, int sectionId) {
        String sectionUrl = "section/" + sectionId + "/" + pageNum + "/" + sectionSefTitle;
        if (sectionSefTitle.indexOf(".html") < 0) {
            sectionUrl = String.valueOf(sectionUrl) + ".html";
        }
        return sectionUrl;
    }

    public static String categoryURL(String categorySefTitle, int pageNum, int categoryId) {
        String finalSefTitle = categorySefTitle;
        if (finalSefTitle.indexOf(".html") > 0) {
            finalSefTitle = finalSefTitle.replaceAll(".html", "");
        }
        String categoryUrl = "category/" + finalSefTitle + "/" + pageNum + "/" + categoryId + ".html";
        return categoryUrl;
    }

    public static String subCategoryURL(String subCategorySefTitle, int pageNum, int subCategoryId) {
        String finalSefTitle = subCategorySefTitle;
        if (finalSefTitle.indexOf(".html") > 0) {
            finalSefTitle = finalSefTitle.replaceAll(".html", "");
        }
        String subCategoryUrl = "subcategory/" + finalSefTitle + "/" + pageNum + "/" + subCategoryId + ".html";
        return subCategoryUrl;
    }

    public static String subSubCategoryURL(String subSubCategorySefTitle, int pageNum, int subSubCategoryId) {
        String finalSefTitle = subSubCategorySefTitle;
        if (finalSefTitle.indexOf(".html") > 0) {
            finalSefTitle = finalSefTitle.replaceAll(".html", "");
        }
        String subSubCategoryUrl = "subsubcategory/" + finalSefTitle + "/" + pageNum + "/" + subSubCategoryId + ".html";
        return subSubCategoryUrl;
    }

    public static String galleryURL(String contentSefTitle, int pageNum, int contentId) {
        String finalSefTitle = contentSefTitle;
        if (finalSefTitle.indexOf(".html") > 0) {
            finalSefTitle = finalSefTitle.replaceAll(".html", "");
        }
        String contentUrl = "gallery/" + finalSefTitle + "/" + pageNum + "/" + contentId + ".html";
        return contentUrl;
    }

    public static String galleryListURL(String contentSefTitle, int pageNum, int contentId) {
        String finalSefTitle = contentSefTitle;
        if (finalSefTitle.indexOf(".html") > 0) {
            finalSefTitle = finalSefTitle.replaceAll(".html", "");
        }
        String contentUrl = "gallerylist/" + finalSefTitle + "/" + pageNum + "/" + contentId + ".html";
        return contentUrl;
    }

    public static String gallerySectionURL() {
        String contentUrl = "galleries";
        return contentUrl;
    }

    public static String blogURL(String contentSefTitle, int pageNum, int contentId, String catId) {
        String contentUrl = "http://blogs.intoday.in/index.php?option=com_myblog&show=" + contentSefTitle + "&task=&blogs=1&contentid=" + contentId + "&Itemid=&main_category=" + catId;
        return contentUrl;
    }

    public static String updatedTime() throws Exception {
        String updatedTime;
        Connection conn = null;
        PreparedStatement selectStmt = null;
        ResultSet rs = null;
        updatedTime = "";
        try {
            DbConnection dbconn = null;
            dbconn = DbConnection.getInstance("indiatoday");
            conn = dbconn.getConnection("indiatoday");
            String sql = "SELECT date_format(updated_time, '%M %e | %H:%i IST') as updated_time FROM jos_updatetime order by id desc limit 1";
            selectStmt = conn.prepareStatement(sql);
            rs = selectStmt.executeQuery();
            while (rs.next()) {
                updatedTime = rs.getString("updated_time");
            }
        } catch (SQLException sqls) {
            System.out.println("Breaking News SQLException -> " + sqls);
        } finally {
            if (selectStmt != null) {
                selectStmt.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return updatedTime;
    }

    public static ArrayList breakingNews() throws Exception {
        ArrayList<ContentListDTO> breakingList;
        Connection connection = null;
        DbConnection connect = null;
        PreparedStatement pstmt = null;
        PreparedStatement pstmt1 = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        ContentListDTO cDTO = null;
        breakingList = new ArrayList<ContentListDTO>();
        String breakingLabel = "";
        try {
            String sql = "SELECT enabled, breaking_label FROM jos_breakingnews";
            connect = DbConnection.getInstance("indiatoday");
            connection = connect.getConnection("indiatoday");
            pstmt = connection.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                if (rs.getInt("enabled") != 1) continue;
                breakingLabel = rs.getString("breaking_label") == null ? "" : rs.getString("breaking_label");
                String sqlQuery = "SELECT c.title,ars.article_id as id,c.fulltext,DATE_FORMAT(c.created,'%H:%i IST') AS news_time,c.sef_url FROM jos_sections s,jos_content c,jos_article_section ars WHERE s.published=1 AND c.id=ars.article_id AND ars.section_id=s.id AND  c.published=1 AND c.breaking_news=1  ORDER BY ars.ordering DESC,ars.article_id DESC LIMIT 1";
                pstmt1 = connection.prepareStatement(sqlQuery);
                rs1 = pstmt1.executeQuery();
                while (rs1.next()) {
                    cDTO = new ContentListDTO();
                    cDTO.setId(rs1.getInt("id"));
                    cDTO.setTitle(rs1.getString("title"));
                    cDTO.setSefTitle(rs1.getString("sef_url") == null ? "" : rs1.getString("sef_url"));
                    cDTO.setUpdatedTime(rs1.getString("news_time") == null ? "" : rs1.getString("news_time"));
                    cDTO.setFullDescription(rs1.getString("fulltext") == null ? "" : rs1.getString("fulltext"));
                    cDTO.setContentType(breakingLabel);
                    breakingList.add(cDTO);
                }
            }
        } catch (Exception e) {
            System.out.println("IT CommonFunctions.java - breakingNews function - Exception ->" + e);
        } finally {
            if (pstmt != null) {
                pstmt.close();
            }
            if (pstmt1 != null) {
                pstmt1.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (rs1 != null) {
                rs1.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return breakingList;
    }

    public static ArrayList latestStories(String primaryCatId, int contentCount, String contentIdToAvoid) throws Exception {
        ArrayList<ContentListDTO> cAL;
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ContentListDTO cDTO = null;
        cAL = new ArrayList<ContentListDTO>();
        String contentIdsToCheck = "";
        if (!contentIdToAvoid.equals("0")) {
            contentIdsToCheck = !contentIdToAvoid.equals("0") && contentIdToAvoid.indexOf(",") < 0 ? " and c.id != " + contentIdToAvoid + " " : " and c.id not in (" + contentIdToAvoid + ") ";
        }
        int pcatlength = 0;
        String[] pcatids = null;
        pcatids = primaryCatId.indexOf("#") > 0 ? primaryCatId.split("#") : new String[]{primaryCatId};
        pcatlength = pcatids.length;
        int ctr = 0;
        try {
            DbConnection connect = null;
            connect = DbConnection.getInstance("indiatoday");
            connection = connect.getConnection("indiatoday");
            String sql = "select c.id, c.title,c.introtext,c.sef_url,c.byline,c.medium_image as medium_image, c.mobile_image as kicker_image, c.kicker_image_alt_text, ";
            if (pcatlength == 1) {
                sql = String.valueOf(sql) + "js.title as curcatname, js.id as curcatid, js.sef_url as curcatsefurl from jos_content c, jos_article_section jas, jos_sections js where jas.section_id=" + pcatids[0] + " and c.id=jas.article_id and c.published=1 and jas.section_id=js.id and js.published=1 ";
            } else if (pcatlength == 2) {
                sql = String.valueOf(sql) + "jc.title as curcatname, jc.id as curcatid, jc.sef_url as curcatsefurl from jos_categories jc, jos_content c, jos_article_section jas, jos_sections js where jas.cat_id=" + pcatids[1] + " and c.id=jas.article_id and c.published=1 and jc.id=jas.cat_id  and jc.section=js.id and jc.published=1 and js.published=1 ";
            } else if (pcatlength == 3) {
                sql = String.valueOf(sql) + "jsc.title as curcatname, jsc.id as curcatid, jsc.sef_url as curcatsefurl from jos_subcategories jsc, jos_content c, jos_article_section jas, jos_sections js, jos_categories jc where jas.subcat_id=" + pcatids[2] + " and c.published=1 and c.id=jas.article_id and jsc.id=jas.subcat_id and jsc.category=jc.id and jsc.section=js.id and jsc.published=1 and jc.published=1 and js.published=1 ";
            } else if (pcatlength == 4) {
                sql = String.valueOf(sql) + "jssc.title as curcatname, jssc.id as curcatid, jssc.sef_url as curcatsefurl from jos_sub_subcategories jssc, jos_content c, jos_article_section jas, jos_sections js, jos_categories jc, jos_subcategories jsc where jas.sub_subcat_id=" + pcatids[3] + " and c.published=1 and c.id=jas.article_id and jssc.id=jas.sub_subcat_id and jsc.id=jas.subcat_id and jc.id=jas.cat_id and js.id=jas.section_id and jssc.published=1 and js.published=1 and jsc.published=1 and jc.published=1 ";
            }
            sql = String.valueOf(sql) + " " + contentIdsToCheck + " and c.title not like '%href=%' and c.created>=DATE_SUB(CURDATE(),INTERVAL 10 DAY) group by c.id order by jas.ordering desc limit " + contentCount;
            pstmt = connection.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                cDTO = new ContentListDTO();
                cDTO.setId(rs.getInt("id"));
                cDTO.setTitle(rs.getString("title") == null ? "" : rs.getString("title"));
                cDTO.setByLine(rs.getString("byline") == null ? "" : rs.getString("byline"));
                cDTO.setFullDescription(rs.getString("introtext") == null ? "" : rs.getString("introtext"));
                cDTO.setSefTitle(rs.getString("sef_url") == null ? "" : rs.getString("sef_url"));
                cDTO.setImage(rs.getString("kicker_image") == null ? "" : rs.getString("kicker_image"));
                cDTO.setImageAltText(rs.getString("kicker_image_alt_text") == null ? "" : rs.getString("kicker_image_alt_text"));
                cDTO.setCurrentCategoryId(rs.getInt("curcatid"));
                cDTO.setCurrentCategoryTitle(rs.getString("curcatname") == null ? "" : rs.getString("curcatname"));
                cDTO.setCurrentCategorySefTitle(rs.getString("curcatsefurl") == null ? "" : rs.getString("curcatsefurl"));
                cDTO.setLargeImage(rs.getString("medium_image") == null ? "" : rs.getString("medium_image"));
                cAL.add(cDTO);
                ++ctr;
            }
        } catch (Exception e) {
            System.out.println("global_include.jsp (latestContent for " + primaryCatId + ") Exception is :" + e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return cAL;
    }

    public static ArrayList latestStoriesTemplate(int catId, int contentCount, String contentIdToAvoid, int catLevel) throws Exception {
        ArrayList<StoryListDTO> cAL;
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        StoryListDTO cDTO = null;
        cAL = new ArrayList<StoryListDTO>();
        String contentIdsToCheck = "";
        if (catLevel != 1 && catLevel != 2 && catLevel != 3 && catLevel != 4) {
            catLevel = 1;
            catId = 120;
        }
        if (!contentIdToAvoid.equals("0")) {
            contentIdsToCheck = !contentIdToAvoid.equals("0") && contentIdToAvoid.indexOf(",") < 0 ? " and c.id != " + contentIdToAvoid + " " : " and c.id not in (" + contentIdToAvoid + ") ";
        }
        int ctr = 0;
        try {
            DbConnection connect = null;
            connect = DbConnection.getInstance("indiatoday");
            connection = connect.getConnection("indiatoday");
            String sql = "select c.id, c.title,c.sef_url,c.byline, c.mobile_image as kicker_image, c.kicker_image_alt_text, ";
            if (catLevel == 1) {
                sql = String.valueOf(sql) + "js.title as stitle, js.id as sid, js.sef_url as sseftitle, js.metatitle, js.metakey, js.metadesc " + "from jos_content c, jos_article_section jas, jos_sections js where jas.section_id=" + catId + " and c.id=jas.article_id and c.published=1 and jas.section_id=js.id and js.published=1 ";
            } else if (catLevel == 2) {
                sql = String.valueOf(sql) + "js.title as stitle, js.id as sid, js.sef_url as sseftitle, jc.title as ctitle, jc.id as cid, jc.sef_url as cseftitle, jc.metatitle, jc.metakey, jc.metadesc " + "from jos_categories jc, jos_content c, jos_article_section jas, jos_sections js where jas.cat_id=" + catId + " and c.id=jas.article_id and c.published=1 and jc.id=jas.cat_id  and jc.section=js.id and jc.published=1 and js.published=1 ";
            } else if (catLevel == 3) {
                sql = String.valueOf(sql) + "js.title as stitle, js.id as sid, js.sef_url as sseftitle, jc.title as ctitle, jc.id as cid, jc.sef_url as cseftitle, " + "jsc.title as sctitle, jsc.id as scid, jsc.sef_url as scseftitle, jsc.metatitle, jsc.metakey, jsc.metadesc " + "from jos_subcategories jsc, jos_content c, jos_article_section jas, jos_sections js, jos_categories jc where jas.subcat_id=" + catId + " and c.published=1 and c.id=jas.article_id and jsc.id=jas.subcat_id and jsc.category=jc.id and jsc.section=js.id and jsc.published=1 and jc.published=1 and js.published=1 ";
            } else if (catLevel == 4) {
                sql = String.valueOf(sql) + "js.title as stitle, js.id as sid, js.sef_url as sseftitle, jc.title as ctitle, jc.id as cid, jc.sef_url as cseftitle, " + "jsc.title as sctitle, jsc.id as scid, jsc.sef_url as scseftitle, jssc.title as ssctitle, jssc.id as sscid, jssc.sef_url as sscseftitle, " + "jssc.metatitle, jssc.metakey, jssc.metadesc " + "from jos_sub_subcategories jssc, jos_content c, jos_article_section jas, jos_sections js, jos_categories jc, jos_subcategories jsc " + "where jas.sub_subcat_id=" + catId + " and c.published=1 and c.id=jas.article_id and jssc.id=jas.sub_subcat_id and jsc.id=jas.subcat_id and jc.id=jas.cat_id and js.id=jas.section_id and jssc.published=1 and js.published=1 and jsc.published=1 and jc.published=1 ";
            }
            sql = String.valueOf(sql) + " " + contentIdsToCheck + " and c.title not like '%href=%' group by c.id order by jas.ordering desc limit " + contentCount;
            pstmt = connection.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                cDTO = new StoryListDTO();
                cDTO.setId(rs.getInt("id"));
                cDTO.setTitle(rs.getString("title") == null ? "" : rs.getString("title"));
                cDTO.setByLine(rs.getString("byline") == null ? "" : rs.getString("byline"));
                cDTO.setSefTitle(rs.getString("sef_url") == null ? "" : rs.getString("sef_url"));
                cDTO.setImage(rs.getString("c.kicker_image") == null ? "" : rs.getString("c.kicker_image"));
                cDTO.setImageAltText(rs.getString("kicker_image_alt_text") == null ? "" : rs.getString("kicker_image_alt_text"));
                cDTO.setMetaTitle(rs.getString("metatitle") == null ? "" : rs.getString("metatitle"));
                cDTO.setMetaKeyword(rs.getString("metakey") == null ? "" : rs.getString("metakey"));
                cDTO.setMetaDescription(rs.getString("metadesc") == null ? "" : rs.getString("metadesc"));
                cDTO.setSectionId(rs.getInt("sid"));
                cDTO.setSectionTitle(rs.getString("stitle") == null ? "" : rs.getString("stitle"));
                cDTO.setSectionSefTitle(rs.getString("sseftitle") == null ? "" : rs.getString("sseftitle"));
                if (catLevel >= 2) {
                    cDTO.setCategoryId(rs.getInt("cid"));
                    cDTO.setCategoryTitle(rs.getString("ctitle") == null ? "" : rs.getString("ctitle"));
                    cDTO.setCategorySefTitle(rs.getString("cseftitle") == null ? "" : rs.getString("cseftitle"));
                }
                if (catLevel >= 3) {
                    cDTO.setSubCategoryId(rs.getInt("scid"));
                    cDTO.setSubCategoryTitle(rs.getString("sctitle") == null ? "" : rs.getString("sctitle"));
                    cDTO.setSubCategorySefTitle(rs.getString("scseftitle") == null ? "" : rs.getString("scseftitle"));
                }
                if (catLevel >= 4) {
                    cDTO.setSubSubCategoryId(rs.getInt("sscid"));
                    cDTO.setSubSubCategoryTitle(rs.getString("ssctitle") == null ? "" : rs.getString("ssctitle"));
                    cDTO.setSubSubCategorySefTitle(rs.getString("sscseftitle") == null ? "" : rs.getString("sscseftitle"));
                }
                cAL.add(cDTO);
                ++ctr;
            }
        } catch (Exception e) {
            System.out.println("IT WAP CommonFunctions (latestContent for " + catId + ") Exception is :" + e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return cAL;
    }

    public static ArrayList latestGalleries(int categoryId, int countToFetch, String galleryIdToAvoid) throws Exception {
        ArrayList<ContentListDTO> latestGalleries;
        latestGalleries = new ArrayList<ContentListDTO>();
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ResultSet rs_pc = null;
        ContentListDTO lcDTO = null;
        String galleryCheck = "";
        String sql = "";
        if (!galleryIdToAvoid.equals("0")) {
            galleryCheck = galleryIdToAvoid.indexOf(",") > 0 ? "and gn.id not in (" + galleryIdToAvoid + ")" : "and gn.id != " + galleryIdToAvoid;
        }
        try {
            DbConnection connect = null;
            connect = DbConnection.getInstance("indiatoday");
            connection = connect.getConnection("indiatoday");
            if (categoryId == 0) {
                sql = "SELECT g.id,g.Gallery_name,g.mobile_image as mobileImage , g.small_image as smallImage, g.large_image as thumb_image, g.sef_url,s.id AS photo_category, s.name AS photo_catname FROM jos_gallerynames g,jos_sections s WHERE g.section_id IN('38','39') AND g.published=1 AND g.section_id=s.id AND s.published=1 AND s.section_type='photo' AND s.magazineid=1 ORDER BY g.ordering DESC LIMIT " + countToFetch;
            } else {
                sql = "SELECT g.id,g.Gallery_name, g.mobile_image as mobileImage , g.small_image as smallImage, g.large_image as thumb_image, g.sef_url,s.id AS photo_category, s.name AS photo_catname FROM jos_gallerynames g,jos_sections s WHERE g.section_id ='" + categoryId + "' AND g.published=1 AND g.section_id=s.id AND s.published=1 AND s.section_type='photo' AND s.magazineid=1 ORDER BY g.ordering DESC LIMIT " + countToFetch;
                System.out.println("sql---" + sql);
            }
            pstmt = connection.prepareStatement(sql);
            rs = pstmt.executeQuery();
            sql = "";
            pstmt = null;
            while (rs.next()) {
                lcDTO = new ContentListDTO();
                lcDTO.setId(rs.getInt("id"));
                lcDTO.setTitle(rs.getString("Gallery_name") == null ? "" : rs.getString("Gallery_name"));
                lcDTO.setSefTitle(rs.getString("sef_url") == null ? "" : rs.getString("sef_url"));
                lcDTO.setImage(rs.getString("thumb_image") == null ? "" : rs.getString("thumb_image"));
                lcDTO.setImageAltText(rs.getString("Gallery_name") == null ? "" : rs.getString("Gallery_name"));
                lcDTO.setImageAltText(rs.getString("Gallery_name") == null ? "" : rs.getString("Gallery_name"));
                lcDTO.setSmallImage(rs.getString("smallImage") == null ? "" : rs.getString("smallImage"));
                lcDTO.setMobileImage(rs.getString("mobileImage") == null ? "" : rs.getString("mobileImage"));
                lcDTO.setCurrentCategoryTitle(StringUtil.isEmpty(rs.getString("photo_catname")).toLowerCase().replaceAll(" ", "-"));
                latestGalleries.add(lcDTO);
            }
        } catch (Exception e) {
            System.out.println("IT CommonFunctions.java-mustsee-Exception is :" + e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (rs_pc != null) {
                rs_pc.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return latestGalleries;
    }

    public static ArrayList latestRelatedGalleries(int categoryId, int contentCount, String galleryIdToAvoid) throws Exception {
        ArrayList<ContentListDTO> latestGalleries;
        latestGalleries = new ArrayList<ContentListDTO>();
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ResultSet rs_pc = null;
        ContentListDTO lcDTO = null;
        String galleryCheck = "";
        String sql = "";
        try {
            DbConnection connect = null;
            connect = DbConnection.getInstance("indiatoday");
            connection = connect.getConnection("indiatoday");
            sql = "SELECT g.id,g.Gallery_name AS title ,g.thumb_image as thumb_image, g.sef_url FROM jos_gallerynames g,jos_sections s WHERE g.section_id=" + categoryId + " AND  g.published=1 AND g.section_id=s.id AND s.published=1 AND s.section_type='photo' AND g.id!=" + galleryIdToAvoid + " AND s.magazineid=1 ORDER BY g.ordering DESC LIMIT " + contentCount;
            pstmt = connection.prepareStatement(sql);
            rs = pstmt.executeQuery();
            sql = "";
            pstmt = null;
            while (rs.next()) {
                lcDTO = new ContentListDTO();
                lcDTO.setId(rs.getInt("id"));
                lcDTO.setTitle(rs.getString("title") == null ? "" : rs.getString("title"));
                lcDTO.setSefTitle(rs.getString("sef_url") == null ? "" : rs.getString("sef_url"));
                lcDTO.setImage(rs.getString("thumb_image") == null ? "" : rs.getString("thumb_image"));
                latestGalleries.add(lcDTO);
            }
        } catch (Exception e) {
            System.out.println("IT CommonFunctions.java-mustsee-Exception is :" + e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (rs_pc != null) {
                rs_pc.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return latestGalleries;
    }

    public static ArrayList searchResult(String searchedTxt, int searchlimit, String contenttype) throws Exception {
        ArrayList<ContentListDTO> contentList;
        Connection conn = null;
        PreparedStatement selectStmt = null;
        ResultSet rs = null;
        contentList = new ArrayList<ContentListDTO>();
        String strText = "'%" + searchedTxt + "%'";
        int intLimit = searchlimit;
        try {
            DbConnection dbconn = null;
            dbconn = DbConnection.getInstance("indiatoday");
            conn = dbconn.getConnection("indiatoday");
            String sql = "";
            sql = contenttype.equals("video") ? "select c.id, c.title, c.sef_url, c.mobile_image, c.kicker_image_alt_text from jos_content c, jos_article_section a where a.section_id=86 and c.content_type=0 and (c.title like " + strText + " or c.metatags like " + strText + ") and c.id=a.article_id and c.published=1 group by c.id order by c.id desc limit ?" : (contenttype.equals("programme") ? "select c.id, c.title, c.sef_url, c.mobile_image, c.kicker_image_alt_text from jos_content c, jos_article_section a where a.section_id=87 and c.content_type=0 and (c.title like " + strText + " or c.metatags like " + strText + ") and c.id=a.article_id and c.published=1 group by c.id order by c.id limit ?" : (contenttype.equals("photo") ? "select c.id, c.title, c.sef_url, c.mobile_image, c.kicker_image_alt_text from jos_content c, jos_article_section a where c.content_type=0 and (c.title like " + strText + " or c.metatags like " + strText + ") and c.id=a.article_id and c.published=1 and c.title not like '%href=%' group by c.id order by c.id desc limit ?" : "select c.id, c.title, c.sef_url, c.mobile_image, c.kicker_image_alt_text from jos_content c, jos_article_section a where c.content_type=0 and (c.title like " + strText + " or c.metatags like " + strText + ") and c.id=a.article_id and c.published=1 and c.title not like '%href=%' group by c.id order by c.id desc limit ?"));
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

    public static ArrayList relatedContent(String contentids, String contenttype, int countToFetch) throws Exception {
        ArrayList<RelatedContentDTO> relatedContent;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        PreparedStatement pstmt1 = null;
        ResultSet rs1 = null;
        RelatedContentDTO rcDTO = null;
        String selectStmtP1 = "";
        relatedContent = new ArrayList<RelatedContentDTO>();
        if (contenttype.trim().length() == 0) {
            contenttype = "text";
        }
        String contentIdCondition = "";
        contentIdCondition = !contentids.contains(",") ? "= " + contentids : "in (" + contentids + ")";
        try {
            DbConnection dbConn = DbConnection.getInstance("indiatoday");
            conn = dbConn.getConnection("indiatoday");
            String selectStmt = "SELECT article_id, related_article_id, related_title, related_type FROM jos_related_stories where article_id " + contentIdCondition + " and " + "content_type = '" + contenttype + "' group by article_id, related_article_id order by article_id, content_type, related_order asc ";
            if (countToFetch != 0) {
                selectStmt = String.valueOf(selectStmt) + " limit " + countToFetch;
            }
            pstmt = conn.prepareStatement(selectStmt);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                rcDTO = new RelatedContentDTO();
                rcDTO.setContentId(rs.getInt("article_id"));
                rcDTO.setRelatedContentId(rs.getInt("related_article_id"));
                rcDTO.setRelatedTitle(rs.getString("related_title") == null ? "" : rs.getString("related_title"));
                rcDTO.setRelatedType(rs.getString("related_type") == null ? "" : rs.getString("related_type"));
                try {
                    if (rs.getString("related_type").equals("photo")) {
                        selectStmtP1 = "SELECT thumb_image, Gallery_name, sef_url FROM jos_gallerynames where id=?";
                        pstmt1 = conn.prepareStatement(selectStmtP1);
                        pstmt1.setInt(1, rs.getInt("related_article_id"));
                        rs1 = pstmt1.executeQuery();
                        while (rs1.next()) {
                            rcDTO.setRelatedContentSefTitle(rs1.getString("sef_url") == null ? "" : rs1.getString("sef_url"));
                            rcDTO.setImage(rs1.getString("thumb_image") == null ? "" : rs1.getString("thumb_image"));
                            rcDTO.setImageAltText(rs1.getString("Gallery_name") == null ? "" : rs1.getString("Gallery_name"));
                        }
                    } else if (rs.getString("related_type").equals("text") || rs.getString("related_type").equals("video")) {
                        selectStmtP1 = "SELECT mobile_image, kicker_image_alt_text, sef_url FROM jos_content where id=?";
                        pstmt1 = conn.prepareStatement(selectStmtP1);
                        pstmt1.setInt(1, rs.getInt("related_article_id"));
                        rs1 = pstmt1.executeQuery();
                        while (rs1.next()) {
                            rcDTO.setRelatedContentSefTitle(rs1.getString("sef_url") == null ? "" : rs1.getString("sef_url"));
                            rcDTO.setImage(rs1.getString("mobile_image") == null ? "" : rs1.getString("mobile_image"));
                            rcDTO.setImageAltText(rs1.getString("kicker_image_alt_text") == null ? "" : rs1.getString("kicker_image_alt_text"));
                        }
                    }
                } catch (Exception ex) {
                    System.out.println("relatedContentTopStories Content SQLException (CommonFunctions.java) -> " + ex.toString());
                } finally {
                    if (rs1 != null) {
                        rs1.close();
                    }
                    if (pstmt1 != null) {
                        pstmt1.close();
                    }
                }
                relatedContent.add(rcDTO);
            }
        } catch (SQLException sqls) {
            System.out.println("relatedContent Content SQLException (CommonFunctions.java) -> " + sqls);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return relatedContent;
    }

    public static ArrayList highlightsData(String articleId) throws Exception {
        ArrayList<ContentListDTO> hAL;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement stmt = null;
        String selectQuery = "";
        ContentListDTO clDTO = null;
        hAL = new ArrayList<ContentListDTO>();
        try {
            DbConnection dbConn = DbConnection.getInstance("indiatoday");
            conn = dbConn.getConnection("indiatoday");
            selectQuery = "select c.id, c.`fulltext` from jos_content c where c.id=" + articleId + " group by c.id";
            stmt = conn.prepareStatement(selectQuery);
            rs = stmt.executeQuery();
            while (rs.next()) {
                clDTO = new ContentListDTO();
                clDTO.setId(rs.getInt("id"));
                clDTO.setFullDescription(rs.getString("fulltext") == null ? "" : rs.getString("fulltext"));
                hAL.add(clDTO);
            }
        } catch (Exception e) {
            System.err.println("WAP highlights chunk: " + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return hAL;
    }

    public static ArrayList searchResult(String searchedTxt, int searchlimit, String contenttype, String contentToRemove) throws Exception {
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
                while (k < tokens1.length) {
                    finalStr = tokens1[k];
                    sb.append("(c.Gallery_name like '%" + finalStr + "%' or c.metakey like  '%" + finalStr + "%' or c.metadesc like '%" + finalStr + "%' )");
                    if (k != tokens1.length - 1) {
                        sb.append(" and ");
                    }
                    ++k;
                }
                sb.append(")");
            } else {
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

    public static ArrayList specialCategoryData(String categoryName, int numberOfContent) throws Exception {
        ArrayList<StoryListDTO> categoryListingData;
        categoryListingData = new ArrayList<StoryListDTO>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        String selectQuery = "";
        StoryListDTO categoryDTO = null;
        boolean categoryContentCount = false;
        try {
            DbConnection dbconn = null;
            dbconn = DbConnection.getInstance("indiatoday");
            conn = dbconn.getConnection("indiatoday");
            selectQuery = "SELECT `content_id`,`title`,`introtext`,`kicker_image`,large_kicker_image,mobile_image,`content_type`,`sef_url`,`byline`,`large_kicker_image_alt_text` FROM `jos_specialpage_manager` WHERE `published`='1' AND `special_page`=? ORDER BY `ordering`  limit ?";
            pstmt = conn.prepareStatement(selectQuery);
            pstmt.setString(1, categoryName);
            pstmt.setInt(2, numberOfContent);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                categoryDTO = new StoryListDTO();
                categoryDTO.setId(rs.getInt("content_id"));
                categoryDTO.setTitle(rs.getString("title"));
                categoryDTO.setByLine(rs.getString("byline"));
                categoryDTO.setImage(rs.getString("kicker_image") == null ? "" : rs.getString("kicker_image"));
                categoryDTO.setImageAltText(rs.getString("kicker_image_alt_text").length() == 0 ? "" : rs.getString("kicker_image_alt_text"));
                categoryDTO.setSefTitle(rs.getString("sef_url"));
                categoryDTO.setSectionTitle(rs.getString("content_type"));
                categoryListingData.add(categoryDTO);
            }
        } catch (Exception ex) {
            System.out.println("Issue in CategoryHelper.java -> " + ex.toString());
        } finally {
        	if(rs != null) {
        		rs.close();
        	}
        	if(pstmt != null) {
        		pstmt.close();
        	}
        	if(conn != null) {
        		conn.close();
        	}
        }
        return categoryListingData;
    }

    public static String videoURL(String contentSefTitle, int pageNum, int contentId) {
        String finalSefTitle = contentSefTitle;
        if (finalSefTitle.indexOf(".html") > 0) {
            finalSefTitle = finalSefTitle.replaceAll(".html", "");
        }
        String articleUrl = "video/" + finalSefTitle + "/" + pageNum + "/" + contentId + ".html";
        return articleUrl;
    }

    public static String videoListURL(String contentSefTitle, int pageNum, int contentId) {
        String finalSefTitle = contentSefTitle;
        if (finalSefTitle.indexOf(".html") > 0) {
            finalSefTitle = finalSefTitle.replaceAll(".html", "");
        }
        String contentUrl = "videolist/" + finalSefTitle + "/" + pageNum + "/" + contentId + ".html";
        return contentUrl;
    }

    public static String videoSubCatListURL(String contentSefTitle, int pageNum, int contentId) {
        String finalSefTitle = contentSefTitle;
        if (finalSefTitle.indexOf(".html") > 0) {
            finalSefTitle = finalSefTitle.replaceAll(".html", "");
        }
        String contentUrl = "videocategory/" + finalSefTitle + "/" + pageNum + "/" + contentId + ".html";
        return contentUrl;
    }

    public static String videoSectionURL() {
        String contentUrl = "videos";
        return contentUrl;
    }
}