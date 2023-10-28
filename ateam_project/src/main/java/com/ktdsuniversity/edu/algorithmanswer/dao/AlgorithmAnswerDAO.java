/**
 * 작성자: 장보늬
 * 작성일자: 2023-10-26
 * 내용: 알고리즘문제 테스트 데이터 관련 DAO
 */
package com.ktdsuniversity.edu.algorithmanswer.dao;

import java.util.List;

import com.ktdsuniversity.edu.algorithmanswer.vo.AlgorithmAnswerVO;

public interface AlgorithmAnswerDAO {

	public int createAlgorithmAnswer(AlgorithmAnswerVO algorithmAnswerVO);
	
	public List<AlgorithmAnswerVO> getAlgorithmAnswer(String companyAlgorithmQuestionId);
	
	public List<Integer> getResult(String companyAlgorithmQuestionId);
}
