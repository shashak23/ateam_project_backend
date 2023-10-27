package com.ktdsuniversity.edu.algorithmanswer.dao;

import java.util.List;

import com.ktdsuniversity.edu.algorithmanswer.vo.AlgorithmAnswerVO;

public interface AlgorithmAnswerDAO {

	public int createAlgorithmAnswer(AlgorithmAnswerVO algorithmAnswerVO);
	
	public List<AlgorithmAnswerVO> getAlgorithmAnswer(String companyAlgorithmQuestionId);
	
	public List<Integer> getResult(String companyAlgorithmQuestionId);
}
