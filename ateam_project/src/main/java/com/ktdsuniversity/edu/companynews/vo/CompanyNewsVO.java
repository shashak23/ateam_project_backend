package com.ktdsuniversity.edu.companynews.vo;

public class CompanyNewsVO {
	
	private String companyNewsPostId;
	private String postWriter;
	private String postTitle;
	private String postContent;
	private String postDate;
	private String fileName;
	private String originFileName;
	private int viewCnt;
	private int likeCnt;
	private String deleteYn;
	
//	private CompanyVO companyVO;
	
	public String getCompanyNewsPostId() {
		return companyNewsPostId;
	}
	public void setCompanyNewsPostId(String companyNewsPostId) {
		this.companyNewsPostId = companyNewsPostId;
	}
	public String getPostWriter() {
		return postWriter;
	}
	public void setPostWriter(String postWriter) {
		this.postWriter = postWriter;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public String getPostDate() {
		return postDate;
	}
	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOriginFileName() {
		return originFileName;
	}
	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}

	
}
