package com.ktdsuniversity.edu.companynews.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.companynews.vo.CompanyNewsVO;

@Repository
public class CompanyNewsDAOImpl extends SqlSessionDaoSupport implements CompanyNewsDAO {

	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}

	@Override
	public int getCompanyNewsAllCount() {
		return getSqlSession().selectOne("getCompanyNewsAllCount");
	}

	@Override
	public List<CompanyNewsVO> getAllCompanyNews() {
		return getSqlSession().selectList("getAllCompanyNews");
	}

	@Override
	public int createNewCompanyNews(CompanyNewsVO companyNewsVO) {
		return getSqlSession().insert("createNewCompanyNews", companyNewsVO);
	}

	@Override
	public int increaseViewCount(String companyNewsPostId) {
		return getSqlSession().update("com.ktdsuniversity.edu.companynews.dao.CompanyNewsDAO.increaseViewCount", companyNewsPostId);
	}

	@Override
	public CompanyNewsVO getOneCompanyNews(String companyNewsPostId) {
		return getSqlSession().selectOne("getOneCompanyNews", companyNewsPostId);
	}

	@Override
	public int updateOneCompanyNews(CompanyNewsVO companyNewsVO) {
		return getSqlSession().update("updateOneCompanyNews", companyNewsVO);
	}

	@Override
	public int deleteOneCompanyNews(CompanyNewsVO companyNewsVO) {
		return getSqlSession().update("deleteOneCompanyNews", companyNewsVO);
	}
	
	

}
