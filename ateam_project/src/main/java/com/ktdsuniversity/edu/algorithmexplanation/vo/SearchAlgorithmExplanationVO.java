/**
 * 작성자: 장보늬
 * 작성일자: 2023-10-22
 * 내용: 검색기능 적용에 필요한 항목 VO
 * **/
package com.ktdsuniversity.edu.algorithmexplanation.vo;

import com.ktdsuniversity.edu.common.vo.AbstractSearchVO;

public class SearchAlgorithmExplanationVO extends AbstractSearchVO{
	
	private String searchType;
	private String searchKeyword;
	private String[] algorithmCategoryIdList;
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
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
	
	

}
