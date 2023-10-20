/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 내용: 알고리즘문제 게시판의 VO를 가집니다.
 */

package com.ktdsuniversity.edu.algorithmquestion.vo;

import java.util.List;

import com.ktdsuniversity.edu.commoncode.vo.CommonCodeVO;
import com.ktdsuniversity.edu.companymember.vo.CompanyVO;
import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.util.XssIgnore;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

public class AlgorithmQuestionVO {

	private String companyAlgorithmQuestionId;

	@NotEmpty(message = "알고리즘 카테고리를 선택해주세요.")
	@Size(min = 1, message = "알고리즘 카테고리를 선택해주세요.")
	private List<String> algorithmCategoryIdList;

	private String mainAlgorithmCategoryId;

	@NotBlank(message = "난이도를 선택해주세요.")
	private String algorithmTierId;

	private String algorithmWriter;

	@XssIgnore
	@NotBlank(message = "제목을 입력해주세요.")
	private String algorithmTitle;

	@XssIgnore
	@NotBlank(message = "문제내용을 입력해주세요.")
	private String algorithmContent;

	@XssIgnore
	@NotBlank(message = "풀이내용을 입력해주세요.")
	private String algorithmSolution;
	
	private String postDate;
	private int viewCnt;
	private int likeCnt;
	private String deleteYn;

	/**
	 * 게시글을 작성한 회원의 정보
	 */
	private MemberVO memberVO;

	private GeneralMemberVO generalMemberVO;

	private CompanyVO companyVO;

	private CommonCodeVO commonCodeVO;

	public CommonCodeVO getCommonCodeVO() {
		return commonCodeVO;
	}

	public void setCommonCodeVO(CommonCodeVO commonCodeVO) {
		this.commonCodeVO = commonCodeVO;
	}

	public GeneralMemberVO getGeneralMemberVO() {
		return generalMemberVO;
	}

	public void setGeneralMemberVO(GeneralMemberVO generalMemberVO) {
		this.generalMemberVO = generalMemberVO;
	}

	public CompanyVO getCompanyVO() {
		return companyVO;
	}

	public void setCompanyVO(CompanyVO companyVO) {
		this.companyVO = companyVO;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public String getCompanyAlgorithmQuestionId() {
		return companyAlgorithmQuestionId;
	}

	public void setCompanyAlgorithmQuestionId(String companyAlgorithmQuestionId) {
		this.companyAlgorithmQuestionId = companyAlgorithmQuestionId;
	}

	public List<String> getAlgorithmCategoryIdList() {
		return algorithmCategoryIdList;
	}

	public void setAlgorithmCategoryIdList(List<String> algorithmCategoryIdList) {
		this.algorithmCategoryIdList = algorithmCategoryIdList;
	}

	public String getMainAlgorithmCategoryId() {
		return mainAlgorithmCategoryId;
	}

	public void setMainAlgorithmCategoryId(String mainAlgorithmCategoryId) {
		this.mainAlgorithmCategoryId = mainAlgorithmCategoryId;
	}

	public String getAlgorithmTierId() {
		return algorithmTierId;
	}

	public void setAlgorithmTierId(String algorithmTierId) {
		this.algorithmTierId = algorithmTierId;
	}

	public String getAlgorithmWriter() {
		return algorithmWriter;
	}

	public void setAlgorithmWriter(String algorithmWriter) {
		this.algorithmWriter = algorithmWriter;
	}

	public String getAlgorithmTitle() {
		return algorithmTitle;
	}

	public void setAlgorithmTitle(String algorithmTitle) {
		this.algorithmTitle = algorithmTitle;
	}

	public String getAlgorithmContent() {
		return algorithmContent;
	}

	public void setAlgorithmContent(String algorithmContent) {
		this.algorithmContent = algorithmContent;
	}

	public String getAlgorithmSolution() {
		return algorithmSolution;
	}

	public void setAlgorithmSolution(String algorithmSolution) {
		this.algorithmSolution = algorithmSolution;
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
