package com.ktdsuniversity.edu.generalpost.dao;

import java.util.List;

import com.ktdsuniversity.edu.generalpost.vo.GenaralPostVO;

public interface GeneralPostDAO {

	public int getBoardAllCount();
	
	public List<GenaralPostVO> getAllBoard();
	
	public int createNewBoard(GenaralPostVO generalVO);
	
	public int increaseViewCount(int likeCnt);
	
	public GenaralPostVO getOneBoardVO(int likeCnt);
	
	public int updateOneBoard(GenaralPostVO generaVO);
	
	public int deleteOnBoard(int boardId);
	
}
