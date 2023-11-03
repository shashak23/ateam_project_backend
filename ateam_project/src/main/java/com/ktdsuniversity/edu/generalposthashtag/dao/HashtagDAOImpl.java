package com.ktdsuniversity.edu.generalposthashtag.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.generalpost.web.FreePostController;
import com.ktdsuniversity.edu.generalposthashtag.vo.HashtagListVO;
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
	public List<HashtagVO> getAllHashtag() {
		return getSqlSession().selectList("getAllHashtag");
	}

	@Override
	public List<HashtagVO> getHashtagList(String postId) {
		return getSqlSession().selectList("getHastagList");
	}

	@Override
	public int getHashtagCnt() {
		return getSqlSession().selectOne("getHashtagCnt");
	}


}
