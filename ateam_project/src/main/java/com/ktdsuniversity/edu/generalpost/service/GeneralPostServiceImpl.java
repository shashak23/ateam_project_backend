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
	
	// 전체조회
	@Override
	public GeneralPostListVO getAllBoard() {

		System.out.println(generalPostDAO);
		System.out.println(generalPostDAO.getClass().getSimpleName());
		GeneralPostListVO generalPostListVO = new GeneralPostListVO();
		
		generalPostListVO.setBoardCnt( generalPostDAO.getBoardAllCount());
		generalPostListVO.setGeneralPostList( generalPostDAO.getAllBoard());
		return generalPostListVO;	
	}

	@Override
	public boolean createNewBoard(GeneralPostVO generalPostVO) {
		int boardCount = generalPostDAO.createNewBoard(generalPostVO);
		
		return boardCount > 0;
	}

	@Override
	public GeneralPostVO getOneBoard(String generalPostId) {
		GeneralPostVO result = null;
		
		result = generalPostDAO.getOneBoard(generalPostId);
		
		return result;
	}

	@Override
	public boolean updateOneBoard(GeneralPostVO generalPostVO) {
		int updateCount = generalPostDAO.updateOneBoard(generalPostVO);
		return updateCount > 0;
	}

	@Override
	public boolean deleteOneBoard(GeneralPostVO generalPostVO) {
		return false;
	}

//	@Override
//	public GeneralPostVO getOneBoard(String generalPostId, boolean isIncrease) {
//		log.debug("서비스 되나요? ------------------ ");
//		if(isIncrease) {
//			int updateCount = generalPostDAO.increaseViewCount(generalPostId);
//			if(updateCount == 0) {
//				// 예외가 발생한다면, 
//				throw new IllegalArgumentException("잘못된 접근입니다");
//			}
//		}
//		// 예외가 발생하지 않는다면,
//		GeneralPostVO generalPostVO = generalPostDAO.getOneBoard(generalPostId);
//		if(generalPostVO == null) {
//			throw new IllegalArgumentException("잘못된 접근입니다");
//
//		}
//		return generalPostVO;
//	}
}
