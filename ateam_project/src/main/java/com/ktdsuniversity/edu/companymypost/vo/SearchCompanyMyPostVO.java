package com.ktdsuniversity.edu.companymypost.vo;

public class SearchCompanyMyPostVO {
	/**
	 * 검색을 하기위한 구분자
	 * 제목검색: myPostTitle
	 * 내용검색: myPostContent
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
