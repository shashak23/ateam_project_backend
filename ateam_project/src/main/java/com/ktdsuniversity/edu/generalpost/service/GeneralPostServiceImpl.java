package com.ktdsuniversity.edu.generalpost.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	@Override
	public GeneralPostListVO getAllFreeBoard(SearchForumVO searchForumVO) {

		GeneralPostListVO generalPostListVO = new GeneralPostListVO();
		
		if (searchForumVO == null) {
//			generalPostListVO.setBoardCnt( generalPostDAO.getBoardAllCount(searchForumVO));
			generalPostListVO.setGeneralPostList(generalPostDAO.getAllFreeBoard());
		} else { 
			generalPostListVO.setGeneralPostList(generalPostDAO.searchAllBoard(searchForumVO));
		}
		return generalPostListVO;	
	}

	@Override
	public boolean createNewFreeBoard(GeneralPostVO generalPostVO) {
		int boardCount = generalPostDAO.createNewFreeBoard(generalPostVO);

		return boardCount > 0;
	}

	@Override
	public GeneralPostVO getOneFreeBoard(String generalPostId, boolean isIncrease) {
		if(isIncrease) {
			int updateCount = generalPostDAO.increaseForumViewCount(generalPostId);
			if (updateCount == 0) {
				throw new IllegalArgumentException("잘못된 접근입니다");
			}
		}
		// 예외가 발생하지 않았다면 게시글 정보를 조회한다.
		GeneralPostVO result = null;
		result = generalPostDAO.getOneFreeBoard(generalPostId);

		if(result == null) {
			// 파라미터로 전달받은 id값이 db에 존재하지 않을 경우
			// 잘못된 접근입니다. 라고  사용자에게 예외 메세지를 보내준다.
			throw new IllegalArgumentException("잘못된 접근입니다.");
		}
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
	public GeneralPostListVO getAllQnABoard(SearchForumVO searchForumVO) {
//
//		System.out.println(generalPostDAO);
//		System.out.println(generalPostDAO.getClass().getSimpleName());
//		GeneralPostListVO generalPostListVO = new GeneralPostListVO();
//		
//		generalPostListVO.setBoardCnt( generalPostDAO.getBoardAllCount());
//		generalPostListVO.setGeneralPostList( generalPostDAO.getAllQnABoard());
//		return generalPostListVO;
		GeneralPostListVO generalPostListVO = new GeneralPostListVO();
		
		if (searchForumVO == null) {
//			generalPostListVO.setBoardCnt( generalPostDAO.getBoardAllCount(searchForumVO));
			generalPostListVO.setGeneralPostList(generalPostDAO.getAllFreeBoard());
		} else { 
			generalPostListVO.setGeneralPostList(generalPostDAO.searchAllBoard(searchForumVO));
		}
		return generalPostListVO;
	}

	@Override
	public boolean createNewQnABoard(GeneralPostVO generalPostVO) {
		int boardCount = generalPostDAO.createNewQnABoard(generalPostVO);

		return boardCount > 0;
	}

	@Override
	public GeneralPostVO getOneQnABoard(String generalPostId, boolean isIncrease) {
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
