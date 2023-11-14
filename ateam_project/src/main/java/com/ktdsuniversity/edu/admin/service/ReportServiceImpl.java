package com.ktdsuniversity.edu.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktdsuniversity.edu.admin.dao.AdminDAO;
import com.ktdsuniversity.edu.admin.vo.ReportListVO;
import com.ktdsuniversity.edu.admin.vo.ReportVO;
import com.ktdsuniversity.edu.generalpost.dao.GeneralCommentDAO;

@Service
public class ReportServiceImpl implements ReportService{

	@Autowired
	private AdminDAO reportDAO;
	
	private GeneralCommentDAO generalCommentDAO;

	@Override
	public ReportListVO getAllReport() {
		ReportListVO reportListVO = new ReportListVO();
		reportListVO.setReportCnt(reportDAO.reportAllCount());
		reportListVO.setReportList(reportDAO.reportAllList());
		return reportListVO;
	}
		
	@Override
	public ReportVO getSingleReport(String reportId) {
		ReportVO reportVO = reportDAO.singleReport(reportId);
		return reportVO;
	}

	@Override
	public ReportListVO getMemberReportList() {
		ReportListVO reportListVO = new ReportListVO();
		reportListVO.setReportList(reportDAO.memberReportList());
		reportListVO.setReportCnt(reportDAO.memberReportAllCount());
		return reportListVO;
	}

	@Override
	public ReportListVO getFreeBoardReportList() {
		ReportListVO reportListVO = new ReportListVO();
		reportListVO.setReportList(reportDAO.freeBoardReportList());
		reportListVO.setReportCnt(reportDAO.freeBoardReportAllCount());
		return reportListVO;
	}

	@Override
	public ReportListVO getQnaBoardReportList() {
		ReportListVO reportListVO = new ReportListVO();
		reportListVO.setReportList(reportDAO.qnaBoardReportList());
		reportListVO.setReportCnt(reportDAO.qnaBoardReportAllCount());
		return reportListVO;
	}

	@Override
	public ReportListVO getFreeBoardCommentReportList() {
		ReportListVO reportListVO = new ReportListVO();
		reportListVO.setReportList(reportDAO.freeBoardCommentReportList());
		return reportListVO;
	}

	@Override
	public ReportListVO getQnaBoardCommentReportList() {
		ReportListVO reportListVO = new ReportListVO();
		reportListVO.setReportList(reportDAO.qnaBoardCommentReportList());
		return reportListVO;
	}

	@Override
	public boolean doCompleteProgressYn(String reportId) {
		int completeProgressCount = reportDAO.completeProgressYn(reportId);
		return completeProgressCount > 0;
	}
	
	// 게시글 신고
	@Override
	public boolean createReport(ReportVO reportVO) {
		int boardCount = reportDAO.createReport(reportVO);
		
		return boardCount > 0;
	}

}
