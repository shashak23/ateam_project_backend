package com.ktdsuniversity.edu.admin.service;

import com.ktdsuniversity.edu.admin.vo.ReportListVO;
import com.ktdsuniversity.edu.admin.vo.ReportVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

public interface ReportService {

	/**
	 * 
	 * @return 모든 신고물 개수와 목록
	 */
	public ReportListVO getAllReport();
	
	/**
	 * 
	 * @param reportId 신고물 id
	 * @return 신고물 정보
	 */
	public ReportVO getSingleReport(String reportId);
	
	/**
	 * 
	 * @return 신고당한 멤버 리스트
	 */
	public ReportListVO getMemberReportList();

	/**
	 * 
	 * @return 신고당한 자유게시판 게시물 리스트
	 */	
	public ReportListVO getFreeBoardReportList();
	
	/**
	 * 
	 * @return 신고당한 질답게시판 게시물 리스트
	 */	
	public ReportListVO getQnaBoardReportList();
	
	/**
	 * 
	 * @return 신고당한 자유게시판 댓글 리스트
	 */	
	public ReportListVO getFreeBoardCommentReportList();

	/**
	 * 
	 * @return 신고당한 질답게시판 댓글 리스트
	 */
	public ReportListVO getQnaBoardCommentReportList();

	/**
	 * 
	 * @param reportId 신고물 id
	 * @return 신고물 처리완료상태 변경 성공 여부
	 */
	public boolean doCompleteProgressYn(String reportId);
	
	public boolean createReport(ReportVO reportVO);

	public void reportUser(String reporterUserId, String reportedUserId);
}
