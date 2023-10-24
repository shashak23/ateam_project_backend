/**
 * 작성자: 김시하
 * 작성일자: 2023-10-23
 * 내용: 기업 채용을 위한 DAOImpl
 */
package com.ktdsuniversity.edu.companyrecruit.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.companyrecruit.vo.CompanyRecruitVO;

@Repository
public class CompanyRecruitDAOImpl extends SqlSessionDaoSupport
									implements CompanyRecruitDAO{

	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
	
	@Override
	public int getBoardAllCount() {
		return getSqlSession().selectOne("getBoardAllCount");
	}

	@Override
	public List<CompanyRecruitVO> getAllBoard() {
		return getSqlSession().selectList("getAllBoard");
	}

}
