/**
 * 작성자: 김태현
 * 작성일: 2023-10-23
 * 내용: 사용자 별 북마크 정보들을 저장할 리스트입니다.
 */
package com.ktdsuniversity.edu.bookmark.vo;

import java.util.List;

public class BookmarkListVO {
	/**
	 * 회원이 등록한 북마크들을 저장할 리스트
	 */
	private List<BookmarkVO> bookmarkList;

	
	public List<BookmarkVO> getBookmarkList() {
		return bookmarkList;
	}

	public void setBookmarkList(List<BookmarkVO> bookmarkList) {
		this.bookmarkList = bookmarkList;
	}
}
