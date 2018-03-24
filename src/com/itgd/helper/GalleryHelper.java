package com.itgd.helper;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.util.ArrayList;


import com.itgd.utils.DbConnection;
import com.itgd.dto.GalleryDTO;


public class GalleryHelper {
	
	public static ArrayList photoDetail(int galleryId) throws Exception 
	{
		ArrayList photoList =new ArrayList();
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PreparedStatement pstmt1 = null;
		ResultSet rs1 = null;

		GalleryDTO photoDetails = null;
		int galleryPhotoCount = 0;
	    int primaryCategoryLength = 0;
	    String primaryCategoryId[] = null;
		String primaryCategory="1#3";

		try {
			DbConnection connect = null;
			DbConnection dbConn = DbConnection.getInstance("indiatoday");
			connection  = dbConn.getConnection("indiatoday");
			String sql = "";
			String sql1 = "";

			sql = "select g.id,g.Gallery_name,g.metakey,g.metadesc,p.photo_name,p.image_metakey," +
		      "p.photo_title,s.name as sectionname,s.sef_url,g.section_id" +
		      ",DATE_FORMAT(g.created,'%M %e, %Y') as created,g.sef_url as gallery_sefurl,g.Gallery_caption,g.metakey as gallerykeywords,g.metadesc as gallerydesc, " +
		      " p.photo_caption,p.image_alt_text,p.photo_name_width, p.photo_name_height  " +
		      " from jos_gallerynames g,jos_photogallery p,jos_sections as s " +
		      " where g.id=? and g.published=1 and g.section_id=s.id and s.published=1 " +
		      " and g.id=p.gallery_id and p.enable=1 " +
		      " and s.section_type='photo' and s.magazineid='1'" +
		      " order by p.ordering desc ";
			pstmt = connection.prepareStatement(sql);
	        pstmt.setInt(1, galleryId);
			System.out.println(sql);
			rs = pstmt.executeQuery();
			rs.last();
			galleryPhotoCount = rs.getRow();
			rs.beforeFirst();
			while (rs.next()) {
				photoDetails = new GalleryDTO();
				
				photoDetails.setPhotoTitle(rs.getString("photo_name"));
				photoDetails.setPhotoAltText(rs.getString("image_alt_text")==null?"":rs.getString("image_alt_text"));
				photoDetails.setPhotoCaption(rs.getString("photo_title")==null?"":rs.getString("photo_title"));
				photoDetails.setPhotoMetaKeyword(rs.getString("image_metakey")==null?"":rs.getString("image_metakey"));
				photoDetails.setPhotoSource(rs.getString("photo_caption")==null?"":rs.getString("photo_caption"));
				
				photoDetails.setGalleryId(rs.getInt("id"));				
				photoDetails.setGalleryTitle(rs.getString("Gallery_name"));
				photoDetails.setGallerySefTitle(rs.getString("gallery_sefurl"));
				photoDetails.setMetaKeyword(rs.getString("gallerykeywords")==null?"":rs.getString("gallerykeywords"));
				photoDetails.setMetaDescription(rs.getString("gallerydesc")==null?"":rs.getString("gallerydesc"));
				
				photoDetails.setPhotoCount(galleryPhotoCount);
				
				photoDetails.setCategoryId(rs.getInt("section_id"));
				photoDetails.setCategoryTitle(rs.getString("sectionname"));
				photoDetails.setCategorySefTitle(rs.getString("sef_url"));
				
				
				photoList.add(photoDetails);
			}
			
		} catch (Exception e) {
			System.out.println("GalleryHelper - photoDetails Exception is -->" + e);
			e.printStackTrace();
		} finally {
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(connection!=null)
				connection.close();
		}
		return photoList;
	}

}
