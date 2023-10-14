package com.ktdsuniversity.edu.generalpost.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.generalpost.vo.GeneralCommentVO;

@Repository
public class GeneralCommentDAOImpl extends SqlSessionDaoSupport implements GeneralCommentDAO{

	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
	
	@Override
	public List<GeneralCommentVO> getAllComments(String generalPostId){
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
	public int modifyOneComment(GeneralCommentVO generalCommentVO) {
		return getSqlSession().update("modifyOneComment", generalCommentVO);
	}
	
	@Override
	public int recommendOneComment(String generalCommentId) {
		return getSqlSession().update("recommendOneComment", generalCommentId);
	}
	
	@Override
	public int reportOneComment(String generalCommentId) {
		return getSqlSession().insert("reportOneComment", generalCommentId);
	}

}
