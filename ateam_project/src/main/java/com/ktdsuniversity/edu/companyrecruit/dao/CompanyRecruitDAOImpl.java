/**
 * 작성자: 김시하
 * 작성일자: 2023-10-23
 * 내용: 기업 채용을 위한 DAOImpl
 */
package com.ktdsuniversity.edu.companyrecruit.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.companyrecruit.vo.CompanyRecruitVO;
import com.ktdsuniversity.edu.generalpost.web.FreePostController;

@Repository
public class CompanyRecruitDAOImpl extends SqlSessionDaoSupport
									implements CompanyRecruitDAO{
	private Logger log = LoggerFactory.getLogger(FreePostController.class);

	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
	
	@Override
	public int getBoardCount() {
		return getSqlSession().selectOne("getBoardCount");
	}

	@Override
	public List<CompanyRecruitVO> getAllBoard() {
		return getSqlSession().selectList("getAllBoard");
	}

	@Override
	public int createNewBoard(CompanyRecruitVO companyRecruitVO) {
		return getSqlSession().insert("createNewBoard", companyRecruitVO);
	}

	@Override
	public CompanyRecruitVO getOneRecruitBoard(String companyRecruitPostId) {
		return getSqlSession().selectOne("getOneRecruitBoard", companyRecruitPostId);
	}

	@Override
	public int updateOneRecruitBoard(CompanyRecruitVO companyRecruitVO) {
		log.debug("--3--디에이오 도착------------------------------");
		return getSqlSession().update("updateOneRecruitBoard", companyRecruitVO);
	}

}
