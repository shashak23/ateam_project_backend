package com.ktdsuniversity.edu.generalpost.vo;

import com.ktdsuniversity.edu.member.vo.MemberVO;

import jakarta.validation.constraints.NotBlank;

public class GenaralPostVO {
	private String generalPostId;
	private String postWriterId;
	private String boardId;
	@NotBlank(message = "제목을 입력해 주세요.")
	private String postTitle;
	@NotBlank(message = "내용을 입력해 주세요")
	private String postContent;
	private String postDate;
	private int likeCnt;
	private int viewCnt;
	private String deleteYn;

	// 게시글을 작성하는 회원의 정보
	private MemberVO memberVO;

	public String getGeneralPostId() {
		return generalPostId;
	}

	public void setGeneralPostId(String generalPostId) {
		this.generalPostId = generalPostId;
	}

	public String getPostWriterId() {
		return postWriterId;
	}

	public void setPostWriterId(String postWriterId) {
		this.postWriterId = postWriterId;
	}

	public String getBoardId() {
		return boardId;
	}

	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public String getPostDate() {
		return postDate;
	}

	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getDeleteYn() {
		return deleteYn;
	}

	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	
	
}
