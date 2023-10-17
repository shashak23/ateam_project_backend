/**
 * 작성자 : 김시하 
 * 수정자 : 김시하(2023-10-17)
 * 작성일자 : 2023-10-16
 * 내용 : 자유 및 질답게시판을 위한 Service
 */
package com.ktdsuniversity.edu.generalpost.service;

import org.springframework.web.multipart.MultipartFile;

import com.ktdsuniversity.edu.generalpost.vo.GeneralPostListVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;


public interface GeneralPostService {
	// 자유게시판
	public GeneralPostListVO getAllFreeBoard();

	public boolean createNewFreeBoard(GeneralPostVO generalPostVO);

	public GeneralPostVO getOneFreeBoard(String generalPostId);
	
	public boolean updateOneFreeBoard(GeneralPostVO generalPostVO);
		
	public boolean deleteOneFreeBoard(String generalPostId);
	
	// 질답게시판
	public GeneralPostListVO getAllQnABoard();

	public boolean createNewQnABoard(GeneralPostVO generalPostVO);

	public GeneralPostVO getOneQnABoard(String generalPostId);
	
	public boolean updateOneQnABoard(GeneralPostVO generalPostVO);
		
	public boolean deleteOneQnABoard(String generalPostId);
}
