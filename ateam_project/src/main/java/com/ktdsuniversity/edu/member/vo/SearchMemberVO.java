package com.ktdsuniversity.edu.member.vo;

import com.ktdsuniversity.edu.common.vo.AbstractSearchVO;

public class SearchMemberVO extends AbstractSearchVO {

	private String searchKeyword;
	
	private String memberType;

	public String getMemberType() {
		return memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	
	
	
}
