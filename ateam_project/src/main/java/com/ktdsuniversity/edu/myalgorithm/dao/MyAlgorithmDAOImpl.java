package com.ktdsuniversity.edu.myalgorithm.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.myalgorithm.vo.MyAlgorithmVO;

@Repository
public class MyAlgorithmDAOImpl extends SqlSessionDaoSupport implements MyAlgorithmDAO {
	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
	
	@Override
	public int getAllNumber() {
		return getSqlSession().selectOne("getAllNumber");
	}

	@Override
	public List<MyAlgorithmVO> getAllMyAlgorithmList() {
		return getSqlSession().selectList("getAllMyAlgorithmList");
	}
}
