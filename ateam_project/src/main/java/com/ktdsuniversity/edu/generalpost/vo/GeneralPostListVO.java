package com.ktdsuniversity.edu.generalpost.vo;

import java.util.List;

public class GeneralPostListVO {

	private int boardCnt;
	private List<GeneralPostVO> generalPostList;
	
	public int getBoardCnt() {
		return boardCnt;
	}
	public void setBoardCnt(int boardCnt) {
		this.boardCnt = boardCnt;
	}
	public List<GeneralPostVO> getGeneralPostList() {
		return generalPostList;
	}
	public void setGeneralPostList(List<GeneralPostVO> generalPostList) {
		this.generalPostList = generalPostList;
	}
	
}
