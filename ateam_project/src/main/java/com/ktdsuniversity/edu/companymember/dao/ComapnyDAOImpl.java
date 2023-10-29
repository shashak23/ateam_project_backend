package com.ktdsuniversity.edu.companymember.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.companymember.vo.CompanyVO;

@Repository
public class ComapnyDAOImpl extends SqlSessionDaoSupport implements CompanyDAO {

	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
	
	@Override
	public int getCompanyEmailCount(String companyEmail) {
		return getSqlSession().selectOne("getCompanyEmailCount", companyEmail);
	}

	@Override
	public int createNewCompanyMember(CompanyVO companyVO) {
		return getSqlSession().insert("createNewCompanyMember", companyVO);
	}

	@Override
	public int companyMemberAllCount() {
		return getSqlSession().selectOne("companyMemberAllCount");
	}

	@Override
	public List<CompanyVO> CompanyMemberAllList() {
		return getSqlSession().selectList("CompanyMemberAllList");
	}

	@Override
	public int CompleteCompanyMemberRegistrationYn(String companyEmail) {
		return getSqlSession().insert("CompleteCompanyMemberRegistrationYn", companyEmail);
	}

}
