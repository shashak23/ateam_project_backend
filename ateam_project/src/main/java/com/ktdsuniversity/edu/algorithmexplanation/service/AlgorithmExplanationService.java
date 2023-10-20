/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 내용: 알고리즘해설 게시판의 CRUD 실행결과를 저장합니다.
 */

package com.ktdsuniversity.edu.algorithmexplanation.service;

import com.ktdsuniversity.edu.algorithmexplanation.vo.AlgorithmExplanationListVO;
import com.ktdsuniversity.edu.algorithmexplanation.vo.AlgorithmExplanationVO;

public interface AlgorithmExplanationService {
	
    public AlgorithmExplanationListVO getAllAlgorithmExplanation();
	
	public boolean createNewAlgorithmExplanation (AlgorithmExplanationVO algorithmExplanationVO);
	
    public AlgorithmExplanationVO getOneAlgorithmExplanation(String companyAlgorithmExplanationId, boolean isIncrease);
	
	public boolean updateOneAlgorithmExplanation(AlgorithmExplanationVO algorithmExplanationVO);
	
	public boolean deleteOneAlgorithmExplanation(String companyAlgorithmExplanationId);
	

}
