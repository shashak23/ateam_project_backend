package com.ktdsuniversity.edu.algorithmquestion.service;

import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionListVO;
import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionVO;
import com.ktdsuniversity.edu.algorithmquestion.vo.SearchAlgorithmQuestionVO;
import com.ktdsuniversity.edu.myalgorithm.vo.MyAlgorithmVO;

public interface AlgorithmQuestionService {
	
	public AlgorithmQuestionListVO getAllAlgorithmQuestion(SearchAlgorithmQuestionVO searchAlgorithmQuestionVO);
	
	public boolean createNewsAlgorithmQuestion(AlgorithmQuestionVO algorithmQuestionVO);
	
	public AlgorithmQuestionVO getOneAlgorithmQuestion(String companyAlgorithmQuestionId, boolean isIncrease);
	
	public boolean updateOneAlgorithmQuestion(AlgorithmQuestionVO algorithmQuestionVO);
	
	public boolean deleteOneAlgorithmQuestion(String companyAlgorithmQuestionId);

	public boolean createNewMyAlgorithm(MyAlgorithmVO myAlgorithmVO);
}
