/**
 * 작성자: 남현욱
 * 작성일자: 2023-10-16
 * 내용: 질문 답변 게시판 댓글을 위한 VO입니다.
 */
package com.ktdsuniversity.edu.generalpost.vo;

import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;

public class GeneralCommentVO {

	private String generalCommentId;
	private String commentWriter;
	private String generalPostId;
	private String commentContent;
	private String postDate;
	private String upperCommentId;
	private int likeCnt;
	private char deleteYn;
	
	private GeneralMemberVO generalMemberVO;
	private GeneralPostVO generalPostVO;
	public String getGeneralCommentId() {
		return generalCommentId;
	}
	public void setGeneralCommentId(String generalCommentId) {
		this.generalCommentId = generalCommentId;
	}
	public String getCommentWriter() {
		return commentWriter;
	}
	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
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
	public GeneralPostVO getGeneralPostVO() {
		return generalPostVO;
	}
	public void setGeneralPostVO(GeneralPostVO generalPostVO) {
		this.generalPostVO = generalPostVO;
	}

	
}
