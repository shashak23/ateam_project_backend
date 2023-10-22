/**
 * 작성자: 김시하
 * 수정자: 김시하(2023-10-16)
 * 수정자: 장보늬(2023-10-22)
 * 작성일자: 2023-10-16
 * 내용: 자유 및 질답게시판의 mapper를 실행하기 위한 interface DAO입니다.
 */
package com.ktdsuniversity.edu.generalpost.dao;

import java.util.List;

import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.generalpost.vo.SearchForumVO;

public interface GeneralPostDAO {
	// 게시글 수 
	public int getBoardAllCount();
	// 조회수 
	public int increaseViewCount(String generalPostId);

	// 자유게시판
	public List<GeneralPostVO> getAllFreeBoard();
	
	public int createNewFreeBoard(GeneralPostVO generalVO);
	
	public GeneralPostVO getOneFreeBoard(String generalPostId);

	public int updateOneFreeBoard(GeneralPostVO generaVO);
	
	public int deleteOneFreeBoard(String generalPostId);

	// 질답게시판
	public List<GeneralPostVO> getAllQnABoard();
	
	public int createNewQnABoard(GeneralPostVO generalVO);
	
	public GeneralPostVO getOneQnABoard(String generalPostId);

	public int updateOneQnABoard(GeneralPostVO generaVO);
	
	public int deleteOneQnABoard(String generalPostId);

	// 내 게시글 조회
	public List<GeneralPostVO> getMyPost(String postWriter);
}
