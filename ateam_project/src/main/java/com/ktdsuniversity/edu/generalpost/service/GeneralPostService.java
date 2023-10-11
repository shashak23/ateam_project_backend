package com.ktdsuniversity.edu.generalpost.service;

import org.springframework.web.multipart.MultipartFile;

import com.ktdsuniversity.edu.generalpost.vo.GenaralPostVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostListVO;


public interface GeneralPostService {

	/**
	 * 전체조회
	 * @return
	 */
	public GeneralPostListVO getAllBoard();

	/**
	 * 새로운 게시글을 등록 처리한다
	 * @param generalPostVO 사용자가 입력한 게시글의 정보
	 * @return
	 */
	public boolean createNewBoard(GenaralPostVO generalPostVO);

}
