/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 수정자: 장보늬(2023-10-23)
 * 내용: 알고리즘문제 게시판의 검색관련 VO를 가집니다.
 */

package com.ktdsuniversity.edu.algorithmquestion.vo;

import com.ktdsuniversity.edu.common.vo.AbstractSearchVO;

public class SearchAlgorithmQuestionVO extends AbstractSearchVO {

	private String[] algorithmCategoryIdList;
	private String[] algorithmTierList;
	private String category;
	private String tier;
	private String companyAlgorithmQuestionId;

	
	/**
	 * 검색을 하기위한 구분자
	 * 제목검색: algorithmTitle
	 * 내용검색: algorithmContent
	 * 출제기업검색: algorithmWriter
	 */
//	private String searchType;
	
	/**
	 * 검색 키워드
	 */
	private String searchKeyword;

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String[] getAlgorithmCategoryIdList() {
		return algorithmCategoryIdList;
	}

	public void setAlgorithmCategoryIdList(String[] algorithmCategoryIdList) {
		this.algorithmCategoryIdList = algorithmCategoryIdList;
	}

	public String[] getAlgorithmTierList() {
		return algorithmTierList;
	}

	public void setAlgorithmTierList(String[] algorithmTierList) {
		this.algorithmTierList = algorithmTierList;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTier() {
		return tier;
	}

	public void setTier(String tier) {
		this.tier = tier;
	}

	public String getCompanyAlgorithmQuestionId() {
		return companyAlgorithmQuestionId;
	}

	public void setCompanyAlgorithmQuestionId(String companyAlgorithmQuestionId) {
		this.companyAlgorithmQuestionId = companyAlgorithmQuestionId;
	}
	
}
