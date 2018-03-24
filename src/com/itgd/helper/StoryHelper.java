package com.itgd.helper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.itgd.utils.Constants;
import com.itgd.utils.DbConnection;
import com.itgd.dto.ByLineDTO;
import com.itgd.dto.StoryDTO;
import com.itgd.dto.ContentListDTO;
import com.itgd.utils.StringUtil;

public class StoryHelper {
	
	public static ArrayList storyDetail(int storyId, int publishedStatus) throws Exception {
		Connection connection;
        PreparedStatement pstmt;
        ResultSet rs;
        PreparedStatement pstmt1;
        ResultSet rs1;
        ArrayList storyData = new ArrayList();
        int primaryCategoryLength;
        connection = null;
        pstmt = null;
        rs = null;
        pstmt1 = null;
        rs1 = null;
        String storyStatus = "";
        if(publishedStatus == 1) {
            storyStatus = " and c.published=1 ";
        }
        primaryCategoryLength = 0;
        String primaryCategory = "0";
        String primaryCategoryId[] = (String[])null;
        try {
            DbConnection connect = null;
            connect = DbConnection.getInstance("indiatoday");
            connection = connect.getConnection("indiatoday");
            String sql = "SELECT c.images as imagepath, c.blurbs, c.story_syndication, c.id, c.sef_url, c.primary_category, c.title_alias, c.byline, c.city, c.courtesy, c.fulltext, c.metadesc, c.issueid, " +
            			"c.metakey, c.quotes, date_format( c.created,'%W, %M %e, %Y') AS crt, date_format( c.modified,'%W, %M %e, %Y') AS modifieddate, date_format(c.created,'%H:%i') AS ctime, c.large_kicker_image, c.kicker_image_caption, c.large_kicker_image_alt_text " +
            			"FROM jos_content c, jos_article_section a WHERE c.id = ? and a.article_id=c.id and c.published=1 group by c.id";
            
            pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, storyId);
            StoryDTO sDTO = null;
            rs = pstmt.executeQuery();
            while(rs.next()) {
                sDTO = new StoryDTO();
                sDTO.setId(rs.getInt("id"));
                sDTO.setSyndicate(rs.getInt("story_syndication"));
                sDTO.setStoryImage(StringUtil.isEmpty(rs.getString("imagepath")));
                sDTO.setFullDescription(StringUtil.isEmpty(rs.getString("fulltext")).replaceAll("\\{table\\}", "").replaceAll("\\{mospagebreak\\}", ""));
                sDTO.setTitleAlias(StringUtil.isEmpty(rs.getString("title_alias")));
                sDTO.setByline(StringUtil.isEmpty(rs.getString("byline")));
                sDTO.setCity(StringUtil.isEmpty(rs.getString("city")));
                sDTO.setSefTitle(StringUtil.isEmpty(rs.getString("sef_url")));
                sDTO.setCreatedDate(StringUtil.isEmpty(rs.getString("crt")));
                sDTO.setCreatedTime(StringUtil.isEmpty(rs.getString("ctime")));
                sDTO.setMetaKeyword(StringUtil.isEmpty(rs.getString("metakey")));
                sDTO.setMetaDescription(StringUtil.isEmpty(rs.getString("metadesc")));
                sDTO.setCourtesy(StringUtil.isEmpty(rs.getString("courtesy")));
                sDTO.setLargeKickerImage(StringUtil.isEmpty(rs.getString("large_kicker_image")));
                sDTO.setLargeKickerImageCaption(StringUtil.isEmpty(rs.getString("kicker_image_caption")));
                sDTO.setLargeKickerImageAltText(StringUtil.isEmpty(rs.getString("large_kicker_image_alt_text")));
                sDTO.setPrimaryCategory(StringUtil.isEmpty(rs.getString("primary_category")));
                sDTO.setIssueId(rs.getInt("issueid"));
                sDTO.setStoryBlurb(StringUtil.isEmpty(rs.getString("blurbs")));
                sDTO.setModifiedDate(StringUtil.isEmpty(rs.getString("modifieddate")));
                sDTO.setStoryQuotes(StringUtil.isEmpty(rs.getString("quotes")));
                primaryCategory = StringUtil.isEmpty(rs.getString("primary_category"));
                try {
                    if(primaryCategory != null && primaryCategory.trim().length() > 0) {                        
                        if(primaryCategory.indexOf("#") > 0 && primaryCategory.lastIndexOf("#") < primaryCategory.trim().length()) {
                            primaryCategoryId = primaryCategory.split("#");
                            primaryCategoryLength = primaryCategoryId.length;
                        } else {
                            primaryCategoryId = new String[1];
                            primaryCategoryId[0] = primaryCategory;
                        }
                        primaryCategoryLength = primaryCategoryId.length;
                        String sql1 = "select js.id as jsid, js.title as jstitle, js.sef_url as jssefurl ";
                        switch(primaryCategoryLength) {
	                        case 1: sql1 += " from jos_sections js where js.id=" + primaryCategoryId[0]; break;
	                        case 2: sql1 += ", jc.title as jctitle, jc.id as jcid, jc.sef_url as jcsefurl from jos_categories jc, jos_sections js where jc.id="+primaryCategoryId[1]+" and jc.section=js.id"; break;
	                        case 3: sql1 += ", jc.title as jctitle, jc.id as jcid, jc.sef_url as jcsefurl, jsc.title as jsctitle, jsc.id as jscid, jsc.sef_url as jscsefurl from jos_subcategories jsc, jos_sections js, " +
	                						"jos_categories jc where jsc.id="+primaryCategoryId[2]+" and  jsc.category=jc.id and jsc.section=js.id"; break;
	                		default:	sql1 += ", jc.title as jctitle, jc.id as jcid, jc.sef_url as jcsefurl, jc.template_path as jcpath, jsc.title as jsctitle, jsc.id as jscid, jsc.sef_url as jscsefurl, jssc.title as " +
	                					"jssctitle, jssc.id as jsscid, jssc.sef_url as jsscsefurl from jos_sub_subcategories jssc, jos_sections js, jos_categories jc, jos_subcategories jsc where jssc.id="+
	                					primaryCategoryId[3]+" and jssc.section=js.id and jssc.category=jc.id and jssc.sub_category=jsc.id"; break; 
                        }
                        pstmt1 = connection.prepareStatement(sql1);
                        rs1 = pstmt1.executeQuery();
                        while(rs1.next()) {
                            sDTO.setSectionId(rs1.getInt("jsid"));
                            sDTO.setSectionTitle(StringUtil.isEmpty(rs1.getString("jstitle")));
                            sDTO.setSectionSefTitle(StringUtil.isEmpty(rs1.getString("jssefurl")));
                            
                            if(primaryCategoryLength >= 2) {
                                sDTO.setCategoryId(rs1.getInt("jcid"));
                                sDTO.setCategoryTitle(StringUtil.isEmpty(rs1.getString("jctitle")));
                                sDTO.setCategorySefTitle(StringUtil.isEmpty(rs1.getString("jcsefurl")));
                            }
                            if(primaryCategoryLength >= 3) {
                                sDTO.setSubCategoryId(rs1.getInt("jscid"));
                                sDTO.setSubCategoryTitle(StringUtil.isEmpty(rs1.getString("jsctitle")));
                                sDTO.setSubCategorySefTitle(StringUtil.isEmpty(rs1.getString("jscsefurl")));
                            }
                            if(primaryCategoryLength == 4) {
                                sDTO.setSubSubCategoryId(rs1.getInt("jsscid"));
                                sDTO.setSubSubCategoryTitle(StringUtil.isEmpty(rs1.getString("jssctitle")));
                                sDTO.setSubSubCategorySefTitle(StringUtil.isEmpty(rs1.getString("jsscsefurl")));
                            }
                        }

                    }
                    if(sDTO.getIssueId() > 0) {
                    	sql = "SELECT name as issuedate FROM jos_magazine_categories WHERE id = "+sDTO.getIssueId()+"";
	                    pstmt1 = connection.prepareStatement(sql);
	                    rs1 = pstmt1.executeQuery();
	                    if(rs1.next()){
	                    	sDTO.setIssueDate(StringUtil.isEmpty(rs1.getString("issuedate")));
	                    }
                    }
                } catch(Exception e) {
                    System.out.println("BTWAP StoryHelper articleDetail Primary Category Detail Exception is :"+ e.toString());
                } finally {
                	if(rs1!=null)
        				rs1.close();
        			if(pstmt1!=null)
        				pstmt1.close();
                }
                sDTO.setPrimaryCategoryLength(primaryCategoryLength);
                
                storyData.add(sDTO);
            }
		} catch (Exception e) {
			System.out.println("BTWAP StoryHelper articleDetail Exception is :" + e);
		} finally {
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(rs1!=null)
				rs1.close();
			if(pstmt1!=null)
				pstmt1.close();
			if(connection!=null)
				connection.close();
		}
		return storyData;
	}

	public static ArrayList GetNextPreviousArticle(String categoryid, int contentId) throws Exception {
		Connection pnconn;
        PreparedStatement pstmt;
        ResultSet rs;
        ArrayList moreContentData;
        int contentIdOrdering;
        String catIdCondition;
        pnconn = null;
        pstmt = null;
        rs = null;
        ContentListDTO sb = null;
        moreContentData = new ArrayList();
        int pcatlength = 0;
        contentIdOrdering = 0;
        String pcatids[] = (String[])null;
        categoryid = categoryid.replaceAll("~", "#");
        if(categoryid.indexOf("#") > 0) {
            pcatids = categoryid.split("#");
        } else {
            pcatids = new String[1];
            pcatids[0] = categoryid;
        }
        pcatlength = pcatids.length;
        catIdCondition = "";
        switch(pcatlength) {
        	case 1: catIdCondition = " WHERE a.section_id = "+pcatids[0]; break;
        	case 2: catIdCondition = " WHERE a.section_id = "+pcatids[0]+" AND a.cat_id = "+pcatids[1]; break;
        	case 3: catIdCondition = " WHERE a.section_id = "+pcatids[0]+" AND a.cat_id = "+pcatids[1]+" AND a.subcat_id = "+pcatids[2]; break;
        	default: catIdCondition = " WHERE a.section_id = "+pcatids[0]+" AND a.cat_id = "+pcatids[1]+" AND a.subcat_id = "+pcatids[2]+" AND a.sub_subcat_id = "+pcatids[3]; break; 
        }
        try {
            DbConnection connect = DbConnection.getInstance("indiatoday");
            pnconn = connect.getConnection("indiatoday");
            
            String sql = "SELECT a.ordering, a.article_id FROM jos_content c, jos_article_section a force index(cat_id) "+catIdCondition+" AND a.article_id = "+contentId+" AND a.article_id = c.id GROUP BY c.id";
                        
            pstmt = pnconn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                contentIdOrdering = rs.getInt("ordering");
            }
            if(contentIdOrdering > 0) {
                sql = "SELECT c.id, c.title, c.sef_url, a.ordering FROM jos_content c,jos_article_section a force index(cat_id) "+catIdCondition+" AND c.created >= DATE_SUB(CURRENT_DATE, INTERVAL 62 DAY) AND a.article_id = c.id " +
                		"AND c.published = 1 AND a.ordering < "+contentIdOrdering+" GROUP BY c.id ORDER BY a.ordering DESC LIMIT 1";
                pstmt = pnconn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                if(rs.next()) {
                    sb = new ContentListDTO();
                    sb.setId(rs.getInt("id"));
                    sb.setTitle(rs.getString("title"));
                    sb.setSefTitle(rs.getString("sef_url"));
                    sb.setContentType("previous");
                    moreContentData.add(sb);
                }
                rs = null;
                pstmt = null;
            }
            sql = "SELECT c.id, c.title, c.sef_url, a.ordering FROM jos_content c,jos_article_section a force index(cat_id) "+catIdCondition+" AND c.created >= DATE_SUB(CURRENT_DATE, INTERVAL 62 DAY) AND a.article_id = c.id " +
            		"AND c.published = 1 AND a.ordering > "+contentIdOrdering+" GROUP BY c.id ORDER BY a.ordering LIMIT 1";
            pstmt = pnconn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                sb = new ContentListDTO();
                sb.setId(rs.getInt("id"));
                sb.setTitle(rs.getString("title"));
                sb.setSefTitle(rs.getString("sef_url"));
                sb.setContentType("next");
                moreContentData.add(sb);
            }
		} catch (Exception e) {
			System.out.println("Previous Next Content SQLException (BT WAP StoryHelper.java) -> " + e);
		} finally {
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(pnconn!=null)
				pnconn.close();
		}
		return moreContentData;
	}
	
	public static List<ByLineDTO> getAuthorBylineData(int storyId) throws Exception {
		Connection connection = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    ByLineDTO aDTO = null; 
	    List<ByLineDTO> storyList = new ArrayList<ByLineDTO>();
	    try {
	    	DbConnection connect = null;
	        connect = DbConnection.getInstance("indiatoday");
	        connection = connect.getConnection("indiatoday");
	        String sql = "SELECT jap.id,jap.author_name,jap.author_email,jap.profile_image,jap.designation,jap.full_description,jap.sef_url,jap.twitter_id,jap.facebook_id,jap.profile_type FROM `jos_content_author_relation` jar,`jos_author_profile` jap WHERE jar.content_id=? AND jar.author_id=jap.id AND jap.published='1' AND jar.published='1' AND jar.content_type='0' ORDER BY `ordering` DESC";                   
	        pstmt = connection.prepareStatement(sql);
	        pstmt.setInt(1, storyId);
	        rs = pstmt.executeQuery();
	        while (rs.next ()){
	        	aDTO = new ByLineDTO();
	            aDTO.setId(rs.getInt("id"));
                aDTO.setAuthorName(rs.getString("author_name"));
                aDTO.setAuthorEmail(rs.getString("author_email"));
                aDTO.setAuthorProfileImage(rs.getString("profile_image"));
                aDTO.setAuthorDesignation(rs.getString("designation"));
                aDTO.setAuthorFullDesc(rs.getString("full_description"));
                aDTO.setAuthorSefURL(rs.getString("sef_url"));
                aDTO.setAuthorTwitterId(rs.getString("twitter_id"));
                aDTO.setAuthorFacebookId(rs.getString("facebook_id"));
                aDTO.setAuthorProfileType(rs.getString("profile_type"));
                
                storyList.add(aDTO);
	        }
	    } catch (Exception e) {
	    	System.out.println("BTWAP StoryHelper storybyline Exception is :" + e);
	    } finally {
            if(rs!=null)
                rs.close();
            if(pstmt!=null)
                pstmt.close();
            if(connection!=null)
                connection.close();
        }
        return storyList;
	}
	public static String mosimageToimagesOpt(String fullbody, String images) throws Exception {
		String full1 = null;
	    Connection conn = null;
	    String site_url = Constants.SITE_URL;
	    int imageType = 0;
	    int tokenCount = 0;

		if ((images.trim().length()) > 0) {
			try {
				conn = DbConnection.getInstance("indiatoday").getConnection("indiatoday");
				String[] bodyimages = (images.trim()).split("\n");
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				tokenCount = bodyimages.length;
				for (int k = 0; k < tokenCount; k++) {
					bodyimages[k] = bodyimages[k].substring(0, bodyimages[k].length());
					//mosimage parameter positions are
					//1. Image Source 2. Image Align 3. Alt Text 4. Border 
					//5. Caption 6. Caption Position 7. Caption Align 8. Caption Width (We are not taking it)
					String[] singleImageArray = new String[] { "", "", "", "", "", "", "", "" };
					String[] singleImageArrayTemp = new String[] { "", "", "", "", "", "", "", "" };
					if (bodyimages[k].indexOf("|") > 0) {
						singleImageArrayTemp = bodyimages[k].split("\\|");
					} else {
						singleImageArrayTemp[0] = bodyimages[k];
					}
					for(int i=0; i < singleImageArray.length ; i++) {
						if(i < singleImageArrayTemp.length) {
							singleImageArray[i] = singleImageArrayTemp[i];
							System.out.println("435.... BT WAP story.jsp:: singleImageArray[" + i + "] ======>> "+singleImageArray[i]);
						}
					}
					if (singleImageArray[1] == null || (singleImageArray[1].trim().length()) == 0 || singleImageArray[1].trim() == "")
						singleImageArray[1] = "left";
					if (singleImageArray[2] == null)
						singleImageArray[2] = "";
					if (singleImageArray[3] == null || (singleImageArray[3].trim().length()) == 0)
						singleImageArray[3] = "0";
					if (singleImageArray[5] == null || (singleImageArray[5].trim().length()) == 0)
						singleImageArray[5] = "bottom";
					if (singleImageArray[6] == null || (singleImageArray[6].trim().length()) == 0)
						singleImageArray[6] = "left";
					if(singleImageArray.length > 7)
						imageType = StringUtil.isInteger(singleImageArray[7])?Integer.parseInt(singleImageArray[7]):0;
					
					String imageDiv = "";
					String captionDiv = "";
					String completeImage = "";
					String imagewidth = "";
					String imageHeight = "";
					String largeImage = "";
					String largeImageWidth = "";
					String largeImageHeight = "";
					String imageAlignment = "";
					try {
						String sql = "SELECT width_thumb_name,height_thumb_name,mainimg_name,width_mainimg_name,height_mainimg_name " +
									"from jos_mediaimages where content_image_name = '" + singleImageArray[0] + "'";
						
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						if (rs.next()) {
							imagewidth = rs.getString("width_thumb_name");
							imageHeight = rs.getString("height_thumb_name");
							largeImage = rs.getString("mainimg_name");
							largeImageWidth = rs.getString("width_mainimg_name");
							largeImageHeight = rs.getString("height_mainimg_name");
						}
					} catch (SQLException e) {
						System.out.println("617.. Story Function mosimage Enlarge image exception -> " + e);
					} finally {
						if(pstmt != null)
							pstmt.close();
						if(rs != null)
							rs.close();
						
					}
					try {
						if (singleImageArray[0] != null && (singleImageArray[0].trim()).length() > 0) {
							if(singleImageArray[1].equals("right")) {
								imageAlignment = "margin:2px 0px 2px 15px; ";
							} else {
								imageAlignment = "margin:2px 15px 2px 0px; ";
							}
							System.out.println("489.... BT WAP Story.jsp:: imageType ======>> "+imageType+", largeImage ======>> "+largeImage);
							if(imageType == 2) {
								imageDiv = "<div style='border:0px solid #d7d7d7; " + imageAlignment + " width:325px; float:" + singleImageArray[1] + "'>"
										+ "<div style='position:relative;width:325px;height:auto;'>" + "<img src=" + Constants.STORY_IMG_PATH + singleImageArray[0] + " align=" + singleImageArray[1] + " alt='" 
										+ singleImageArray[2].replaceAll("'", "&#39;") + "' title='" + singleImageArray[2].replaceAll("'", "&#39;") + "' border=" + singleImageArray[3] + 
										" valign=top hspace=0 vspace=0 style='border:1px solid #d7d7d7; margin:2px 2px'><img src='http://media2.intoday.in/businesstoday/images/video-icon-mosimage.png' style='position:absolute;z-index:11;top:48%;left:44%' /></div>";
							} else {	
								imageDiv = "<div style='border:0px solid #d7d7d7; " + imageAlignment + " width:325px; float:" + singleImageArray[1] + "'>" + 
											"<div style='position:relative;width:325px;height:auto;'>" + 
											"<img rel='prefetch' src=" + Constants.STORY_IMG_PATH + singleImageArray[0] + " width='325' height='auto' border='0' align='middle' alt=" + singleImageArray[0] + 
											" title=" + singleImageArray[0] + " /><div align='center' style='text-align:left; padding:2px 3px;font:normal 11px arial; color:#9E9E9E;width:325px;background-color:#F5F5F5;' " + 
											"class='dtime'></div></div></div>";										
							}
							if (singleImageArray.length > 4 && singleImageArray[4] != null && (singleImageArray[4].trim()).length() > 0) {
								captionDiv = "<div class='dtime' style='text-align:left; padding:2px 3px;font:normal 11px arial; color:#9E9E9E;width:325px;background-color:#F5F5F5;' valign='" + singleImageArray[5] + "'>" + singleImageArray[4] + "</div><br/>";
							}
							if(singleImageArray.length > 5 && singleImageArray[5].equals("top")){
								completeImage = captionDiv + imageDiv;
							} else {
								completeImage = imageDiv + captionDiv  ;
							}							
							if (!largeImage.equals("")) {
								completeImage = completeImage
									+ "<div class='clicktoenlarge' style='width:325px; text-align:" + singleImageArray[6] + "' valign='" + singleImageArray[5] + "'>"
									+ "<a href='#' onClick=\"javascript:window.open('"+site_url+"story_image.jsp?img=" + largeImage 
									+ "&caption=" + singleImageArray[4] + "','window','status=no,resize=no,toolbar=no,scrollbars=yes,width=325,height=auto'); return false;\">Click here to Enlarge</a></div>";
							}
							completeImage = completeImage + "</div>";
						}
						fullbody = fullbody.replaceAll("\\{mosimage\\}", "mosimage");
						Pattern pa = Pattern.compile("mosimage"); 
						Matcher matcher = pa.matcher(fullbody);
						fullbody = matcher.replaceFirst(completeImage);
						full1 = fullbody;
					} catch (Exception ee) { 
						System.out.println("Found Exception in StoryHelper.mosimageToimagesOpt(String fullbody, String images): " + ee.toString());
					}
				}
			} catch (Exception e) {
				System.out.println("Found Exception in StoryHelper.mosimageToimagesOpt(String fullbody, String images): " + e);
			} finally {
				if(conn!=null)
					conn.close();
			}			
		} else {
			full1 = fullbody;
		}		
		return full1;
	}
	
}
