/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 수정자: 장보늬(2023-10-28)
 * 내용: 알고리즘해설 게시판의 CRUD 실행결과를 저장합니다.
 */

package com.ktdsuniversity.edu.algorithmexplanation.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktdsuniversity.edu.algorithmexplanation.dao.AlgorithmExplanationDAO;
import com.ktdsuniversity.edu.algorithmexplanation.vo.AlgorithmExplanationListVO;
import com.ktdsuniversity.edu.algorithmexplanation.vo.AlgorithmExplanationVO;
import com.ktdsuniversity.edu.algorithmexplanation.vo.SearchAlgorithmExplanationVO;
import com.ktdsuniversity.edu.common.vo.AbstractCompanyPostVO;
import com.ktdsuniversity.edu.common.vo.AbstractSearchVO;
import com.ktdsuniversity.edu.exceptions.PageNotFoundException;

@Service
public class AlgorithmExplanationServiceImpl implements AlgorithmExplanationService{

	private Logger logger = LoggerFactory.getLogger(AlgorithmExplanationServiceImpl.class);
	
	@Autowired
	private AlgorithmExplanationDAO algorithmExplanationDAO;
	
	@Override
	public AlgorithmExplanationListVO getAllAlgorithmExplanation(SearchAlgorithmExplanationVO searchAlgorithmExplanationVO) {
		AlgorithmExplanationListVO algorithmExplanationListVO = new AlgorithmExplanationListVO();
		algorithmExplanationListVO.setAlgorithmExplanationCnt(algorithmExplanationDAO.getAlgorithmExplanationAllCount(searchAlgorithmExplanationVO));
		if( searchAlgorithmExplanationVO == null) {
			algorithmExplanationListVO.setAlgorithmExplanationList(algorithmExplanationDAO.getAllAlgorithmExplanation());
		}
		else {
			algorithmExplanationListVO.setAlgorithmExplanationList(algorithmExplanationDAO.searchAllAlgorithmExplanation(searchAlgorithmExplanationVO));
		}
		return algorithmExplanationListVO;
	}

	@Transactional
	@Override
	public boolean createNewAlgorithmExplanation(AlgorithmExplanationVO algorithmExplanationVO) {
		int createCount = algorithmExplanationDAO.createNewAlgorithmExplanation(algorithmExplanationVO);
		return createCount > 0;
	}

	@Override
	public AlgorithmExplanationVO getOneAlgorithmExplanation(String companyAlgorithmExplanationId, boolean isIncrease) {
		if (isIncrease) {
			int updateCount = algorithmExplanationDAO.increaseViewCount(companyAlgorithmExplanationId);
			if(updateCount == 0) {
				throw new PageNotFoundException("잘못된 접근입니다.");
			}
		}
		AlgorithmExplanationVO algorithmExplanationVO 
		               = algorithmExplanationDAO.getOneAlgorithmExplanation(companyAlgorithmExplanationId);
		if (algorithmExplanationVO == null) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		return algorithmExplanationVO;
	}

	@Transactional
	@Override
	public boolean updateOneAlgorithmExplanation(AlgorithmExplanationVO algorithmExplanationVO) {
		int updateCount =  algorithmExplanationDAO.updateOneAlgorithmExplanation(algorithmExplanationVO);
		return updateCount > 0;
	}

	@Transactional
	@Override
	public boolean deleteOneAlgorithmExplanation(String companyAlgorithmExplanationId) {
		int deleteCount = algorithmExplanationDAO.deleteOneAlgorithmExplanation(companyAlgorithmExplanationId);
		return deleteCount > 0;
	}

	// 기업회원 내 게시글 조회
	@Override
	public AlgorithmExplanationListVO getCompanyMyPost(AbstractCompanyPostVO abstractCompanyPostVO) {
		AlgorithmExplanationListVO algorithmExplanationListVO = new AlgorithmExplanationListVO();
		algorithmExplanationListVO.setAlgorithmExplanationList(algorithmExplanationDAO.getCompanyMyPost(abstractCompanyPostVO));
		return algorithmExplanationListVO;
	}
	
	// 통합검색
	@Override
	public AlgorithmExplanationListVO searchAllAlgorithmExplanationByKeyword(AbstractSearchVO abstractSearchVO) {
		
		if (abstractSearchVO == null || abstractSearchVO.getSearchKeyword() == null || abstractSearchVO.getSearchKeyword().length() == 0) {
			return new AlgorithmExplanationListVO();
		}
		AlgorithmExplanationListVO algorithmExplanationListVO = new AlgorithmExplanationListVO();
		algorithmExplanationListVO.setAlgorithmExplanationList(algorithmExplanationDAO.searchAllAlgorithmExplanationByKeyword(abstractSearchVO));
		return algorithmExplanationListVO;
	}
}
