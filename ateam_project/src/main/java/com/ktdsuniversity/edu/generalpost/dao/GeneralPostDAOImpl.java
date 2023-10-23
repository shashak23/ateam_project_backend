/**
 * 수정자: 장보늬(2023-10-22)
 */
package com.ktdsuniversity.edu.generalpost.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.generalpost.vo.SearchForumVO;
import com.ktdsuniversity.edu.generalpost.web.FreePostController;
import com.ktdsuniversity.edu.member.vo.MemberVO;

@Repository
public class GeneralPostDAOImpl extends SqlSessionDaoSupport
								implements GeneralPostDAO{

	@Autowired
	private SqlSession sqlSession;
	
	private Logger log = LoggerFactory.getLogger(FreePostController.class);

	
	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
		
	@Override
	public int increaseViewCount(String generalPostId) {
		return getSqlSession().update("increaseViewCount", generalPostId);
	}
	
	@Override
	public int getBoardAllCount() {
		return getSqlSession().selectOne("getBoardAllCount");
	}
	// 자유게시판
	@Override
	public List<GeneralPostVO> getAllFreeBoard() {
		return getSqlSession().selectList("getAllFreeBoard");
	}

	@Override
	public int createNewFreeBoard(GeneralPostVO generalPostVO) {
		log.debug("--3-----------자유디에이오-------------------------");
		return getSqlSession().insert("createNewFreeBoard", generalPostVO);
	}

	@Override
	public GeneralPostVO getOneFreeBoard(String generalPostId) {
		return getSqlSession().selectOne("getOneFreeBoard", generalPostId);
	}

	@Override
	public int updateOneFreeBoard(GeneralPostVO generalPostVO) {
		return getSqlSession().update("updateOneFreeBoard", generalPostVO);
	}
	
	@Override
	public int deleteOneFreeBoard (String generalPostId) {
		return getSqlSession().delete("deleteOneFreeBoard", generalPostId);
	}
	
	// 질답게시판
	@Override
	public List<GeneralPostVO> getAllQnABoard() {
		return getSqlSession().selectList("getAllQnABoard");
	}

	@Override
	public int createNewQnABoard(GeneralPostVO generalPostVO) {
		return getSqlSession().insert("createNewQnABoard", generalPostVO);
	}

	@Override
	public GeneralPostVO getOneQnABoard(String generalPostId) {

		return getSqlSession().selectOne("getOneQnABoard", generalPostId);
	}

	@Override
	public int updateOneQnABoard(GeneralPostVO generalPostVO) {
		return getSqlSession().update("updateOneQnABoard", generalPostVO);
	}

	@Override
	public int deleteOneQnABoard(String generalPostId) {
		return getSqlSession().delete("deleteOneQnABoard", generalPostId);
	}

	// 내 게시글 조회
	@Override
	public List<GeneralPostVO> getMyPost(String postWriter) {
		return getSqlSession().selectList("getMyPost", postWriter);
	}

	@Override
	public int updateListFreePost(GeneralPostVO generalPostVO) {
		return getSqlSession().update("updateListFreePost", generalPostVO);
	}

	@Override
	public int updateLikeQnAPost(GeneralPostVO generalPostVO) {
		return getSqlSession().update("updateLikeQnAPost", generalPostVO);
	}
}
