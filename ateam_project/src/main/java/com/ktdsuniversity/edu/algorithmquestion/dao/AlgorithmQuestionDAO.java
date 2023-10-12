package com.ktdsuniversity.edu.algorithmquestion.dao;

import java.util.List;

import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionVO;

public interface AlgorithmQuestionDAO {

	public int getAlgorithmQuestionAllCount();
	
	public List<AlgorithmQuestionVO> getAllAlgorithmQuestion();
}
