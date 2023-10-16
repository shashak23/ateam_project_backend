/**
 * 작성자: 김태현
 * 작성일자: 2023-10-12
 * 내용: 내가 푼 알고리즘 문제들 목록을 저장할 VO 클래스입니다.
 */

package com.ktdsuniversity.edu.myalgorithm.vo;

import java.util.List;

public class MyAlgorithmListVO {
	private int myAlgotirhmListCnt;
	private List<MyAlgorithmVO> myAlgorithmList;
	
	
	public int getMyAlgotirhmListCnt() {
		return myAlgotirhmListCnt;
	}
	public void setMyAlgotirhmListCnt(int myAlgotirhmListCnt) {
		this.myAlgotirhmListCnt = myAlgotirhmListCnt;
	}
	public List<MyAlgorithmVO> getMyAlgorithmList() {
		return myAlgorithmList;
	}
	public void setMyAlgorithmList(List<MyAlgorithmVO> myAlgorithmList) {
		this.myAlgorithmList = myAlgorithmList;
	}
}
