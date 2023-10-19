/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 내용: 알고리즘해설 게시판의 CRUD 쿼리를 수행합니다.
 * 
 */ 

package com.ktdsuniversity.edu.algorithmexplanation.dao;

import java.util.List;

import com.ktdsuniversity.edu.algorithmexplanation.vo.AlgorithmExplanationVO;

public interface AlgorithmExplanationDAO {
	
	public int getAlgorithmExplanationAllCount();
	
	public List<AlgorithmExplanationVO> getAllAlgorithmExplanation();
	
	public int createNewAlgorithmExplanation (AlgorithmExplanationVO algorithmExplanationVO);
	
	public int increaseViewCount(String companyAlgorithmExplanationId);
	
	public AlgorithmExplanationVO getOneAlgorithmExplanation(String companyAlgorithmExplanationId);
	
	public int updateOneAlgorithmExplanation(AlgorithmExplanationVO algorithmExplanationVO);
	
	public int deleteOneAlgorithmExplanation(String companyAlgorithmExplanationId);
	
	
}
