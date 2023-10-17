package com.ktdsuniversity.edu.generalpost.vo;

import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;

public class GeneralCommentVO {

	private String generalCommentId;
	private String commentWriterId;
	private String generalPostId;
	private String commentContent;
	private String postDate;
	private String upperCommentId;
	private int likeCnt;
	private char deleteYn;
	
	private GeneralMemberVO generalMemberVO;

	public String getGeneralCommentId() {
		return generalCommentId;
	}

	public void setGeneralCommentId(String generalCommentId) {
		this.generalCommentId = generalCommentId;
	}

	public String getCommentWriterId() {
		return commentWriterId;
	}

	public void setCommentWriterId(String commentWriterId) {
		this.commentWriterId = commentWriterId;
	}

	public String getGeneralPostId() {
		return generalPostId;
	}

	public void setGeneralPostId(String generalPostId) {
		this.generalPostId = generalPostId;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getPostDate() {
		return postDate;
	}

	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}

	public String getUpperCommentId() {
		return upperCommentId;
	}

	public void setUpperCommentId(String upperCommentId) {
		this.upperCommentId = upperCommentId;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	public char getDeleteYn() {
		return deleteYn;
	}

	public void setDeleteYn(char deleteYn) {
		this.deleteYn = deleteYn;
	}

	public GeneralMemberVO getGeneralMemberVO() {
		return generalMemberVO;
	}

	public void setGeneralMemberVO(GeneralMemberVO generalMemberVO) {
		this.generalMemberVO = generalMemberVO;
	}

	
}
