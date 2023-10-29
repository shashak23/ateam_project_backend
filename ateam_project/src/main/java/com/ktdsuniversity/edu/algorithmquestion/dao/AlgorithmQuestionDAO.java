/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 내용: 알고리즘문제 게시판의 CRUD 쿼리를 수행합니다.
 */

package com.ktdsuniversity.edu.algorithmquestion.dao;

import java.util.List;

import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionVO;
import com.ktdsuniversity.edu.algorithmquestion.vo.SearchAlgorithmQuestionVO;
import com.ktdsuniversity.edu.common.vo.AbstractCompanyPostVO;
import com.ktdsuniversity.edu.common.vo.AbstractSearchVO;

public interface AlgorithmQuestionDAO {

	public int getAlgorithmQuestionAllCount(SearchAlgorithmQuestionVO searchAlgorithmQuestionVO);
	
	public List<AlgorithmQuestionVO> getAllAlgorithmQuestion();
	
	public List<AlgorithmQuestionVO> searchAllAlgorithmQuestion(SearchAlgorithmQuestionVO searchAlgorithmQuestionVO);
	
	public int createNewAlgorithmQuestion(AlgorithmQuestionVO algorithmQuestionVO);
	
	public int createNewAlgorithmQuestionCategory(AlgorithmQuestionVO algorithmQuestionVO);
	
	public int increaseViewCount(String companyAlgorithmQuestionId);
	
	public AlgorithmQuestionVO getOneAlgorithmQuestion(String companyAlgorithmQuestionId);
	
	public int updateOneAlgorithmQuestion(AlgorithmQuestionVO algorithmQuestionVO);
	
	public int deleteAlgorithmQuestionCategory(AlgorithmQuestionVO algorithmQuestionVO);
	
	public int insertAlgorithmQuestionCategory(AlgorithmQuestionVO algorithmQuestionVO);
	
	public int deleteOneAlgorithmQuestion(AlgorithmQuestionVO algorithmQuestionVO);
	
	// 기업회원 내 게시글 조회
	public List<AlgorithmQuestionVO> getCompanyMyPost(AbstractCompanyPostVO abstractCompanyPostVO);
	
	// 통합검색
	public List<AlgorithmQuestionVO> searchAllAlgorithmQuestionByKeyword(AbstractSearchVO abstractSearchVO);
}
