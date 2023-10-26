package com.ktdsuniversity.edu.algorithmanswer.dao;

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

}
