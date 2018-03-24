<%!
public static ArrayList getLatestStories(String primaryCatId, int contentCount, String contentIdToAvoid) 
{
	Connection connection = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ContentListDTO cDTO = null;
	ArrayList cAL = new ArrayList();
	String contentIdsToCheck = "";
	if(!contentIdToAvoid.equals("0")) {
		if(!contentIdToAvoid.equals("0") && contentIdToAvoid.indexOf(",") < 0)
			contentIdsToCheck = " and c.id != "+contentIdToAvoid+" ";
		else
			contentIdsToCheck = " and c.id not in ("+contentIdToAvoid+") ";
	}
	int pcatlength = 0;
	String pcatids[] = null;
	if(primaryCatId.indexOf("#") > 0) {
		pcatids = primaryCatId.split("#");
	} else {
		pcatids = new String[1];
		pcatids[0] = primaryCatId;
	}
	pcatlength = pcatids.length;
	int ctr=0;
	try {
		DbConnection connect = null;
		connect = DbConnection.getInstance("indiatoday");
		connection = connect.getConnection("indiatoday");
		String sql = "select c.id, c.title,c.introtext,c.sef_url,c.byline, c.large_kicker_image as kicker_image,  c.kicker_image_alt_text, ";

		if(pcatlength==1)
			sql = sql + "js.title as curcatname, js.id as curcatid, js.sef_url as curcatsefurl from jos_content c, jos_article_section jas, jos_sections js where jas.section_id="+pcatids[0]+" and c.id=jas.article_id and c.published=1 and jas.section_id=js.id and js.published=1 ";
		else if(pcatlength==2) 
			sql = sql + "jc.title as curcatname, jc.id as curcatid, jc.sef_url as curcatsefurl from jos_categories jc, jos_content c, jos_article_section jas, jos_sections js where jas.cat_id="+pcatids[1]+" and c.id=jas.article_id and c.published=1 and jc.id=jas.cat_id  and jc.section=js.id and jc.published=1 and js.published=1 ";
		else if(pcatlength==3) 
			sql = sql + "jsc.title as curcatname, jsc.id as curcatid, jsc.sef_url as curcatsefurl from jos_subcategories jsc, jos_content c, jos_article_section jas, jos_sections js, jos_categories jc where jas.subcat_id="+pcatids[2]+" and c.published=1 and c.id=jas.article_id and jsc.id=jas.subcat_id and jsc.category=jc.id and jsc.section=js.id and jsc.published=1 and jc.published=1 and js.published=1 ";
		else if(pcatlength==4) 
			sql = sql + "jssc.title as curcatname, jssc.id as curcatid, jssc.sef_url as curcatsefurl from jos_sub_subcategories jssc, jos_content c, jos_article_section jas, jos_sections js, jos_categories jc, jos_subcategories jsc where jas.sub_subcat_id="+pcatids[3]+" and c.published=1 and c.id=jas.article_id and jssc.id=jas.sub_subcat_id and jsc.id=jas.subcat_id and jc.id=jas.cat_id and js.id=jas.section_id and jssc.published=1 and js.published=1 and jsc.published=1 and jc.published=1 ";

		sql = sql + " "+contentIdsToCheck+" and c.title not like '%href=%' group by c.id order by jas.ordering desc limit "+contentCount;

		pstmt = connection.prepareStatement(sql);
		rs = pstmt.executeQuery();
		System.out.println("123--------------->"+sql);
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
			
			
			
			
			cAL.add(cDTO);
			ctr++;
		}
	} catch (Exception e) {
		System.out.println("global_include.jsp (latestContent for "+primaryCatId+") Exception is :" + e);
	} finally {
	try
	{
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
		if(connection!=null)
			connection.close();
			}
			catch(Exception e){}
	}
	return cAL;
}

public static ArrayList getLatestGalleries(int categoryId, int countToFetch, String galleryIdToAvoid) throws Exception
{
	ArrayList latestGalleries = new ArrayList();
	Connection connection = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ResultSet rs_pc = null;
	ContentListDTO lcDTO = null;
	String galleryCheck = "";
	String sql = "";
	
	if(!galleryIdToAvoid.equals("0")) {
		if(galleryIdToAvoid.indexOf(",") > 0)
			galleryCheck = "and gn.id not in ("+galleryIdToAvoid+")";
		else
			galleryCheck = "and gn.id != "+galleryIdToAvoid;
	}

	try {
		DbConnection connect = null;
		connect = DbConnection.getInstance("indiatoday");
		connection = connect.getConnection("indiatoday");
		
		
		if(categoryId==0) { 
			sql ="SELECT g.id,g.Gallery_name, g.mobile_image as thumb_image, g.sef_url,s.id AS photo_category, s.name AS photo_catname FROM jos_gallerynames g,jos_sections s WHERE g.section_id IN('38','39') AND g.published=1 AND g.section_id=s.id AND s.published=1 AND s.section_type='photo' AND s.magazineid=1 ORDER BY g.ordering DESC LIMIT "+countToFetch;
		
		
		} else {
			sql ="SELECT g.id,g.Gallery_name, g.mobile_image as thumb_image, g.sef_url,s.id AS photo_category, s.name AS photo_catname FROM jos_gallerynames g,jos_sections s WHERE g.section_id ='"+categoryId+"' AND g.published=1 AND g.section_id=s.id AND s.published=1 AND s.section_type='photo' AND s.magazineid=1 ORDER BY g.ordering DESC LIMIT "+countToFetch;
			
		}
		//System.out.print("mustsee->"+sql);
		pstmt = connection.prepareStatement(sql);
		rs = pstmt.executeQuery();
		sql="";
		pstmt=null;

		while (rs.next()) {
			lcDTO = new ContentListDTO();
			lcDTO.setId(rs.getInt("id"));
			lcDTO.setTitle(rs.getString("Gallery_name") == null ? "" : rs.getString("Gallery_name"));
			lcDTO.setSefTitle(rs.getString("sef_url") == null ? "" : rs.getString("sef_url"));
			lcDTO.setImage(rs.getString("thumb_image") == null ? "" : rs.getString("thumb_image"));
			lcDTO.setImageAltText(rs.getString("Gallery_name") == null ? "" : rs.getString("Gallery_name"));
			lcDTO.setContentType(rs.getString("photo_catname") == null ? "" : rs.getString("photo_catname"));
			/*try {
				sql = "SELECT count(pg.id) as photo_count FROM jos_photogallery pg where pg.gallery_id="+rs.getInt("id")+" and pg.enable=1";
				pstmt = connection.prepareStatement(sql);
				rs_pc = pstmt.executeQuery();
				//System.out.print("PC----"+sql);
				while (rs_pc.next()) {
					lcDTO.setContentCount(rs_pc.getInt("photo_count"));
				}
			} catch (Exception pcEx) {
				System.out.println("mustSee Photo Gallery Count - "+pcEx.toString());
			} finally {
				sql="";
				pstmt=null;
				rs_pc=null;
			}*/
			latestGalleries.add(lcDTO);
		}
	} catch (Exception e) {
		System.out.println("btwap-budget/2015/global_include_budget.jsp--- CommonFunctions.java-mustsee-Exception is :" + e);
	} finally {
		if(rs!=null)
			rs.close();
		if(rs_pc!=null)
			rs_pc.close();
		if(pstmt!=null)
			pstmt.close();
		if(connection!=null)
			connection.close();
	}
	return latestGalleries;
}


%>