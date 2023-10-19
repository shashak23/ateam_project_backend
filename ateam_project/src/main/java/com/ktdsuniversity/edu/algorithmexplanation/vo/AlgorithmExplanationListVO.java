/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 내용: 알고리즘해설 게시판의 ListVO를 가집니다.
 */

package com.ktdsuniversity.edu.algorithmexplanation.vo;

import java.util.List;

public class AlgorithmExplanationListVO {
	
	private int algorithmExplanationCnt;
	private List<AlgorithmExplanationVO> algorithmExplanationList;
	public int getAlgorithmExplanationCnt() {
		return algorithmExplanationCnt;
	}
	public void setAlgorithmExplanationCnt(int algorithmExplanationCnt) {
		this.algorithmExplanationCnt = algorithmExplanationCnt;
	}
	public List<AlgorithmExplanationVO> getAlgorithmExplanationList() {
		return algorithmExplanationList;
	}
	public void setAlgorithmExplanationList(List<AlgorithmExplanationVO> algorithmExplanationList) {
		this.algorithmExplanationList = algorithmExplanationList;
	}
	

	
}
