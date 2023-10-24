/**
 * 수정자: 장보늬(2023-10-22)
 * **/
package com.ktdsuniversity.edu.generalpost.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktdsuniversity.edu.generalpost.dao.GeneralPostDAO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostListVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.generalpost.vo.SearchForumVO;
import com.ktdsuniversity.edu.generalpost.web.FreePostController;

@Service
public class GeneralPostServiceImpl implements GeneralPostService{


private Logger log = LoggerFactory.getLogger(FreePostController.class);
	
	@Autowired
	private GeneralPostDAO generalPostDAO;
	
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

	@Transactional
	@Override
	public GeneralPostVO getOneFreeBoard(String generalPostId) {
		GeneralPostVO result = null;
		result = generalPostDAO.getOneFreeBoard(generalPostId);
		
		return result;
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

		System.out.println(generalPostDAO);
		System.out.println(generalPostDAO.getClass().getSimpleName());
		GeneralPostListVO generalPostListVO = new GeneralPostListVO();
		
		generalPostListVO.setBoardCnt( generalPostDAO.getBoardAllCount());
		generalPostListVO.setGeneralPostList( generalPostDAO.getAllQnABoard());
		return generalPostListVO;	
	}
	
	@Transactional
	@Override
	public boolean createNewQnABoard(GeneralPostVO generalPostVO) {
		int boardCount = generalPostDAO.createNewQnABoard(generalPostVO);

		return boardCount > 0;
	}

	@Transactional
	@Override
	public GeneralPostVO getOneQnABoard(String generalPostId) {
		GeneralPostVO result = null;
		
		result = generalPostDAO.getOneQnABoard(generalPostId);
		
		return result;
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
	@Transactional
	@Override
	public GeneralPostListVO getMyPost(String postWriter) {
		GeneralPostListVO generalPostListVO = new GeneralPostListVO();
		generalPostListVO.setGeneralPostList(generalPostDAO.getMyPost(postWriter));
		return generalPostListVO;
	}

}
