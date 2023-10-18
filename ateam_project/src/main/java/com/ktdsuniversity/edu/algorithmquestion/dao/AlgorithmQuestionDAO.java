/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 내용: 알고리즘문제 게시판의 CRUD 쿼리를 수행합니다.
 */

package com.ktdsuniversity.edu.algorithmquestion.dao;

import java.util.List;

import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionVO;
import com.ktdsuniversity.edu.algorithmquestion.vo.SearchAlgorithmQuestionVO;
import com.ktdsuniversity.edu.myalgorithm.vo.MyAlgorithmVO;

public interface AlgorithmQuestionDAO {

	public int getAlgorithmQuestionAllCount(SearchAlgorithmQuestionVO searchAlgorithmQuestionVO);
	
	public List<AlgorithmQuestionVO> getAllAlgorithmQuestion();
	
	public List<AlgorithmQuestionVO> searchAllAlgorithmQuestion(SearchAlgorithmQuestionVO searchAlgorithmQuestionVO);

	public int createNewAlgorithmQuestion(AlgorithmQuestionVO algorithmQuestionVO);
	
	public int createNewAlgorithmQuestionCategory(AlgorithmQuestionVO algorithmQuestionVO);
	
	public int createNewMyAlgorithm(MyAlgorithmVO myalgorithmVO);
	
	public int increaseViewCount(String companyAlgorithmQuestionId);
	
	public AlgorithmQuestionVO getOneAlgorithmQuestion(String companyAlgorithmQuestionId);
	
	public int updateOneAlgorithmQuestion(AlgorithmQuestionVO algorithmQuestionVO);
	
	public int updateAlgorithmQuestionCategory(AlgorithmQuestionVO algorithmQuestionVO);
	
	public int deleteOneAlgorithmQuestion(String companyAlgorithmQuestionId);
}
