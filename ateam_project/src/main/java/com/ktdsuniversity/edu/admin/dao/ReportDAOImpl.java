package com.ktdsuniversity.edu.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.admin.vo.ReportVO;
import com.ktdsuniversity.edu.admin.web.UserReportController;

@Repository
public class ReportDAOImpl extends SqlSessionDaoSupport implements ReportDAO {
	
	private Logger log = LoggerFactory.getLogger(UserReportController.class);

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
	
	// 게시글 신고
	@Override
	public int createReport(ReportVO reportVO) {
		log.debug("--3--디에이오--------------------------------------");
		return getSqlSession().insert("createReport", reportVO);
	}

	@Override
	public int memberReportAllCount() {
		return getSqlSession().selectOne("memberReportAllCount");
	}

	@Override
	public int freeBoardReportAllCount() {
		return getSqlSession().selectOne("freeBoardReportAllCount");
	}

	@Override
	public int qnaBoardReportAllCount() {
		return getSqlSession().selectOne("qnaBoardReportAllCount");
	}

}
