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
public class GeneralCommentDAOImpl extends SqlSessionDaoSupport implements GeneralCommentDAO {

    private Logger log = LoggerFactory.getLogger(AteamProjectApplication.class);

	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
    
    @Override
    public List<GeneralCommentVO> getAllComments(String generalpostid) {
        return getSqlSession().selectList("getAllComments", generalpostid);
    }

    @Override
    public GeneralCommentVO getOneComment(String generalpostid) {
        return getSqlSession().selectOne("getOneComment", generalpostid);
    }

    @Override
    public int deleteOneComment(String generalpostid) {
        return getSqlSession().delete("deleteOneComment", generalpostid);
    }

    @Override
    public int likeOneComment(String generalpostid) {
        return getSqlSession().update("likeOneComment", generalpostid);
    }

    @Override
    public int reportOneComment(String generalpostid) {
        return getSqlSession().insert("reportOneComment", generalpostid);
    }

	@Override
	public int createNewComment(String generalPostId, GeneralCommentVO generalCommentVO) {
		
		return 0;
	}

	@Override
	public int updateOneComment(GeneralCommentVO generalCommentVO) {
		
		return 0;
	}
}