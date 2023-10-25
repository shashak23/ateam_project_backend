package com.ktdsuniversity.edu.home.dao;

import java.util.List;

import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.home.vo.HomeBoardVO;
import com.ktdsuniversity.edu.home.vo.HomeNickNameVO;
import com.ktdsuniversity.edu.home.vo.HomecommentCntVO;

public interface HomeBoardDAO {
	public List<GeneralPostVO> getAllGeneralPost();
	public List<HomecommentCntVO> getAllGeneralCommentCnt();
	public List<HomeNickNameVO> getNicknameList();
	public List<GeneralPostVO> getWeeklyRanking(String date);
	public List<HomeBoardVO> getHashtag(String postId);
}
