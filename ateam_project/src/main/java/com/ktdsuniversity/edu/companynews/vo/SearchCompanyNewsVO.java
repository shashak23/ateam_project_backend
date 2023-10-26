package com.ktdsuniversity.edu.companynews.vo;

import com.ktdsuniversity.edu.common.vo.AbstractSearchVO;

public class SearchCompanyNewsVO extends AbstractSearchVO {
	
	private String searchType;
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
