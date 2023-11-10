/**
 * 수정자: 장보늬(2023-10-25)
 */
package com.ktdsuniversity.edu.common.vo;

public class AbstractSearchVO {
	private String searchType;
	private String searchKeyword;

	private int pageNo;
	
	
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
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
}
