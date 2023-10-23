package com.ktdsuniversity.edu.report.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.report.vo.ReportVO;

@Repository
public class ReportDAOImpl extends SqlSessionDaoSupport implements ReportDAO {

	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}

	@Override
	public int reportAllCount() {
		return getSqlSession().selectOne("reportAllCount");
	}
	
	@Override
	public List<ReportVO> reportAllList() {
		return getSqlSession().selectList("reportAllList");
	}
	
	@Override
	public ReportVO singleReport(String reportId) {
		return getSqlSession().selectOne("singleReport", reportId);
	}

	@Override
	public List<ReportVO> memberReportList() {
		return getSqlSession().selectList("memberReportList");
	}

	@Override
	public List<ReportVO> freeBoardReportList() {
		return getSqlSession().selectList("freeBoardReportList");
	}

	@Override
	public List<ReportVO> qnaBoardReportList() {
		return getSqlSession().selectList("qnaBoardReportList");
	}

	@Override
	public List<ReportVO> freeBoardCommentReportList() {
		return getSqlSession().selectList("freeBoardCommentReportList");
	}
	
	@Override
	public List<ReportVO> qnaBoardCommentReportList() {
		return getSqlSession().selectList("qnaBoardCommentReportList");
	}

	@Override
	public int completeProgressYn(String reportId) {
		return getSqlSession().update("completeReportYn");
	}

}
