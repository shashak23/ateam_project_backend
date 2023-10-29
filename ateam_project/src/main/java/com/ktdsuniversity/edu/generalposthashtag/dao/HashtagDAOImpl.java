package com.ktdsuniversity.edu.generalposthashtag.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.generalpost.web.FreePostController;
import com.ktdsuniversity.edu.generalposthashtag.vo.HashtagVO;

@Repository
public class HashtagDAOImpl extends SqlSessionDaoSupport
							implements HashtagDAO{
	private Logger log = LoggerFactory.getLogger(FreePostController.class);

	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}

	@Override
	public int createHashtag(HashtagVO hashtagVO) {
		log.debug("--3----DAO 도착---------------------------------------");
		return getSqlSession().insert("createHashtag", hashtagVO);
	}

}
