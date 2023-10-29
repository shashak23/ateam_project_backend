package com.ktdsuniversity.edu.generalposthashtag.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.generalposthashtag.vo.HashtagVO;

@Repository
public class HashtagDAOImpl extends SqlSessionDaoSupport
							implements HashtagDAO{

	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
	@Override
	public int createHashtag(HashtagVO hashtagVO) {
		return getSqlSession().insert("createHashtag", hashtagVO);
	}

}
