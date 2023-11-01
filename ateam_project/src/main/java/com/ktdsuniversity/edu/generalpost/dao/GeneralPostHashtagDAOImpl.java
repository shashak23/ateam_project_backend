package com.ktdsuniversity.edu.generalpost.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.generalposthashtag.vo.HashtagVO;

@Repository
public class GeneralPostHashtagDAOImpl extends SqlSessionDaoSupport implements GeneralPostHashtagDAO {

	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
	
	@Override
	public int createPostHashtag(HashtagVO hashtagVO) {
		return getSqlSession().insert("createPostHashtag", hashtagVO);
	}

}
