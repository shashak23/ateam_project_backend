package com.ktdsuniversity.edu.home.dao;

import java.util.List;

import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;

public interface HomeBoardDAO {
	public List<GeneralPostVO> getWeeklyRanking(String date);
}
