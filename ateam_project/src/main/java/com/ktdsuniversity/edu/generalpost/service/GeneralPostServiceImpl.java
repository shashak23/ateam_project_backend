/**
<<<<<<< HEAD
 * 작성자: 김시하
 * 수정자: 김시하(2023-11-01)
 * 작성일자: 2023-10-16
 * 내용: 질답 게시판을 위한 ServieImpl입니다
=======
 * 수정자: 장보늬(2023-10-22)
 * 수정자: 김태현(2023-11-01)
>>>>>>> 태현
 * **/
package com.ktdsuniversity.edu.generalpost.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktdsuniversity.edu.common.vo.AbstractSearchVO;
import com.ktdsuniversity.edu.generalpost.dao.GeneralPostDAO;
import com.ktdsuniversity.edu.generalpost.dao.GeneralPostHashtagDAO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostListVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.generalpost.vo.SearchForumVO;
import com.ktdsuniversity.edu.generalpost.web.FreePostController;
import com.ktdsuniversity.edu.generalposthashtag.vo.HashtagVO;

@Service
public class GeneralPostServiceImpl implements GeneralPostService{


private Logger log = LoggerFactory.getLogger(FreePostController.class);
	
	@Autowired
	private GeneralPostDAO generalPostDAO;
	
	@Autowired
	private GeneralPostHashtagDAO generalPostHashtagDAO;
	
	
	@Override
	public GeneralPostListVO getAllBoard(SearchForumVO searchForumVO) {
		GeneralPostListVO generalPostListVO = new GeneralPostListVO();
		
		generalPostListVO.setBoardCnt( generalPostDAO.getBoardAllCount(searchForumVO));
		if(searchForumVO == null) {
			generalPostListVO.setGeneralPostList( generalPostDAO.getAllBoard(searchForumVO.getBoardId()));
		} else {
			generalPostListVO.setGeneralPostList( generalPostDAO.searchAllPost(searchForumVO));
		}
		return generalPostListVO;
	}

	@Transactional
	@Override
	public boolean createNewBoard(GeneralPostVO generalPostVO) {
		log.debug("2-----서비스---------------------------");		
		int boardCount = generalPostDAO.createNewBoard(generalPostVO);
		List<HashtagVO> hashtagList = generalPostVO.getHashtagListVO();
		for (HashtagVO hashtagVO : hashtagList) {
			hashtagVO.setGeneralPostId(generalPostVO.getGeneralPostId());
			boardCount += generalPostHashtagDAO.createPostHashtag(hashtagVO);
		}
		return boardCount > 0;
	}

	@Transactional
	@Override
	public GeneralPostVO getOneBoard(String generalPostId) {
		int updateCount = generalPostDAO.increaseViewCount(generalPostId);
		if (updateCount == 0) {
			throw new IllegalArgumentException();
		}else {
			return generalPostDAO.getOneBoard(generalPostId);
		}
	}

	@Transactional
	@Override
	public boolean updateOneBoard(GeneralPostVO generalPostVO) {
		int updateCount = generalPostDAO.updateOneBoard(generalPostVO);
		return updateCount > 0;
	}

	@Transactional
	@Override
	public boolean deleteOneBoard(String generalPostId) {
		int deleteCount = generalPostDAO.deleteOneBoard(generalPostId);
		return deleteCount > 0;
	}

	@Transactional
	@Override
	public boolean likeBoard(GeneralPostVO generalPostVO) {
		int likeCount = generalPostDAO.updateLikePost(generalPostVO);
		return likeCount > 0;
	}

	@Override
	public List<GeneralPostVO> getAllBoardRest(String boardId) {
		return generalPostDAO.getAllBoardRest(boardId);
	}
	
	
//	// 자유게시판
//	@Transactional
//	@Override
//	public GeneralPostListVO getAllFreeBoard(SearchForumVO searchForumVO) {
//
//		GeneralPostListVO generalPostListVO = new GeneralPostListVO();
//		
//		generalPostListVO.setBoardCnt( generalPostDAO.getBoardAllCount(searchForumVO));
//		if(searchForumVO == null) {
//			generalPostListVO.setGeneralPostList( generalPostDAO.getAllFreeBoard());
//		} else {
//			generalPostListVO.setGeneralPostList( generalPostDAO.searchAllFreePost(searchForumVO));
//		}
//		return generalPostListVO;
//	}
//
//	@Transactional
//	@Override
//	public boolean createNewFreeBoard(GeneralPostVO generalPostVO) {
//		log.debug("2-----서비스---------------------------");		
//		int boardCount = generalPostDAO.createNewFreeBoard(generalPostVO);
//		
//		return boardCount > 0;
//	}
//
//	//@Transactional
//	@Override
//	public GeneralPostVO getOneFreeBoard(String generalPostId) {
//		int updateCount = generalPostDAO.increaseViewCount(generalPostId);
//		if (updateCount == 0) {
//			throw new IllegalArgumentException();
//		}else {
//			return generalPostDAO.getOneFreeBoard(generalPostId);
//		}
//	}
//	
//	@Transactional
//	@Override
//	public boolean updateOneFreeBoard(GeneralPostVO generalPostVO) {
//		int updateCount = generalPostDAO.updateOneFreeBoard(generalPostVO);
//		return updateCount > 0;
//	}
//
//	@Transactional
//	@Override
//	public boolean deleteOneFreeBoard(String generalPostId) {
//		int deleteCount = generalPostDAO.deleteOneFreeBoard(generalPostId);
//		
//		return deleteCount > 0;
//	}
//	@Transactional
//	@Override
//	public boolean likeFreeBoard(GeneralPostVO generalPostVO) {
//		int likeCount = generalPostDAO.updateLikeFreePost(generalPostVO);
//		return likeCount > 0;
//	}
//	
//	@Override
//	public List<GeneralPostVO> getAllFreeBoardRest() {
//		return generalPostDAO.getAllFreeBoardRest();
//	}
//	
//	// 질답게시판 
//	@Transactional
//	@Override
//	public GeneralPostListVO getAllQnABoard(SearchForumVO searchForumVO) {
//		log.debug("--2----서비스 도착---------------------------");
//		GeneralPostListVO generalPostListVO = new GeneralPostListVO();
//		
//		generalPostListVO.setBoardCnt( generalPostDAO.getBoardAllCount(searchForumVO));
//		if(searchForumVO == null) {
//			generalPostListVO.setGeneralPostList( generalPostDAO.getAllQnABoard());
//			
//		} else {
//			generalPostListVO.setGeneralPostList( generalPostDAO.searchAllQnAPost(searchForumVO));
//		}
//		return generalPostListVO;	
//	}
//	
//	@Transactional
//	@Override
//	public boolean createNewQnABoard(GeneralPostVO generalPostVO) {
//		int boardCount = generalPostDAO.createNewQnABoard(generalPostVO);
//		List<HashtagVO> hashtagList = generalPostVO.getHashtagListVO();
//		for (HashtagVO hashtagVO : hashtagList) {
//			hashtagVO.setGeneralPostId(generalPostVO.getGeneralPostId());
//			boardCount += generalPostHashtagDAO.createPostHashtag(hashtagVO);
//		}
//		return boardCount > 0;
//	}
//
//	@Transactional
//	@Override
//	public GeneralPostVO getOneQnABoard(String generalPostId) {
//
//		int boardCount = generalPostDAO.increaseViewCount(generalPostId);
//		if (boardCount == 0) {
//			throw new IllegalArgumentException();
//		}else {
//			return generalPostDAO.getOneQnABoard(generalPostId);
//		}
//	
//	}
//	
//	@Transactional
//	@Override
//	public boolean updateOneQnABoard(GeneralPostVO generalPostVO) {
//		int updateCount = generalPostDAO.updateOneQnABoard(generalPostVO);
//		return updateCount > 0;
//	}
//
//	@Transactional
//	@Override
//	public boolean deleteOneQnABoard(String generalPostId) {
//		int deleteCount = generalPostDAO.deleteOneQnABoard(generalPostId);
//		
//		return deleteCount > 0;
//	}
//
//	@Transactional
//	@Override
//	public boolean likeQnABoard(GeneralPostVO generalPostVO) {
//		int likeCount = generalPostDAO.updateLikeQnAPost(generalPostVO);
//		return likeCount > 0;
//	}
//	
//	@Override
//	public List<GeneralPostVO> getAllQnaBoardRest() {
//		return generalPostDAO.getAllQnaBoardRest();
//	}
	
	
	// 내게시글 조회
	@Override
	public GeneralPostListVO getMyPost(GeneralPostVO generalPostVO) {
		GeneralPostListVO generalPostListVO = new GeneralPostListVO();
		generalPostListVO.setGeneralPostList(generalPostDAO.getMyPost(generalPostVO));
		return generalPostListVO;
	}
	
	// 통합검색
	@Override
	public GeneralPostListVO searchAllBoardByKeyword(AbstractSearchVO abstractSearchVO) {
		if (abstractSearchVO == null || abstractSearchVO.getSearchKeyword() == null || abstractSearchVO.getSearchKeyword().length() == 0) {
			return new GeneralPostListVO();
		}
		GeneralPostListVO generalPostListVO = new GeneralPostListVO();
		generalPostListVO.setGeneralPostList(generalPostDAO.searchAllBoardByKeyword(abstractSearchVO));
		return generalPostListVO;
	}
	
	// 조회수순 랭킹
	@Override
	public List<GeneralPostVO> getViewRanking(String date) {
		return generalPostDAO.getViewRanking(date);
	}
	
	// 좋아요순 랭킹
	@Override
	public List<GeneralPostVO> getLikeRanking(String date) {
		return generalPostDAO.getLikeRanking(date);
	}
	
	
	// 자유게시판 검색용(미사용)
	@Override
	public List<GeneralPostVO> SearchFreeBoardRest(SearchForumVO searchForumVO) {
		return generalPostDAO.SearchFreeBoardRest(searchForumVO);
	}
	// 질답게시판 검색용(미사용)
	@Override
	public List<GeneralPostVO> SearchQnaBoardRest(SearchForumVO searchForumVO) {
		return generalPostDAO.SearchQnaBoardRest(searchForumVO);
	}

	
}
