package com.ktdsuniversity.edu.generalpost.service;

import org.springframework.web.multipart.MultipartFile;

import com.ktdsuniversity.edu.generalpost.vo.GeneralPostListVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;


public interface GeneralPostService {

	public GeneralPostListVO getAllBoard();

	public boolean createNewFreeBoard(GeneralPostVO generalPostVO);

	public GeneralPostVO getOneBoard(String generalPostId);
	
	public boolean updateOneBoard(GeneralPostVO generalPostVO);
		
	public boolean deleteOneBoard(String generalPostId);
	
//	public GeneralPostVO getOneBoard(String generalPostId);
}
