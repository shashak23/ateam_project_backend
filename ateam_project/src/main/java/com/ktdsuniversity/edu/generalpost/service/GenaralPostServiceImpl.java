package com.ktdsuniversity.edu.generalpost.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ktdsuniversity.edu.generalpost.dao.GeneralPostDAO;
import com.ktdsuniversity.edu.generalpost.vo.GenaralPostVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostListVO;

@Service
public class GenaralPostServiceImpl implements GeneralPostService{

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
	public boolean createNewBoard(GenaralPostVO generalPostVO, MultipartFile file) {
		return false;
	}

}
