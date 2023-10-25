package com.ktdsuniversity.edu.algorithmanswer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktdsuniversity.edu.algorithmanswer.dao.AlgorithmAnswerDAO;
import com.ktdsuniversity.edu.algorithmanswer.vo.AlgorithmAnswerVO;

@Service
public class AlgorithmAnswerServiceImpl implements AlgorithmAnswerService {

	@Autowired
	private AlgorithmAnswerDAO algorithmAnswerDAO;
	
	@Transactional
	@Override
	public boolean createAlgorithmAnswer(AlgorithmAnswerVO algorithmAnswerVO) {
		int createCount = algorithmAnswerDAO.createAlgorithmAnswer(algorithmAnswerVO);
		return createCount > 0;
	}

}
