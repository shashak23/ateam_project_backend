/**
 * 작성자: 김시하
 * 수정자: 김시하(2023-11-01)
 * 작성일자: 2023-10-16
 * 내용: 질답 게시판을 위한 ServieImpl입니다
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
import com.ktdsuniversity.edu.generalpost.web.FreePostController;
import com.ktdsuniversity.edu.generalposthashtag.vo.HashtagVO;

@Service
public class GeneralPostServiceImpl implements GeneralPostService{


private Logger log = LoggerFactory.getLogger(FreePostController.class);
	
	@Autowired
	private GeneralPostDAO generalPostDAO;
	
	@Autowired
	private GeneralPostHashtagDAO generalPostHashtagDAO;
	
	// 자유게시판
	@Transactional
	@Override
	public GeneralPostListVO getAllFreeBoard() {

		GeneralPostListVO generalPostListVO = new GeneralPostListVO();
		
		generalPostListVO.setBoardCnt( generalPostDAO.getBoardAllCount());
		generalPostListVO.setGeneralPostList( generalPostDAO.getAllFreeBoard());
		return generalPostListVO;
	}

	@Transactional
	@Override
	public boolean createNewFreeBoard(GeneralPostVO generalPostVO) {
		log.debug("2-----서비스---------------------------");		
		int boardCount = generalPostDAO.createNewFreeBoard(generalPostVO);
		
		return boardCount > 0;
	}

	//@Transactional
	@Override
	public GeneralPostVO getOneFreeBoard(String generalPostId) {
		int updateCount = generalPostDAO.increaseViewCount(generalPostId);
		if (updateCount == 0) {
			throw new IllegalArgumentException();
		}else {
			return generalPostDAO.getOneFreeBoard(generalPostId);
		}
	}
	
	@Transactional
	@Override
	public boolean updateOneFreeBoard(GeneralPostVO generalPostVO) {
		int updateCount = generalPostDAO.updateOneFreeBoard(generalPostVO);
		return updateCount > 0;
	}

	@Transactional
	@Override
	public boolean deleteOneFreeBoard(String generalPostId) {
		int deleteCount = generalPostDAO.deleteOneFreeBoard(generalPostId);
		
		return deleteCount > 0;
	}
	@Transactional
	@Override
	public boolean likeFreeBoard(GeneralPostVO generalPostVO) {
		int likeCount = generalPostDAO.updateLikeFreePost(generalPostVO);
		return likeCount > 0;
	}
	
	// 질답게시판 
	@Transactional
	@Override
	public GeneralPostListVO getAllQnABoard() {
		GeneralPostListVO generalPostListVO = new GeneralPostListVO();
		
		generalPostListVO.setBoardCnt( generalPostDAO.getBoardAllCount());
		generalPostListVO.setGeneralPostList( generalPostDAO.getAllQnABoard());
		return generalPostListVO;	
	}
	
	@Transactional
	@Override
	public boolean createNewQnABoard(GeneralPostVO generalPostVO) {
		int boardCount = generalPostDAO.createNewQnABoard(generalPostVO);
		List<HashtagVO> hashtagList = generalPostVO.getHashtagVO();
		for (HashtagVO hashtagVO : hashtagList) {
			hashtagVO.setGeneralPostId(generalPostVO.getGeneralPostId());
			boardCount += generalPostHashtagDAO.createPostHashtag(hashtagVO);
		}
		return boardCount > 0;
	}

	@Transactional
	@Override
	public GeneralPostVO getOneQnABoard(String generalPostId) {

		int boardCount = generalPostDAO.increaseViewCount(generalPostId);
		if (boardCount == 0) {
			throw new IllegalArgumentException();
		}else {
			return generalPostDAO.getOneFreeBoard(generalPostId);
		}
	
	}
	
	@Transactional
	@Override
	public boolean updateOneQnABoard(GeneralPostVO generalPostVO) {
		int updateCount = generalPostDAO.updateOneQnABoard(generalPostVO);
		return updateCount > 0;
	}

	@Transactional
	@Override
	public boolean deleteOneQnABoard(String generalPostId) {
		int deleteCount = generalPostDAO.deleteOneQnABoard(generalPostId);
		
		return deleteCount > 0;
	}

	@Transactional
	@Override
	public boolean likeQnABoard(GeneralPostVO generalPostVO) {
		int likeCount = generalPostDAO.updateLikeQnAPost(generalPostVO);
		return likeCount > 0;
	}
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

	@Override
	public List<GeneralPostVO> getViewRanking(String date) {
		return generalPostDAO.getViewRanking(date);
	}
}
