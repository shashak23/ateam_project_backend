/**
 * 작성자: 김시하
 * 작성일자: 2023-10-23
 * 내용: 기업 채용을 위한 ListVO
 */
package com.ktdsuniversity.edu.companyrecruit.vo;

import java.util.List;

public class CompanyRecruitListVO {

	private int boardCnt;
	private List<CompanyRecruitVO> companyRecruitList;
	
	public int getBoardCnt() {
		return boardCnt;
	}
	public void setBoardCnt(int boardCnt) {
		this.boardCnt = boardCnt;
	}
	public List<CompanyRecruitVO> getCompanyRecruitList() {
		return companyRecruitList;
	}
	public void setCompanyRecruitList(List<CompanyRecruitVO> companyRecruitList) {
		this.companyRecruitList = companyRecruitList;
	}
	
	
}
