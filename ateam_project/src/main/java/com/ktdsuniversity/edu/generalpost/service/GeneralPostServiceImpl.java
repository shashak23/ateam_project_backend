package com.ktdsuniversity.edu.generalpost.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktdsuniversity.edu.exceptions.PageNotFoundException;
import com.ktdsuniversity.edu.generalpost.dao.GeneralPostDAO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostListVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;

@Service
public class GeneralPostServiceImpl implements GeneralPostService{

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
		return false;
	}

	@Override
	public GeneralPostVO getOneBoard(int generalPostId, boolean isIncrease) {
		if(isIncrease) {
			int updateCount = generalPostDAO.increaseViewCount(generalPostId);
			if(updateCount == 0) {
				// 예외가 발생한다면, 
				throw new PageNotFoundException("잘못된 접근입니다");
			}
		}
		// 예외가 발생하지 않는다면,
		GeneralPostVO generalPostVO = generalPostDAO.getOneBoardVO(generalPostId);
		if(generalPostVO == null) {
			throw new PageNotFoundException("잘못된 접근입니다");

		}
		return generalPostVO;
	}

	@Override
	public boolean updateOneBoard(GeneralPostVO generalPostVO) {
		int updateCount = generalPostDAO.updateOneBoard(generalPostVO);
		return updateCount > 0;
	}

	@Override
	public boolean deleteOneBoard(GeneralPostVO generalPostVO) {
		// TODO Auto-generated method stub
		return false;
	}

}
