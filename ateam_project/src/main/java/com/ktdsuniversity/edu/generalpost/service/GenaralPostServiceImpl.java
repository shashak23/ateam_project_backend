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

	// 게시글 등록
	@Override
	public boolean createNewBoard(GenaralPostVO generalPostVO) {
		// DB에 게시글을 등록한다.
		// createCount에는 DB에 등록한 게시글의 개수를 반환.
		int createCount = generalPostDAO.createNewBoard(generalPostVO);
		// DB에 등록된 개수가 0보다 크면 성공, 아니라면 실패.
		return createCount > 0;
	}

}
