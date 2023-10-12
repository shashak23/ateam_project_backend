package com.ktdsuniversity.edu.algorithmquestion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktdsuniversity.edu.algorithmquestion.dao.AlgorithmQuestionDAO;
import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionListVO;

@Service
public class AlgorithmQuestionServiceImpl implements AlgorithmQuestionService {

	@Autowired
	private AlgorithmQuestionDAO algorithmQuestionDAO;
	
	@Override
	public AlgorithmQuestionListVO getAllAlgorithmQuestion() {
		
		AlgorithmQuestionListVO algorithmQuestionListVO = new AlgorithmQuestionListVO();
		algorithmQuestionListVO.setAlgorithmQuestionCnt(algorithmQuestionDAO.getAlgorithmQuestionAllCount());
		algorithmQuestionListVO.setAlgorithmQuestionList(algorithmQuestionDAO.getAllAlgorithmQuestion());
		
		return algorithmQuestionListVO;
	}

}
