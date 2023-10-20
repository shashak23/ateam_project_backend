/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 내용: 알고리즘해설 게시판의 VO를 가집니다.
 */

package com.ktdsuniversity.edu.algorithmexplanation.vo;

import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.commoncode.vo.CommonCodeVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.util.XssIgnore;

import jakarta.validation.constraints.NotBlank;

public class AlgorithmExplanationVO {
	
	private String companyAlgorithmExplanationId;
	
	@NotBlank(message = "알고리즘 카테고리를 선택해주세요.")
	private String algorithmCategoryId;
	
	private String postWriter;
	
	@XssIgnore
	@NotBlank(message = "제목을 입력해주세요.")
	private String postTitle;
	
	@XssIgnore
	@NotBlank(message = "내용을 입력해주세요.")
	private String postContent;
	
	private String postDate;
	private int viewCnt;
	private int likeCnt;
	private String deleteYn;
	
	private MemberVO memberVO;
	
	private CommonCodeVO commonCodeVO;
	
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public CommonCodeVO getCommonCodeVO() {
		return commonCodeVO;
	}
	public void setCommonCodeVO(CommonCodeVO commonCodeVO) {
		this.commonCodeVO = commonCodeVO;
	}
	public String getCompanyAlgorithmExplanationId() {
		return companyAlgorithmExplanationId;
	}
	public void setCompanyAlgorithmExplanationId(String companyAlgorithmExplanationId) {
		this.companyAlgorithmExplanationId = companyAlgorithmExplanationId;
	}
	
	public String getAlgorithmCategoryId() {
		return algorithmCategoryId;
	}
	public void setAlgorithmCategoryId(String algorithmCategoryId) {
		this.algorithmCategoryId = algorithmCategoryId;
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
