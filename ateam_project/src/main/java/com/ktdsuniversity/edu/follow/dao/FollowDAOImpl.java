package com.ktdsuniversity.edu.follow.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.follow.vo.FollowVO;

@Repository
public class FollowDAOImpl extends SqlSessionDaoSupport implements FollowDAO {

	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}

	@Override
	public int follow(FollowVO followVO) {
		return getSqlSession().insert("follow", followVO);
	}

	@Override
	public int unFollow(FollowVO followVO) {
		return getSqlSession().delete("unFollow", followVO);
	}

	
	
	@Override
	public List<FollowVO> getAllFollower(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FollowVO> getAllFollowee(String email) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
