
/**
 * 작성자: 김시하
 * 작성일자: 2023-10-23
 * 내용: 기업 채용을 위한 VO
 */

package com.ktdsuniversity.edu.companyrecruit.vo;

public class CompanyRecruitVO {

	private String companyRecruitPostId;
	private String postWriter;
	private String postTitle;
	private String postContent;
	private String postDate;
	private String recruitStartDate;
	private String recruitEndDate;
	private String recruitProgressYn;
	private String recruitType;
	private int minCareerYear;
	private int maxCareerYear;
	private int viewCnt;
	private int likeCnt;
	private String deleteYn;
	public String getCompanyRecruitPostId() {
		return companyRecruitPostId;
	}
	public void setCompanyRecruitPostId(String companyRecruitPostId) {
		this.companyRecruitPostId = companyRecruitPostId;
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
	public String getRecruitStartDate() {
		return recruitStartDate;
	}
	public void setRecruitStartDate(String recruitStartDate) {
		this.recruitStartDate = recruitStartDate;
	}
	public String getRecruitEndDate() {
		return recruitEndDate;
	}
	public void setRecruitEndDate(String recruitEndDate) {
		this.recruitEndDate = recruitEndDate;
	}
	public String getRecruitProgressYn() {
		return recruitProgressYn;
	}
	public void setRecruitProgressYn(String recruitProgressYn) {
		this.recruitProgressYn = recruitProgressYn;
	}
	public String getRecruitType() {
		return recruitType;
	}
	public void setRecruitType(String recruitType) {
		this.recruitType = recruitType;
	}
	public int getMinCareerYear() {
		return minCareerYear;
	}
	public void setMinCareerYear(int minCareerYear) {
		this.minCareerYear = minCareerYear;
	}
	public int getMaxCareerYear() {
		return maxCareerYear;
	}
	public void setMaxCareerYear(int maxCareerYear) {
		this.maxCareerYear = maxCareerYear;
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
