/**
 * 작성자: 김태현
 * 수정자: 장보늬(2023-10-19)
 * 작성일자: 2023-10-12
 * 내용: 내가 푼 알고리즘 문제들의 쿼리를 수행하는 클래스입니다.
 */

package com.ktdsuniversity.edu.myalgorithm.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.myalgorithm.vo.MyAlgorithmVO;
import com.ktdsuniversity.edu.myalgorithm.vo.SearchMyAlgorithmVO;

@Repository
public class MyAlgorithmDAOImpl extends SqlSessionDaoSupport implements MyAlgorithmDAO {
	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
	
	@Override
	public int getAllNumber(SearchMyAlgorithmVO searchMyAlgorithmVO) {
		return getSqlSession().selectOne("getAllNumber", searchMyAlgorithmVO);
	}

	@Override
	public List<MyAlgorithmVO> getAllMyAlgorithmList(SearchMyAlgorithmVO searchMyAlgorithmVO) {
		return getSqlSession().selectList("getAllMyAlgorithmList", searchMyAlgorithmVO);
	}
	
	@Override
	public List<MyAlgorithmVO> searchAllMyAlgorithm(SearchMyAlgorithmVO searchMyAlgorithmVO) {
		return getSqlSession().selectList("searchAllMyAlgorithm", searchMyAlgorithmVO);
	}
	
	@Override
	public int createNewMyAlgorithm(MyAlgorithmVO myAlgorithmVO) {
		return getSqlSession().insert("createNewMyAlgorithm", myAlgorithmVO);
	}
	
	@Override
	public int deleteMyAlgorithm(String myAlgorithmQuestionId) {
		return getSqlSession().update("deleteMyAlgorithm", myAlgorithmQuestionId);
	}
}
