/**
 * 작성자 : 김시하
 * 수정자 : 김시하
 * 작성일자 : 2023-10-19
 * 내용: 포럼 검색을 위한 vo
 */
package com.ktdsuniversity.edu.generalpost.vo;

import com.ktdsuniversity.edu.common.vo.AbstractSearchVO;

public class SearchForumVO extends AbstractSearchVO {

	/**
	 * 제목검색 혹은 내용검색을 하기위한 구분자.
	 * 제목검색: subject
	 * 내용검색: content
	 */
	private String searchType;

	/**
	 * 검색어
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
