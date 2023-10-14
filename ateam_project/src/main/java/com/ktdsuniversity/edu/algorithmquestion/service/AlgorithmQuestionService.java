package com.ktdsuniversity.edu.algorithmquestion.service;

import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionListVO;
import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionVO;

public interface AlgorithmQuestionService {
	
	public AlgorithmQuestionListVO getAllAlgorithmQuestion();
	
	public boolean createNewsAlgorithmQuestion(AlgorithmQuestionVO algorithmQuestionVO);
	
	public AlgorithmQuestionVO getOneAlgorithmQuestion(String companyAlgorithmQuestionId, boolean isIncrease);
	
	public boolean updateOneAlgorithmQuestion(AlgorithmQuestionVO algorithmQuestionVO);
	
	public boolean deleteOneAlgorithmQuestion(String companyAlgorithmQuestionId);

}
