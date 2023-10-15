package com.ktdsuniversity.edu.algorithmquestion.dao;

import java.util.List;

import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionVO;
import com.ktdsuniversity.edu.algorithmquestion.vo.SearchAlgorithmQuestionVO;

public interface AlgorithmQuestionDAO {

	public int getAlgorithmQuestionAllCount(SearchAlgorithmQuestionVO searchAlgorithmQuestionVO);
	
	public List<AlgorithmQuestionVO> getAllAlgorithmQuestion();
	
	public List<AlgorithmQuestionVO> searchAllAlgorithmQuestion(SearchAlgorithmQuestionVO searchAlgorithmQuestionVO);
	
	public int createNewsAlgorithmQuestion(AlgorithmQuestionVO algorithmQuestionVO);
	
	public int increaseViewCount(String companyAlgorithmQuestionId);
	
	public AlgorithmQuestionVO getOneAlgorithmQuestion(String companyAlgorithmQuestionId);
	
	public int updateOneAlgorithmQuestion(AlgorithmQuestionVO algorithmQuestionVO);
	
	public int deleteOneAlgorithmQuestion(String companyAlgorithmQuestionId);
}
