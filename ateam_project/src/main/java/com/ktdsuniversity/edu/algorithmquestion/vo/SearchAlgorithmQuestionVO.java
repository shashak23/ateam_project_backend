package com.ktdsuniversity.edu.algorithmquestion.vo;

public class SearchAlgorithmQuestionVO {

	
	/**
	 * 검색을 하기위한 구분자
	 * 제목검색: algorithmTitle
	 * 내용검색: algorithmContent
	 * 출제기업검색: algorithmWriter
	 */
	private String searchType;
	
	/**
	 * 검색 키워드
	 */
	private String searchKeyword;

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
	
	
}
