/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 내용: 알고리즘문제 게시판의 ListVO를 가집니다.
 */

package com.ktdsuniversity.edu.algorithmquestion.vo;

import java.util.List;

public class AlgorithmQuestionListVO {
	
	private int algorithmQuestionCnt;
	private List<AlgorithmQuestionVO> algorithmQuestionList;
	
	public int getAlgorithmQuestionCnt() {
		return algorithmQuestionCnt;
	}
	public void setAlgorithmQuestionCnt(int algorithmQuestionCnt) {
		this.algorithmQuestionCnt = algorithmQuestionCnt;
	}
	public List<AlgorithmQuestionVO> getAlgorithmQuestionList() {
		return algorithmQuestionList;
	}
	public void setAlgorithmQuestionList(List<AlgorithmQuestionVO> algorithmQuestionList) {
		this.algorithmQuestionList = algorithmQuestionList;
	}

	
}
