package com.ktdsuniversity.edu.companyinfo.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.companymember.vo.CompanyVO;

@Repository
public class CompanyInfoDAOImpl extends SqlSessionDaoSupport implements CompanyInfoDAO {
	
	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}

	@Override
	public int updateCompanyContactName(CompanyVO companyVO) {
		return getSqlSession().insert("updateCompanyContactName", companyVO);
	}

	@Override
	public int updateCompanyContactNumber(CompanyVO companyVO) {
		return getSqlSession().insert("updateCompanyContactNumber", companyVO);
	}

	@Override
	public int updateCompanyPassword(CompanyVO companyVO) {
		return getSqlSession().insert("updateCompanyPassword", companyVO);
	}

}
