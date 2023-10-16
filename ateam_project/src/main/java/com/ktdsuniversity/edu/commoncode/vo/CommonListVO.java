/**
 * 작성자: 김태현
 * 작성일자: 2023-10-11
 * 내용: 공통 코드 테이블의 전체 목록을 저장할 VO클래스입니다.
 */

package com.ktdsuniversity.edu.commoncode.vo;

import java.util.List;

public class CommonListVO {
	private int allCommonNumber;
	private List<CommonVO> commonList;
	private int hashtagCnt;
	private List<CommonVO> hashtagList;
	
	
	public int getAllCommonNumber() {
		return allCommonNumber;
	}
	public void setAllCommonNumber(int allCommonNumber) {
		this.allCommonNumber = allCommonNumber;
	}
	public List<CommonVO> getCommonList() {
		return commonList;
	}
	public void setCommonListVO(List<CommonVO> commonList) {
		this.commonList = commonList;
	}
	public int getHashtagCnt() {
		return hashtagCnt;
	}
	public void setHashtagCnt(int hashtagCnt) {
		this.hashtagCnt = hashtagCnt;
	}
	public List<CommonVO> getHashtagList() {
		return hashtagList;
	}
	public void setHashtagList(List<CommonVO> hashtagList) {
		this.hashtagList = hashtagList;
	}
	
}
