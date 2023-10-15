package com.ktdsuniversity.edu.myalgorithm.dao;

import java.util.List;

import com.ktdsuniversity.edu.myalgorithm.vo.MyAlgorithmVO;

public interface MyAlgorithmDAO {
	public int getAllNumber(String email);
	public List<MyAlgorithmVO> getAllMyAlgorithmList(String email);
	
	public int createNewMyAlgorithm(MyAlgorithmVO myalgorithmVO);
}
