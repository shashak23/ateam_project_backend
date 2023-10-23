package com.ktdsuniversity.edu.report.vo;

import java.util.List;

public class ReportListVO {
	private int reportCnt;
	private List<ReportVO> reportList;
	
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
	
}
