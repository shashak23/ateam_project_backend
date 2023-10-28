package com.ktdsuniversity.edu.companymember.vo;

import java.util.List;

public class CompanyListVO {
	
	private int companyCnt;
	private List<CompanyVO> companyList;
	
	public int getCompanyCnt() {
		return companyCnt;
	}
	public void setCompanyCnt(int companyCnt) {
		this.companyCnt = companyCnt;
	}
	public List<CompanyVO> getCompanyList() {
		return companyList;
	}
	public void setCompanyList(List<CompanyVO> companyList) {
		this.companyList = companyList;
	}

}
