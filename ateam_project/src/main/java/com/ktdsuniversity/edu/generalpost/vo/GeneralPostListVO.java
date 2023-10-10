package com.ktdsuniversity.edu.generalpost.vo;

import java.util.List;

public class GeneralPostListVO {

	private int boardCnt;
	private List<GenaralPostVO> generalPostList;
	
	public int getBoardCnt() {
		return boardCnt;
	}
	public void setBoardCnt(int boardCnt) {
		this.boardCnt = boardCnt;
	}
	public List<GenaralPostVO> getGeneralPostList() {
		return generalPostList;
	}
	public void setGeneralPostList(List<GenaralPostVO> generalPostList) {
		this.generalPostList = generalPostList;
	}
	
	
}
