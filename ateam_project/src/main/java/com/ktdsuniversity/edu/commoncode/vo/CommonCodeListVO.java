/**
 * 작성자: 김태현
 * 수정자: 장보늬(2023-10-17)
 * 작성일자: 2023-10-11
 * 내용: 공통 코드 테이블의 전체 목록을 저장할 VO클래스입니다.
 */

package com.ktdsuniversity.edu.commoncode.vo;

import java.util.List;

public class CommonCodeListVO {
	private int allCommonNumber;
	private List<CommonCodeVO> commonCodeList;
	private int hashtagCnt;
	private List<CommonCodeVO> hashtagList;
	
	
	public int getAllCommonNumber() {
		return allCommonNumber;
	}
	public void setAllCommonNumber(int allCommonNumber) {
		this.allCommonNumber = allCommonNumber;
	}
	public List<CommonCodeVO> getCommonCodeList() {
		return commonCodeList;
	}
	public void setCommonCodeListVO(List<CommonCodeVO> commonCodeList) {
		this.commonCodeList = commonCodeList;
	}
	public int getHashtagCnt() {
		return hashtagCnt;
	}
	public void setHashtagCnt(int hashtagCnt) {
		this.hashtagCnt = hashtagCnt;
	}
	public List<CommonCodeVO> getHashtagList() {
		return hashtagList;
	}
	public void setHashtagList(List<CommonCodeVO> hashtagList) {
		this.hashtagList = hashtagList;
	}
	
}
