/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 수정자: 장보늬(2023-10-28)
 * 내용: 알고리즘해설 게시판의 CRUD 쿼리를 수행합니다.
 * 
 */ 

package com.ktdsuniversity.edu.algorithmexplanation.dao;

import java.util.List;

import com.ktdsuniversity.edu.algorithmexplanation.vo.AlgorithmExplanationVO;
import com.ktdsuniversity.edu.algorithmexplanation.vo.SearchAlgorithmExplanationVO;
import com.ktdsuniversity.edu.common.vo.AbstractCompanyPostVO;
import com.ktdsuniversity.edu.common.vo.AbstractSearchVO;

public interface AlgorithmExplanationDAO {
	
	public int getAlgorithmExplanationAllCount(SearchAlgorithmExplanationVO searchAlgorithmExplanationVO);
	
	public List<AlgorithmExplanationVO> getAllAlgorithmExplanation();
	
	public List<AlgorithmExplanationVO> searchAllAlgorithmExplanation(SearchAlgorithmExplanationVO searchAlgorithmExplanationVO);
	
	public int createNewAlgorithmExplanation (AlgorithmExplanationVO algorithmExplanationVO);
	
	public int increaseViewCount(String companyAlgorithmExplanationId);
	
	public AlgorithmExplanationVO getOneAlgorithmExplanation(String companyAlgorithmExplanationId);
	
	public int updateOneAlgorithmExplanation(AlgorithmExplanationVO algorithmExplanationVO);
	
	public int deleteOneAlgorithmExplanation(String companyAlgorithmExplanationId);
	
	// 기업회원 내 게시글 조회
	public List<AlgorithmExplanationVO> getCompanyMyPost(AbstractCompanyPostVO abstractCompanyPostVO);
	
	// 통합검색
	public List<AlgorithmExplanationVO> searchAllAlgorithmExplanationByKeyword(AbstractSearchVO abstractSearchVO);
}
