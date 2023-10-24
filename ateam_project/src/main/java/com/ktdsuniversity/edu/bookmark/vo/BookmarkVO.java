/**
 * 작성자: 김태현
 * 작성일: 2023-10-22
 * 내용: 북마크를 관리하는 VO
 */
package com.ktdsuniversity.edu.bookmark.vo;

import java.util.List;

import com.ktdsuniversity.edu.commoncode.vo.CommonCodeVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

public class BookmarkVO {
	/**
	 * 북마크의 고유번호
	 */
	private String bookmarkId;
	/**
	 * 북마크된 게시글 작성자의 이메일
	 */
	private String generalMemberEmail;
	/**
	 * 북마크된 게시글의 타입(자유, 질답, 기업 등)
	 */
	private String boardId;
	/**
	 * 북마크 된 게시글의 고유번호
	 */
	private String postId;
	/**
	 * 북마크 삭제 여부
	 */
	private String bookmarkYn;
	
	/**
	 * 북마크한 회원의 정보
	 */
	private MemberVO memberVO;
	/**
	 * 북마크된 게시글의 정보
	 */
	private GeneralPostVO generalPostVO;
	/**
	 * 북마크된 해시태그리스트의 정보
	 */
	private CommonCodeVO commonCodeVO;
	
	
	public String getBookmarkId() {
		return bookmarkId;
	}
	public void setBookmarkId(String bookmarkId) {
		this.bookmarkId = bookmarkId;
	}
	public String getGeneralMemberEmail() {
		return generalMemberEmail;
	}
	public void setGeneralMemberEmail(String generalMemberEmail) {
		this.generalMemberEmail = generalMemberEmail;
	}
	public String getBoardId() {
		return boardId;
	}
	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}
	public String getPostId() {
		return postId;
	}
	public void setPostId(String postId) {
		this.postId = postId;
	}
	public String getBookmarkYn() {
		return bookmarkYn;
	}
	public void setBookmarkYn(String bookmarkYn) {
		this.bookmarkYn = bookmarkYn;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public GeneralPostVO getGeneralPostVO() {
		return generalPostVO;
	}
	public void setGeneralPostVO(GeneralPostVO generalPostVO) {
		this.generalPostVO = generalPostVO;
	}
	public CommonCodeVO getCommonCodeVO() {
		return commonCodeVO;
	}
	public void setCommonCodeVO(CommonCodeVO commonCodeVO) {
		this.commonCodeVO = commonCodeVO;
	}
}
