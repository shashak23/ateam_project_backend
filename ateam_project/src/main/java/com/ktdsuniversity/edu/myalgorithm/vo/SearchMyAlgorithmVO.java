/**
 * 작성자: 김태현
 * 작성일: 23-10-20
 * 내용: 검색을 위한 VO입니다.
 */

package com.ktdsuniversity.edu.myalgorithm.vo;


public class SearchMyAlgorithmVO {
	private String searchType;
	private String searchKeyword;
	private String email;
	private int pageNo;
	private int listSize;
	private int pageCount;
	private int pageCountInGroup;
	private int groupCount;
	private int groupNo;
	private int groupStartPageNo;
	private int groupEndPageNo;
	private boolean hasNextGroup;
	private boolean hasPrevGroup;
	private int nextGroupStartPageNo;
	private int prevGroupStartPageNo;
	
	
	
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
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

	public SearchMyAlgorithmVO() {
		// listSize를 별도로 지정하지 않으면
		// 한 게시글 목록에는 10개만 노출된다.
		this.listSize = 10;
		// 하나의 페이지 그룹에는 10개의 페이지 번호가 노출된다.
		this.pageCountInGroup = 10;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getPageCount() {
		return pageCount;
	}
	
	/**
	 * 게시글의 개수를 할당하면 생성되어야 하는 페이지의 최대 크기가 pageCount에 할당된다.
	 * 
	 * @param listCount 검색된 게시글의 총 개수.
	 */
	public void setPageCount(int listCount) {
		this.pageCount = (int) Math.ceil((double) listCount / this.listSize);
		this.groupCount = (int) Math.ceil((double) this.pageCount / this.pageCountInGroup);
		this.groupNo = this.pageNo / this.pageCountInGroup;
		this.groupStartPageNo = this.groupNo * this.pageCountInGroup;
		this.groupEndPageNo = (this.groupNo + 1) * this.pageCountInGroup - 1;
		
		if (groupEndPageNo > this.pageCount - 1) {
			this.groupEndPageNo = this.pageCount - 1;
		}
		this.hasNextGroup = this.groupNo + 1 < this.groupCount;
		this.hasPrevGroup = this.groupNo > 0;
		this.nextGroupStartPageNo = this.groupEndPageNo + 1;
		this.prevGroupStartPageNo = this.groupStartPageNo - this.pageCountInGroup;
	}
	
	public int getPageCountInGroup() {
		return pageCountInGroup;
	}

	public void setPageCountInGroup(int pageCountInGroup) {
		this.pageCountInGroup = pageCountInGroup;
	}

	public int getGroupCount() {
		return groupCount;
	}

	public void setGroupCount(int groupCount) {
		this.groupCount = groupCount;
	}
	
	public int getGroupNo() {
		return groupNo;
	}
	
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getGroupStartPageNo() {
		return groupStartPageNo;
	}

	public void setGroupStartPageNo(int groupStartPageNo) {
		this.groupStartPageNo = groupStartPageNo;
	}

	public int getGroupEndPageNo() {
		return groupEndPageNo;
	}

	public void setGroupEndPageNo(int groupEndPageNo) {
		this.groupEndPageNo = groupEndPageNo;
	}

	public boolean isHasNextGroup() {
		return hasNextGroup;
	}

	public void setHasNextGroup(boolean hasNextGroup) {
		this.hasNextGroup = hasNextGroup;
	}

	public boolean isHasPrevGroup() {
		return hasPrevGroup;
	}

	public void setHasPrevGroup(boolean hasPrevGroup) {
		this.hasPrevGroup = hasPrevGroup;
	}

	public int getNextGroupStartPageNo() {
		return nextGroupStartPageNo;
	}

	public void setNextGroupStartPageNo(int nextGroupStartPageNo) {
		this.nextGroupStartPageNo = nextGroupStartPageNo;
	}

	public int getPrevGroupStartPageNo() {
		return prevGroupStartPageNo;
	}

	public void setPrevGroupStartPageNo(int prevGroupStartPageNo) {
		this.prevGroupStartPageNo = prevGroupStartPageNo;
	}
}
