/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 내용: 기업소식 게시판의 ListVO를 가집니다.
 */

package com.ktdsuniversity.edu.companynews.vo;

import java.util.List;

public class CompanyNewsListVO {
	
	private int companyNewsCnt;
	private List<CompanyNewsVO> companyNewsList;
	
	public int getCompanyNewsCnt() {
		return companyNewsCnt;
	}
	public void setCompanyNewsCnt(int companyNewsCnt) {
		this.companyNewsCnt = companyNewsCnt;
	}
	public List<CompanyNewsVO> getCompanyNewsList() {
		return companyNewsList;
	}
	public void setCompanyNewsList(List<CompanyNewsVO> companyNewsList) {
		this.companyNewsList = companyNewsList;
	}
	
	

}
