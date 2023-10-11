package com.ktdsuniversity.edu.generalpost.service;

import org.springframework.web.multipart.MultipartFile;

import com.ktdsuniversity.edu.generalpost.vo.GeneralPostListVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;


public interface GeneralPostService {

	public GeneralPostListVO getAllBoard();

	public boolean createNewBoard(GeneralPostVO generalPostVO);

	public GeneralPostVO getOneBoard(int generalPostId, boolean isIncrease);
	
	public boolean updateOneBoard(GeneralPostVO generalPostVO);
	
	public String deleteFreeBoard(String generalPostId);
}
