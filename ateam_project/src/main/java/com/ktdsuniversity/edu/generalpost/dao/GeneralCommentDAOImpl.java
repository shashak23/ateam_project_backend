/**
 * 작성자: 남현욱
 * 작성일자: 2023-10-16
 * 내용: 질문 답변 게시판 댓글을 위한 DAOImpl입니다.
 */
package com.ktdsuniversity.edu.generalpost.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.AteamProjectApplication;
import com.ktdsuniversity.edu.generalpost.vo.GeneralCommentVO;

@Repository
public class GeneralCommentDAOImpl extends SqlSessionDaoSupport implements GeneralCommentDAO{

	private Logger log = LoggerFactory.getLogger(AteamProjectApplication.class);

	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
	
	@Override
	public List<GeneralCommentVO> getAllComments(String generalPostId){
		  log.debug("--2----디에이오----------------------------");

		return getSqlSession().selectList("getAllComments", generalPostId);
	}
	
	@Override
	public GeneralCommentVO getOneComment(String generalCommentId) {
		return getSqlSession().selectOne("getOneComment",generalCommentId);
	}
	
	@Override
	public int createNewComment(GeneralCommentVO generalCommentVO) {
		return getSqlSession().insert("createNewComment", generalCommentVO);
	}
	
	@Override
	public int deleteOneComment(String generalCommentId) {
		return getSqlSession().delete("deleteOneComment", generalCommentId);
	}
	
	@Override
	public int updateOneComment(GeneralCommentVO generalCommentVO) {
		return getSqlSession().update("updateOneComment", generalCommentVO);
	}
	
	@Override
	public int likeOneComment(String generalCommentId) {
		return getSqlSession().update("likeOneComment", generalCommentId);
	}
	
	@Override
	public int reportOneComment(String generalCommentId) {
		return getSqlSession().insert("reportOneComment", generalCommentId);
	}

}
