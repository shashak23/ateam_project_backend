package com.ktdsuniversity.edu.generalpost.dao;

import java.util.List;

import com.ktdsuniversity.edu.generalpost.vo.GenaralPostVO;

public interface GeneralPostDAO {

	/**
	 * DB에 저장된 모든 게시글의 수를 조회
	 * @return 게시글의 수 
	 */
	public int getBoardAllCount();
	
	/**
	 * DB에 저장된 모든 게시글의 목록을 조회
	 * @return 게시글 목록
	 */
	public List<GenaralPostVO> getAllBoard();
	
	/**
	 * DB에 새로운 게시글을 등록한다
	 * @param generalVO
	 * @return
	 */
	public int createNewBoard(GenaralPostVO generalVO);
	
	public int increaseViewCount(int likeCnt);
	
	public GenaralPostVO getOneBoardVO(int likeCnt);
	
	public int updateOneBoard(GenaralPostVO generaVO);
	
	public int deleteOnBoard(int boardId);
	
}
