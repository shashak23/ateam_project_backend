package com.ktdsuniversity.edu.companyalgorithmquestion.vo;

public class CompanyAlgorithmQuestionVO {
	private String companyAlgorithmQuestionId;
	private String algorithmCategoryId;
	private String algorithmTierId;
	private String postWriter;
	private String postTitle;
	private String postContent;
	private String postDate;
	private int  viewCnt;
	private int likeCnt;
	private String deleteYn;
	
	
	public String getCompanyAlgorithmQuestionId() {
		return companyAlgorithmQuestionId;
	}
	public void setCompanyAlgorithmQuestionId(String companyAlgorithmQuestionId) {
		this.companyAlgorithmQuestionId = companyAlgorithmQuestionId;
	}
	public String getAlgorithmCategoryId() {
		return algorithmCategoryId;
	}
	public void setAlgorithmCategoryId(String algorithmCategoryId) {
		this.algorithmCategoryId = algorithmCategoryId;
	}
	public String getAlgorithmTierId() {
		return algorithmTierId;
	}
	public void setAlgorithmTierId(String algorithmTierId) {
		this.algorithmTierId = algorithmTierId;
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
