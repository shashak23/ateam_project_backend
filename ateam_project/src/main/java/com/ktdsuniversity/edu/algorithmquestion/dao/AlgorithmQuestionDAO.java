package com.ktdsuniversity.edu.algorithmquestion.dao;

import java.util.List;

import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionVO;

public interface AlgorithmQuestionDAO {

	public int getAlgorithmQuestionAllCount();
	
	public List<AlgorithmQuestionVO> getAllAlgorithmQuestion();
	
	public int createNewsAlgorithmQuestion(AlgorithmQuestionVO algorithmQuestionVO);
	
	public int increaseViewCount(String companyAlgorithmQuestionId);
	
	public AlgorithmQuestionVO getOneAlgorithmQuestion(String companyAlgorithmQuestionId);
	
	public int updateOneAlgorithmQuestion(AlgorithmQuestionVO algorithmQuestionVO);
	
	public int deleteOneAlgorithmQuestion(String companyAlgorithmQuestionId);
}
