/**
 * 작성자: 장보늬
 * 작성일자: 2023-10-26
 * 내용: 알고리즘문제 테스트 데이터 관련 DAOImpl
 */
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
