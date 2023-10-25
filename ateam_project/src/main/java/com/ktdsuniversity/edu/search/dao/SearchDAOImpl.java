/**
 * 작성자: 장보늬
 * 생성날짜: 2023-10-25
 * 내용: 통합검색 키워드 조회를 위한 DAOImpl
 */
package com.ktdsuniversity.edu.search.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SearchDAOImpl extends SqlSessionDaoSupport implements SearchDAO {

	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
		
	@Override
	public List<String> getAllSearchKeyword() {
		return getSqlSession().selectList("getAllSearchKeyword");
	}

}
