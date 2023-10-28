/**
 * 작성자: 장보늬
 * 작성일자: 2023-10-26
 * 내용: 알고리즘문제 테스트 데이터 관련 ServiceImpl
 */
package com.ktdsuniversity.edu.algorithmanswer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktdsuniversity.edu.algorithmanswer.dao.AlgorithmAnswerDAO;
import com.ktdsuniversity.edu.algorithmanswer.vo.AlgorithmAnswerListVO;
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
