/**
 * 작성자: 김태현
 * 작성일: 2023-10-23
 * 내용: 북마크 된 게시글 검색을 도와주는 VO입니다.
 */

package com.ktdsuniversity.edu.bookmark.vo;

public class BookmarkSearchVO {
	private String email;
	private String generalPostId;
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGeneralPostId() {
		return generalPostId;
	}
	public void setGeneralPostId(String generalPostId) {
		this.generalPostId = generalPostId;
	}
}
