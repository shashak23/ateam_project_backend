/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 내용: 기업소식 게시판의 CRUD 쿼리를 수행합니다.
 */

package com.ktdsuniversity.edu.companynews.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.common.vo.AbstractSearchVO;
import com.ktdsuniversity.edu.companynews.vo.CompanyNewsVO;
import com.ktdsuniversity.edu.companynews.vo.SearchCompanyNewsVO;

@Repository
public class CompanyNewsDAOImpl extends SqlSessionDaoSupport implements CompanyNewsDAO {

	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}

	@Override
	public int getCompanyNewsAllCount(SearchCompanyNewsVO searchCompanyNewsVO) {
		return getSqlSession().selectOne("getCompanyNewsAllCount", searchCompanyNewsVO);
	}

	@Override
	public List<CompanyNewsVO> getAllCompanyNews() {
		return getSqlSession().selectList("getAllCompanyNews");
	}

	@Override
	public List<CompanyNewsVO> searchAllCompanyNews(SearchCompanyNewsVO searchCompanyNewsVO) {
		return getSqlSession().selectList("searchAllCompanyNews", searchCompanyNewsVO);
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
	public int deleteOneCompanyNews(String companyNewsPostId) {
		return getSqlSession().update("deleteOneCompanyNews", companyNewsPostId);
	}
	
	@Override
	public List<CompanyNewsVO> searchAllCompanyNewsByKeyword(AbstractSearchVO abstractSearchVO) {
		return getSqlSession().selectList("searchAllCompanyNewsByKeyword", abstractSearchVO);
	}


}
