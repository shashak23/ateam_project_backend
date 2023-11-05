/**
 * 작성자: 장보늬
 * 작성일자: 2023-11-01
 */
package com.ktdsuniversity.edu.follow.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.follow.vo.FollowVO;
import com.ktdsuniversity.edu.follow.vo.SearchFollowVO;

@Repository
public class FollowDAOImpl extends SqlSessionDaoSupport implements FollowDAO {

	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}

	@Override
	public List<FollowVO> getAllFollower(String email) {
		return getSqlSession().selectList("getAllFollower", email);
	}
	
	@Override
	public List<FollowVO> getAllFollowee(String email) {
		return getSqlSession().selectList("getAllFollowee", email);
	}
	
	@Override
	public FollowVO getFollowStatus(SearchFollowVO searchFollowVO) {
		return getSqlSession().selectOne("getFollowStatus", searchFollowVO);
	}
	
	@Override
	public int doFollow(FollowVO followVO) {
		return getSqlSession().insert("doFollow", followVO);
	}

	@Override
	public int unFollow(SearchFollowVO searchFollowVO) {
		return getSqlSession().update("unFollow", searchFollowVO);
	}

	@Override
	public int toggleFollower(String followId) {
		return getSqlSession().update("toggleFollower", followId);
	}

	@Override
	public List<FollowVO> getMutualMembers(String email) {
		return getSqlSession().selectList("getMutualMembers", email);
	}
	
	
	
}
