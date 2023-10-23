package com.ktdsuniversity.edu.report.vo;

import com.ktdsuniversity.edu.commoncode.vo.CommonCodeVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

public class ReportVO {
	
	private String reportId;
	private String reportMember;
	private String reportTypeId;
	private String receivedReportMember;
	private String reportContentId;
	private String reportDate;
	private String reportReason;
	private String reportReasonContent;
	private String attachedImg;
	private String progressYn;
	
	private MemberVO memberVO;
	
	private CommonCodeVO commonCodeVO;

	public String getReportId() {
		return reportId;
	}

	public void setReportId(String reportId) {
		this.reportId = reportId;
	}

	public String getReportMember() {
		return reportMember;
	}

	public void setReportMember(String reportMember) {
		this.reportMember = reportMember;
	}

	public String getReportTypeId() {
		return reportTypeId;
	}

	public void setReportTypeId(String reportTypeId) {
		this.reportTypeId = reportTypeId;
	}

	public String getReceivedReportMember() {
		return receivedReportMember;
	}

	public void setReceivedReportMember(String receivedReportMember) {
		this.receivedReportMember = receivedReportMember;
	}

	public String getReportContentId() {
		return reportContentId;
	}

	public void setReportContentId(String reportContentId) {
		this.reportContentId = reportContentId;
	}

	public String getReportDate() {
		return reportDate;
	}

	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}

	public String getReportReason() {
		return reportReason;
	}

	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}

	public String getReportReasonContent() {
		return reportReasonContent;
	}

	public void setReportReasonContent(String reportReasonContent) {
		this.reportReasonContent = reportReasonContent;
	}

	public String getAttachedImg() {
		return attachedImg;
	}

	public void setAttachedImg(String attachedImg) {
		this.attachedImg = attachedImg;
	}

	public String getProgressYn() {
		return progressYn;
	}

	public void setProgressYn(String progressYn) {
		this.progressYn = progressYn;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public CommonCodeVO getCommonCodeVO() {
		return commonCodeVO;
	}

	public void setCommonCodeVO(CommonCodeVO commonCodeVO) {
		this.commonCodeVO = commonCodeVO;
	}

	
}
