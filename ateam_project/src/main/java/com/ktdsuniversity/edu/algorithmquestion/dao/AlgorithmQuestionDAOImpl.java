package com.ktdsuniversity.edu.algorithmquestion.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionVO;

@Repository
public class AlgorithmQuestionDAOImpl extends SqlSessionDaoSupport implements AlgorithmQuestionDAO {

	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
	
	@Override
	public int getAlgorithmQuestionAllCount() {
		return getSqlSession().selectOne("getAlgorithmQuestionAllCount");
	}

	@Override
	public List<AlgorithmQuestionVO> getAllAlgorithmQuestion() {
		return getSqlSession().selectList("getAllAlgorithmQuestion");
	}

}
