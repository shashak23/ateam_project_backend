package com.ktdsuniversity.edu.generalpost.dao;

import java.util.List;

import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;

public interface GeneralPostDAO {

	public int getBoardAllCount();
	
	public List<GeneralPostVO> getAllBoard();
	
	public int createNewBoard(GeneralPostVO generalVO);
	
	public int increaseViewCount(int likeCnt);
	
	public GeneralPostVO getOneBoardVO(int generalPostId);
	
	public int updateOneBoard(GeneralPostVO generaVO);
	
	public int deleteOnBoard(int generalPostId);
	
}
