/**
 * 작성자 : 김시하 
 * 수정자 : 김시하(2023-10-17)
 * 작성일자 : 2023-10-16
 * 내용 : 자유 및 질답게시판을 위한 Service
 */
package com.ktdsuniversity.edu.generalpost.service;

import com.ktdsuniversity.edu.generalpost.vo.GeneralPostListVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.generalpost.vo.SearchForumVO;


public interface GeneralPostService {
	// 자유게시판
	public GeneralPostListVO getAllFreeBoard(SearchForumVO searchForumVO);

	public boolean createNewFreeBoard(GeneralPostVO generalPostVO);

	public GeneralPostVO getOneFreeBoard(String generalPostId, boolean isIncrease);
	
	public boolean updateOneFreeBoard(GeneralPostVO generalPostVO);
		
	public boolean deleteOneFreeBoard(String generalPostId);
	
	// 질답게시판
	public GeneralPostListVO getAllQnABoard(SearchForumVO searchForumVO);

	public boolean createNewQnABoard(GeneralPostVO generalPostVO);

	public GeneralPostVO getOneQnABoard(String generalPostId, boolean isIncrease);
	
	public boolean updateOneQnABoard(GeneralPostVO generalPostVO);
		
	public boolean deleteOneQnABoard(String generalPostId);
}
