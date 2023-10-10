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
		return 0;
	}

	@Override
	public List<CompanyNewsVO> getAllCompanyNews() {
		return null;
	}

	@Override
	public int createNewCompanyNews(CompanyNewsVO companyNewsVO) {
		return getSqlSession().insert("createNewCompanyNews", companyNewsVO);
	}

	@Override
	public int increaseViewCount(String companyNewsPostId) {
		return getSqlSession().update("increaseViewCount", companyNewsPostId);
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
