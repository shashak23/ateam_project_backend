/**
 * 작성자: 김태현
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

@Repository
public class MyAlgorithmDAOImpl extends SqlSessionDaoSupport implements MyAlgorithmDAO {
	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
	
	@Override
	public int getAllNumber(String email) {
		return getSqlSession().selectOne("getAllNumber", email);
	}

	@Override
	public List<MyAlgorithmVO> getAllMyAlgorithmList(String email) {
		return getSqlSession().selectList("getAllMyAlgorithmList", email);
	}
	
	@Override
	public int createNewMyAlgorithm(MyAlgorithmVO myAlgorithmVO) {
		return getSqlSession().insert("createNewMyAlgorithm", myAlgorithmVO);
	}
	
}
