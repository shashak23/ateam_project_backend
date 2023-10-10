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
