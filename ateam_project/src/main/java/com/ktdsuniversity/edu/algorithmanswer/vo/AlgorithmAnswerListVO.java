/**
 * 작성자: 장보늬
 * 작성일자: 2023-10-26
 * 내용: 알고리즘문제 테스트 데이터 관련 ListVO
 */
package com.ktdsuniversity.edu.algorithmanswer.vo;

import java.util.List;

public class AlgorithmAnswerListVO {
	
	private int algorithmAnswerCnt;
	private List<AlgorithmAnswerVO> algorithmAnswerList;
	
	public int getAlgorithmAnswerCnt() {
		return algorithmAnswerCnt;
	}
	public void setAlgorithmAnswerCnt(int algorithmAnswerCnt) {
		this.algorithmAnswerCnt = algorithmAnswerCnt;
	}
	public List<AlgorithmAnswerVO> getAlgorithmAnswerList() {
		return algorithmAnswerList;
	}
	public void setAlgorithmAnswerList(List<AlgorithmAnswerVO> algorithmAnswerList) {
		this.algorithmAnswerList = algorithmAnswerList;
	}

	
}
