/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 수정자: 장보늬(2023-10-24)
 * 내용: 알고리즘문제 게시판의 CRUD 실행결과를 저장합니다.
 */

package com.ktdsuniversity.edu.algorithmquestion.service;

import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionListVO;
import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionVO;
import com.ktdsuniversity.edu.algorithmquestion.vo.SearchAlgorithmQuestionVO;
import com.ktdsuniversity.edu.common.vo.AbstractSearchVO;

public interface AlgorithmQuestionService {
	
	public AlgorithmQuestionListVO getAllAlgorithmQuestion(SearchAlgorithmQuestionVO searchAlgorithmQuestionVO);
	
	public boolean createNewAlgorithmQuestion(AlgorithmQuestionVO algorithmQuestionVO);
	
	public AlgorithmQuestionVO getOneAlgorithmQuestion(String companyAlgorithmQuestionId, boolean isIncrease);
	
	public boolean updateOneAlgorithmQuestion(AlgorithmQuestionVO algorithmQuestionVO);
	
	public boolean deleteOneAlgorithmQuestion(String companyAlgorithmQuestionId);

	// 통합검색
	public AlgorithmQuestionListVO searchAllAlgorithmQuestionByKeyword(AbstractSearchVO abstractSearchVO);
}
