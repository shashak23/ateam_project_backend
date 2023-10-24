package com.ktdsuniversity.edu.home.dao;

import java.util.List;

import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.home.vo.HomeBoardVO;

public interface HomeBoardDAO {
	public List<GeneralPostVO> getWeeklyRanking(String date);
	public List<HomeBoardVO> getHashtag(String postId);
}
