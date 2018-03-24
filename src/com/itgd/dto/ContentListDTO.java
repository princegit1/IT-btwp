package com.itgd.dto;


public class ContentListDTO
{

    private int id;
    private String title;
    private String sefTitle;
    private String image;
    private String imageAltText;
    private String latestIds;
    private int currentCategoryId;
    private String currentCategoryTitle;
    private String currentCategorySefTitle;
    private String contentType;
    private String metaKeyword;
    private String metaDescription;
    private String updatedTime;
    private String fullDescription;
    private int contentCount;
    private String byLine;
    private String smallImage;
    private String mobileImage;
    private String largeImage;

    public ContentListDTO()
    {
    }

    
    public void setSmallImage(String smallImage) {
		this.smallImage = smallImage;
	}public String getSmallImage() {
		return smallImage;
	}public void setMobileImage(String mobileImage) {
		this.mobileImage = mobileImage;
	}public String getMobileImage() {
		return mobileImage;
	}
    public String getByLine()
    {
        return byLine;
    }

    public void setByLine(String byLine)
    {
        this.byLine = byLine;
    }

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getSefTitle()
    {
        return sefTitle;
    }

    public void setSefTitle(String sefTitle)
    {
        this.sefTitle = sefTitle;
    }

    public String getImage()
    {
        return image;
    }

    public void setImage(String image)
    {
        this.image = image;
    }

    public String getImageAltText()
    {
        return imageAltText;
    }

    public void setImageAltText(String imageAltText)
    {
        this.imageAltText = imageAltText;
    }

    public String getLatestIds()
    {
        return latestIds;
    }

    public void setLatestIds(String latestIds)
    {
        this.latestIds = latestIds;
    }

    public int getCurrentCategoryId()
    {
        return currentCategoryId;
    }

    public void setCurrentCategoryId(int currentCategoryId)
    {
        this.currentCategoryId = currentCategoryId;
    }

    public String getCurrentCategoryTitle()
    {
        return currentCategoryTitle;
    }

    public void setCurrentCategoryTitle(String currentCategoryTitle)
    {
        this.currentCategoryTitle = currentCategoryTitle;
    }

    public String getCurrentCategorySefTitle()
    {
        return currentCategorySefTitle;
    }

    public void setCurrentCategorySefTitle(String currentCategorySefTitle)
    {
        this.currentCategorySefTitle = currentCategorySefTitle;
    }

    public String getContentType()
    {
        return contentType;
    }

    public void setContentType(String contentType)
    {
        this.contentType = contentType;
    }

    public String getMetaKeyword()
    {
        return metaKeyword;
    }

    public void setMetaKeyword(String metaKeyword)
    {
        this.metaKeyword = metaKeyword;
    }

    public String getMetaDescription()
    {
        return metaDescription;
    }

    public void setMetaDescription(String metaDescription)
    {
        this.metaDescription = metaDescription;
    }

    public String getUpdatedTime()
    {
        return updatedTime;
    }

    public void setUpdatedTime(String updatedTime)
    {
        this.updatedTime = updatedTime;
    }

    public String getFullDescription()
    {
        return fullDescription;
    }

    public void setFullDescription(String fullDescription)
    {
        this.fullDescription = fullDescription;
    }

    public int getContentCount()
    {
        return contentCount;
    }

    public void setContentCount(int contentCount)
    {
        this.contentCount = contentCount;
    }


	public void setLargeImage(String largeImage) {
		this.largeImage = largeImage;
	}


	public String getLargeImage() {
		return largeImage;
	}
}
