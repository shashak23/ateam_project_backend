package com.ktdsuniversity.edu.admin.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktdsuniversity.edu.admin.dao.ReportDAO;
import com.ktdsuniversity.edu.admin.vo.ReportListVO;
import com.ktdsuniversity.edu.admin.vo.ReportVO;
import com.ktdsuniversity.edu.generalpost.web.FreePostController;

import jakarta.mail.internet.MimeMessage;

@Service
public class ReportServiceImpl implements ReportService{
	
	private Logger log = LoggerFactory.getLogger(FreePostController.class);

	@Autowired
	private ReportDAO reportDAO;
	@Transactional
	@Override
	public ReportListVO getAllReport() {
		ReportListVO reportListVO = new ReportListVO();
		reportListVO.setReportCnt(reportDAO.reportAllCount());
		reportListVO.setReportList(reportDAO.reportAllList());
		return reportListVO;
	}
	@Transactional	
	@Override
	public ReportVO getSingleReport(String reportId) {
		ReportVO reportVO = reportDAO.singleReport(reportId);
		return reportVO;
	}
	@Transactional
	@Override
	public ReportListVO getMemberReportList() {
		ReportListVO reportListVO = new ReportListVO();
		reportListVO.setReportList(reportDAO.memberReportList());
		reportListVO.setReportCnt(reportDAO.memberReportAllCount());
		return reportListVO;
	}
	@Transactional
	@Override
	public ReportListVO getFreeBoardReportList() {
		ReportListVO reportListVO = new ReportListVO();
		reportListVO.setReportList(reportDAO.freeBoardReportList());
		reportListVO.setReportCnt(reportDAO.freeBoardReportAllCount());
		return reportListVO;
	}
	@Transactional
	@Override
	public ReportListVO getQnaBoardReportList() {
		ReportListVO reportListVO = new ReportListVO();
		reportListVO.setReportList(reportDAO.qnaBoardReportList());
		reportListVO.setReportCnt(reportDAO.qnaBoardReportAllCount());
		return reportListVO;
	}
	@Transactional
	@Override
	public ReportListVO getFreeBoardCommentReportList() {
		ReportListVO reportListVO = new ReportListVO();
		reportListVO.setReportList(reportDAO.freeBoardCommentReportList());
		return reportListVO;
	}
	@Transactional
	@Override
	public ReportListVO getQnaBoardCommentReportList() {
		ReportListVO reportListVO = new ReportListVO();
		reportListVO.setReportList(reportDAO.qnaBoardCommentReportList());
		return reportListVO;
	}
	@Transactional
	@Override
	public boolean doCompleteProgressYn(String reportId) {
		int completeProgressCount = reportDAO.completeProgressYn(reportId);
		return completeProgressCount > 0;
	}
	
	// 게시글 신고
	@Transactional
	@Override
	public boolean createReport(ReportVO reportVO) {
		log.debug("--2--Service--------------------------------------");
		int boardCount = reportDAO.createReport(reportVO);
		return boardCount > 0;
	}


}
