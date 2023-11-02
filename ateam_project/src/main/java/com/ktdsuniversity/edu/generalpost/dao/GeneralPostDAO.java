/**
 * 작성자: 김시하
 * 수정자: 김시하(2023-11-01)
 * 수정자: 김태현(2023-11-01)
 * 작성일자: 2023-10-16
 * 내용: 자유 및 질답게시판의 mapper를 실행하기 위한 interface DAO입니다.
 */
package com.ktdsuniversity.edu.generalpost.dao;

import java.util.List;

import com.ktdsuniversity.edu.common.vo.AbstractSearchVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.generalpost.vo.SearchForumVO;

public interface GeneralPostDAO {
	// 게시글 수 
	public int getBoardAllCount(SearchForumVO searchForumVO);
	// 조회수 
	public int increaseViewCount(String generalPostId);

	// 자유게시판
	public List<GeneralPostVO> getAllFreeBoard();
	
	public int createNewFreeBoard(GeneralPostVO generalVO);
	
	public GeneralPostVO getOneFreeBoard(String generalPostId);

	public int updateOneFreeBoard(GeneralPostVO generaVO);
	
	public int deleteOneFreeBoard(String generalPostId);

	public int updateLikeFreePost(GeneralPostVO generalPostVO);
	
	public List<GeneralPostVO> getAllFreeBoardRest();
	
	// 질답게시판
	public List<GeneralPostVO> getAllQnABoard();
	
	public int createNewQnABoard(GeneralPostVO generalVO);
	
	public GeneralPostVO getOneQnABoard(String generalPostId);

	public int updateOneQnABoard(GeneralPostVO generaVO);
	
	public int deleteOneQnABoard(String generalPostId);

	public int updateLikeQnAPost(GeneralPostVO generalPostVO);
	
	public List<GeneralPostVO> getAllQnaBoardRest();
	// 내 게시글 조회
	public List<GeneralPostVO> getMyPost(GeneralPostVO generalPostVO);
	// 통합검색
	public List<GeneralPostVO> searchAllBoardByKeyword(AbstractSearchVO abstractSearchVO);
	// 조회수순 랭킹
	public List<GeneralPostVO> getViewRanking(String date);
	// 좋아요순 랭킹
	public List<GeneralPostVO> getLikeRanking(String date);

	public List<GeneralPostVO> SearchFreeBoardRest(SearchForumVO searchForumVO);

	public List<GeneralPostVO> SearchQnaBoardRest(SearchForumVO searchForumVO);
	// 자유 검색
	public List<GeneralPostVO> searchAllFreePost(SearchForumVO searchForumVO);
	// 질답 검색
	public List<GeneralPostVO> searchAllQnAPost(SearchForumVO searchForumVO);
	
}
