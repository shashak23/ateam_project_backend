/**
 * 작성자 : 김시하 
 * 수정자 : 김시하(2023-10-23)
 * 수정자 : 김시하(2023-11-01)
 * 수정자 : 김태현(2023-11-01)
 * 작성일자 : 2023-10-16
 * 내용 : 자유 및 질답게시판을 위한 Service
 */
package com.ktdsuniversity.edu.generalpost.service;

import java.util.List;

import com.ktdsuniversity.edu.common.vo.AbstractSearchVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostListVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.generalpost.vo.SearchForumVO;


public interface GeneralPostService {
	// 자유게시판
	public GeneralPostListVO getAllFreeBoard(SearchForumVO searchForumVO);

	public boolean createNewFreeBoard(GeneralPostVO generalPostVO);

	public GeneralPostVO getOneFreeBoard(String generalPostId);
	
	public boolean updateOneFreeBoard(GeneralPostVO generalPostVO);
		
	public boolean deleteOneFreeBoard(String generalPostId);
	
	public boolean likeFreeBoard(GeneralPostVO generalPostVO);
	
	public List<GeneralPostVO> getAllFreeBoardRest();
	
	// 질답게시판
	public GeneralPostListVO getAllQnABoard(SearchForumVO searchForumVO);

	public boolean createNewQnABoard(GeneralPostVO generalPostId);

	public GeneralPostVO getOneQnABoard(String generalPostId);
	
	public boolean updateOneQnABoard(GeneralPostVO generalPostVO);
		
	public boolean deleteOneQnABoard(String generalPostId);

	public boolean likeQnABoard(GeneralPostVO generalPostVO);
	
	public List<GeneralPostVO> getAllQnaBoardRest();

	// 내 게시글 조회
	public GeneralPostListVO getMyPost(GeneralPostVO generalPostVO);
	// 통합검색
	public GeneralPostListVO searchAllBoardByKeyword(AbstractSearchVO abstractSearchVO);
	// 조회수순 랭킹
	public List<GeneralPostVO> getViewRanking(String date);
	// 좋아요순 랭킹
	public List<GeneralPostVO> getLikeRanking(String date);

	public List<GeneralPostVO> SearchFreeBoardRest(SearchForumVO searchForumVO);
	
	public List<GeneralPostVO> SearchQnaBoardRest(SearchForumVO searchForumVO);
}
