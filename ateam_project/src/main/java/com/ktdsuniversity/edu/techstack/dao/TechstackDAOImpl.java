/**
 * 작성자 : 김광원
 * 작성일자 : 2023-10-18
 * 내용 : 기술스택 생성 수정 삭제를 위한 DAOImpl
 */
package com.ktdsuniversity.edu.techstack.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.techstack.vo.TechstackVO;
@Repository
public class TechstackDAOImpl extends SqlSessionDaoSupport implements TechstackDAO{
	@Autowired
	
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
	
	/**
	 * 기술스택 생성 
	 */
	@Override
	public int createNewTechstack(TechstackVO techstackVO) {
		return getSqlSession().insert("createNewTechstack",techstackVO);
	}
	/**
	 * 기술스택 조회
	 */
	@Override
	public List<TechstackVO> getAllTechstack(String email) {
		return getSqlSession().selectList("getAllTechstack",email);
	}

	@Override
	public TechstackVO getOneTechstack(String email) {
		return getSqlSession().selectOne("getOneTechstack", email);
	}

	@Override
	public int deleteTechstack(String email) {
		return getSqlSession().delete("deleteTechstack",email);
	}

	@Override
	public int insertTechstack(TechstackVO techstackVO) {
		return getSqlSession().insert("insertTechstack",techstackVO );
	}
	
	@Override
	public List<TechstackVO> techSearch(String id) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("techSearch",id);
	}

	@Override
	public int deleteTech(String id) {
		return getSqlSession().delete("deleteTech",id);
	}

}
