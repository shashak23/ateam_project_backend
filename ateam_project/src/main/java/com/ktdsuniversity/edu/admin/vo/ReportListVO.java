package com.ktdsuniversity.edu.admin.vo;

import java.util.List;

public class ReportListVO {
	
	private int reportCnt;
	private List<ReportVO> reportList;
	private String category;
	
	public int getReportCnt() {
		return reportCnt;
	}
	public void setReportCnt(int reportCnt) {
		this.reportCnt = reportCnt;
	}
	public List<ReportVO> getReportList() {
		return reportList;
	}
	public void setReportList(List<ReportVO> reportList) {
		this.reportList = reportList;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	
}
