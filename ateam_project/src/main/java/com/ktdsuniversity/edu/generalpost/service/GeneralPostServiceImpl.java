package com.ktdsuniversity.edu.generalpost.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ktdsuniversity.edu.generalpost.dao.GeneralPostDAO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostListVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.generalpost.web.FreePostController;
import com.ktdsuniversity.edu.member.vo.MemberVO;

@Service
public class GeneralPostServiceImpl implements GeneralPostService{

	private Logger log = LoggerFactory.getLogger(FreePostController.class);
	
	@Autowired
	private GeneralPostDAO generalPostDAO;
	
	// 자유게시판
	@Override
	public GeneralPostListVO getAllFreeBoard() {

		GeneralPostListVO generalPostListVO = new GeneralPostListVO();
		
		generalPostListVO.setBoardCnt( generalPostDAO.getBoardAllCount());
		generalPostListVO.setGeneralPostList( generalPostDAO.getAllFreeBoard());
		return generalPostListVO;	
	}

	@Override
	public boolean createNewFreeBoard(GeneralPostVO generalPostVO) {
		int boardCount = generalPostDAO.createNewFreeBoard(generalPostVO);

		return boardCount > 0;
	}

	@Override
	public GeneralPostVO getOneFreeBoard(String generalPostId) {
		GeneralPostVO result = null;
		
		result = generalPostDAO.getOneFreeBoard(generalPostId);
		
		return result;
	}

	@Override
	public boolean updateOneFreeBoard(GeneralPostVO generalPostVO) {
		int updateCount = generalPostDAO.updateOneFreeBoard(generalPostVO);
		return updateCount > 0;
	}

	@Override
	public boolean deleteOneFreeBoard(String generalPostId) {
		int deleteCount = generalPostDAO.deleteOneFreeBoard(generalPostId);
		
		return deleteCount > 0;
	}
	
	// 질답게시판 
	@Override
	public GeneralPostListVO getAllQnABoard() {

		System.out.println(generalPostDAO);
		System.out.println(generalPostDAO.getClass().getSimpleName());
		GeneralPostListVO generalPostListVO = new GeneralPostListVO();
		
		generalPostListVO.setBoardCnt( generalPostDAO.getBoardAllCount());
		generalPostListVO.setGeneralPostList( generalPostDAO.getAllQnABoard());
		return generalPostListVO;	
	}

	@Override
	public boolean createNewQnABoard(GeneralPostVO generalPostVO) {
		int boardCount = generalPostDAO.createNewQnABoard(generalPostVO);

		return boardCount > 0;
	}

	@Override
	public GeneralPostVO getOneQnABoard(String generalPostId) {
		GeneralPostVO result = null;
		
		log.debug("2-----서비스---------------------------");
		result = generalPostDAO.getOneQnABoard(generalPostId);
		
		return result;
	}

	@Override
	public boolean updateOneQnABoard(GeneralPostVO generalPostVO) {
		int updateCount = generalPostDAO.updateOneQnABoard(generalPostVO);
		return updateCount > 0;
	}

	@Override
	public boolean deleteOneQnABoard(String generalPostId) {
		int deleteCount = generalPostDAO.deleteOneQnABoard(generalPostId);
		
		return deleteCount > 0;
	}
}
