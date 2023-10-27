package com.ktdsuniversity.edu.algorithmanswer.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.algorithmanswer.vo.AlgorithmAnswerVO;

@Repository
public class AlgorithmAnswerDAOImpl extends SqlSessionDaoSupport implements AlgorithmAnswerDAO {

	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
	
	@Override
	public int createAlgorithmAnswer(AlgorithmAnswerVO algorithmAnswerVO) {
		return getSqlSession().insert("createAlgorithmAnswer", algorithmAnswerVO);
	}

	@Override
	public List<AlgorithmAnswerVO> getAlgorithmAnswer(String companyAlgorithmQuestionId) {
		return getSqlSession().selectList("getAlgorithmAnswer", companyAlgorithmQuestionId);
	}

	@Override
	public List<Integer> getResult(String companyAlgorithmQuestionId) {
		return getSqlSession().selectList("getResult", companyAlgorithmQuestionId);
	}

	
}
