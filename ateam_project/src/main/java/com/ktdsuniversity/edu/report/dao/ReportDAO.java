package com.ktdsuniversity.edu.report.dao;

import java.util.List;

import com.ktdsuniversity.edu.report.vo.ReportVO;

public interface ReportDAO {
	
	/**
	 * DB에 저장된 모든 신고물 개수 조회
	 * @return 신고물 총 개수
	 */
	public int reportAllCount();
	
	/**
	 * DB에 저장된 모든 신고물 조회
	 * @return 총 신고 내역 목록
	 */
	public List<ReportVO> reportAllList();
	
	/**
	 * 신고 내역 단건 조회
	 * @param reportId 조회를 원하는 신고 내역 고유 id
	 * @return 신고 내역
	 */
	public ReportVO singleReport(String reportId);

	/**
	 * 회원 신고 내역 목록 조회
	 * @return 회원 신고 내역 목록
	 */
	public List<ReportVO> memberReportList();

	/**
	 * 자유게시판 신고 내역 목록 조회
	 * @return 자유게시판 신고 내역 목록
	 */
	public List<ReportVO> freeBoardReportList();

	/**
	 * 질답게시판 신고 내역 목록 조회
	 * @return 질답게시판 신고 내역 목록
	 */
	public List<ReportVO> qnaBoardReportList();

	/**
	 * 자유게시판 댓글 신고 내역 목록 조회
	 * @return 자유게시판 댓글 신고 내역 목록
	 */
	public List<ReportVO> freeBoardCommentReportList();
	
	/**
	 * 질답게시판 댓글 신고 내역 목록 조회
	 * @return 질답게시판 댓글 신고 내역 목록
	 */
	public List<ReportVO> qnaBoardCommentReportList();
	
	/**
	 * 신고 내역 처리완료 여부 선택
	 * @param reportId 처리완료 여부를 변경하는 신고 내역 고유 id
	 * @return 처리완료 여부가 업데이트된 신고 내역 개수
	 */
	public int completeProgressYn(String reportId);

	// 게시글 신고
	public int createReport(ReportVO reportVO);

}
