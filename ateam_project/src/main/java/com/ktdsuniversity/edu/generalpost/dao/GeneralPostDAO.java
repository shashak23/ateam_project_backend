package com.ktdsuniversity.edu.generalpost.dao;

import java.util.List;

import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

public interface GeneralPostDAO {

	public int getBoardAllCount();
	
	public List<GeneralPostVO> getAllBoard();
	
	public int createNewFreeBoard(GeneralPostVO generalVO);
	
	public GeneralPostVO getOneBoard(String generalPostId);

	public int updateOneBoard(GeneralPostVO generaVO);
	
	public int deleteOneBoard(String generalPostId);

	public int increaseViewCount(String generalPostId);
	
//	public int increaseViewCount(String generalPostId);
	
//	public GeneralPostVO getOneBoard(String generalPostId);
}
