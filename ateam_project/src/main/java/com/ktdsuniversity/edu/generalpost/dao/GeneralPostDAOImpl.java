/**
 * 작성자: 김시하
 * 수정자: 김시하(2023-11-01)
 * 작성일자: 2013-10-16
 * 내용: 질답게시글을 위한 DAO Impl입니다
 */
package com.ktdsuniversity.edu.generalpost.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.common.vo.AbstractSearchVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.generalpost.vo.SearchForumVO;

@Repository
public class GeneralPostDAOImpl extends SqlSessionDaoSupport
								implements GeneralPostDAO{

	
	private Logger log = LoggerFactory.getLogger(GeneralPostDAOImpl.class);

	
	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
		
	@Override
	public int increaseViewCount(String generalPostId) {
		return getSqlSession().update("com.ktdsuniversity.edu.generalpost.dao.GeneralPostDAO.increaseViewCount", generalPostId);
	}
	
	@Override
	public int getBoardAllCount(SearchForumVO searchForumVO) {
		return getSqlSession().selectOne("com.ktdsuniversity.edu.generalpost.dao.GeneralPostDAO.getBoardAllCount", searchForumVO);
	}
	// 자유게시판
	@Override
	public List<GeneralPostVO> getAllBoard(SearchForumVO searchForumVO) {
		return getSqlSession().selectList("com.ktdsuniversity.edu.generalpost.dao.GeneralPostDAO.getAllBoard", searchForumVO);
//		return getSqlSession().selectList("getAllFreeBoard");
	}

	@Override
	public int createNewBoard(GeneralPostVO generalPostVO) {
		return getSqlSession().insert("com.ktdsuniversity.edu.generalpost.dao.GeneralPostDAO.createNewBoard", generalPostVO);
//		return getSqlSession().insert("createNewFreeBoard", generalPostVO);
	}

	@Override
	public GeneralPostVO getOneBoard(String generalPostId) {
		return getSqlSession().selectOne("com.ktdsuniversity.edu.generalpost.dao.GeneralPostDAO.getOneBoard", generalPostId);
//		return getSqlSession().selectOne("getOneFreeBoard", generalPostId);
	}

	@Override
	public int updateOneBoard(GeneralPostVO generalPostVO) {
		return getSqlSession().update("com.ktdsuniversity.edu.generalpost.dao.GeneralPostDAO.updateOneBoard", generalPostVO);
//		return getSqlSession().update("updateOneFreeBoard", generalPostVO);
	}
	
	@Override
	public int deleteOneBoard (String generalPostId) {
		return getSqlSession().delete("com.ktdsuniversity.edu.generalpost.dao.GeneralPostDAO.deleteOneBoard", generalPostId);
//		return getSqlSession().delete("deleteOneFreeBoard", generalPostId);
	}
	
	@Override
	public int updateLikePost(GeneralPostVO generalPostVO) {
		return getSqlSession().update("com.ktdsuniversity.edu.generalpost.dao.GeneralPostDAO.updateLikePost", generalPostVO);
//		return getSqlSession().update("updateLikeFreePost", generalPostVO);
	}
	
	@Override
	public List<GeneralPostVO> getAllBoardRest(String boardId) {
		return getSqlSession().selectList("getAllBoardRest", boardId);
//		return getSqlSession().selectList("getAllFreeBoardRest");
	}
	
//	// 질답게시판
//	@Override
//	public List<GeneralPostVO> getAllQnABoard() {
//		return getSqlSession().selectList("getAllQnABoard");
//	}
//
//	@Override
//	public int createNewQnABoard(GeneralPostVO generalPostVO) {
//		log.debug("--3--------------디에이오-------------------------");
//		return getSqlSession().insert("createNewQnABoard", generalPostVO);
//	}
//
//	@Override
//	public GeneralPostVO getOneQnABoard(String generalPostId) {
//		return getSqlSession().selectOne("getOneQnABoard", generalPostId);
//	}
//
//	@Override
//	public int updateOneQnABoard(GeneralPostVO generalPostVO) {
//		return getSqlSession().update("updateOneQnABoard", generalPostVO);
//	}
//
//	@Override
//	public int deleteOneQnABoard(String generalPostId) {
//		return getSqlSession().delete("deleteOneQnABoard", generalPostId);
//	}
//	
//	@Override
//	public int updateLikeQnAPost(GeneralPostVO generalPostVO) {
//		return getSqlSession().update("updateLikeQnAPost", generalPostVO);
//	}
//	
//	@Override
//	public List<GeneralPostVO> getAllQnaBoardRest() {
//		return getSqlSession().selectList("getAllQnaBoardRest");
//	}

	// 내 게시글 조회
	@Override
	public List<GeneralPostVO> getMyPost(GeneralPostVO generalPostVO) {
		return getSqlSession().selectList("getMyPost", generalPostVO);
	}
	
	// 통합검색
	@Override
	public List<GeneralPostVO> searchAllBoardByKeyword(AbstractSearchVO abstractSearchVO) {
		return getSqlSession().selectList("searchAllBoardByKeyword", abstractSearchVO);
	}

	// 조회수순 랭킹
	@Override
	public List<GeneralPostVO> getViewRanking(String date) {
		return getSqlSession().selectList("getViewRanking", date);
	}

	// 좋아요순 랭킹
	@Override
	public List<GeneralPostVO> getLikeRanking(String date) {
		return getSqlSession().selectList("getLikeRanking", date);
	}
	
	@Override
	public List<GeneralPostVO> SearchFreeBoardRest(SearchForumVO searchForumVO) {
		return getSqlSession().selectList("SearchFreeBoardRest", searchForumVO);
	}
	
	@Override
	public List<GeneralPostVO> SearchQnaBoardRest(SearchForumVO searchForumVO) {
		return getSqlSession().selectList("SearchQnaBoardRest", searchForumVO);
	}

//	// 자유검색
//	@Override
//	public List<GeneralPostVO> searchAllFreePost(SearchForumVO searchForumVO) {
//		return getSqlSession().selectList("searchAllFreePost", searchForumVO);
//	}
//	// 질답검색
//	@Override
//	public List<GeneralPostVO> searchAllQnAPost(SearchForumVO searchForumVO) {
//		return getSqlSession().selectList("searchAllQnAPost", searchForumVO);
//	}

	@Override
	public List<GeneralPostVO> searchAllPost(SearchForumVO searchForumVO) {
		return getSqlSession().selectList("searchAllPost", searchForumVO);
	}

	@Override
	public int createNewFreeBoard(GeneralPostVO generalPostVO) {
		return getSqlSession().insert("createNewFreeBoard", generalPostVO);
	}
}
