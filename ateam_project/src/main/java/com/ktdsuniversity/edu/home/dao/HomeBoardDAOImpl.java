/**
 * 작성자: 김태현
 * 작성일: 2023-10-23
 * 내용: 홈 화면에서 쓸 쿼리를 만듭니다.
 */
package com.ktdsuniversity.edu.home.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;

@Repository
public class HomeBoardDAOImpl extends SqlSessionDaoSupport implements HomeBoardDAO {
	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
	
	public List<GeneralPostVO> getWeeklyRanking(String date) {
		return getSqlSession().selectList("getWeeklyRanking", date);
	}

}
