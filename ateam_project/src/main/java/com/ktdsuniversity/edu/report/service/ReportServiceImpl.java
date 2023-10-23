package com.ktdsuniversity.edu.report.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ktdsuniversity.edu.generalpost.web.FreePostController;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktdsuniversity.edu.report.dao.ReportDAO;
import com.ktdsuniversity.edu.report.vo.ReportListVO;
import com.ktdsuniversity.edu.report.vo.ReportVO;

@Service
public class ReportServiceImpl implements ReportService{

	@Autowired
	private ReportDAO reportDAO;


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
//		reportListVO.setReportCnt(reportDAO.);
		reportListVO.setReportList(reportDAO.memberReportList());
		System.out.println(reportListVO);
		return reportListVO;
	}

	@Override
	public ReportListVO getFreeBoardReportList() {
		ReportListVO reportListVO = new ReportListVO();
		reportListVO.setReportList(reportDAO.freeBoardReportList());
		return reportListVO;
	}

	@Override
	public ReportListVO getQnaBoardReportList() {
		ReportListVO reportListVO = new ReportListVO();
		reportListVO.setReportList(reportDAO.qnaBoardReportList());
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
