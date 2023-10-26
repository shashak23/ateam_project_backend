package com.ktdsuniversity.edu.home.vo;

import java.util.List;

import com.ktdsuniversity.edu.commoncode.vo.CommonCodeVO;

/**
 * 
 */
public class HomeBoardVO {
	private String generalPostId;
	private String postWriter;
	private String boardId;
	private String postTitle;
	private String postContent;
	private String postDate;
	private int likeCnt;
	private int viewCnt;
	private String deleteYn;
	
	private List<CommonCodeVO> commonCodeList;

	
	
	public String getGeneralPostId() {
		return generalPostId;
	}

	public void setGeneralPostId(String generalPostId) {
		this.generalPostId = generalPostId;
	}

	public String getPostWriter() {
		return postWriter;
	}

	public void setPostWriter(String postWriter) {
		this.postWriter = postWriter;
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

	public List<CommonCodeVO> getCommonCodeList() {
		return commonCodeList;
	}

	public void setCommonCodeList(List<CommonCodeVO> commonCodeList) {
		this.commonCodeList = commonCodeList;
	}
	
	
}
