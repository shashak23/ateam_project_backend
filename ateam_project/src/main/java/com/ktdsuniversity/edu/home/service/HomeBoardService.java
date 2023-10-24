package com.ktdsuniversity.edu.home.service;

import java.util.List;

import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;

public interface HomeBoardService {
	public List<GeneralPostVO> getWeeklyRanking(String date); 
}
