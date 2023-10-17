/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 내용: 알고리즘문제 게시판의 CRUD 실행결과를 저장합니다.
 */

package com.ktdsuniversity.edu.algorithmquestion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktdsuniversity.edu.algorithmquestion.dao.AlgorithmQuestionDAO;
import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionListVO;
import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionVO;
import com.ktdsuniversity.edu.algorithmquestion.vo.SearchAlgorithmQuestionVO;
import com.ktdsuniversity.edu.exceptions.PageNotFoundException;
import com.ktdsuniversity.edu.myalgorithm.dao.MyAlgorithmDAO;
import com.ktdsuniversity.edu.myalgorithm.vo.MyAlgorithmVO;

@Service
public class AlgorithmQuestionServiceImpl implements AlgorithmQuestionService {

	@Autowired
	private AlgorithmQuestionDAO algorithmQuestionDAO;
	
	@Autowired
	private MyAlgorithmDAO myAlgorithmDAO;
	
	@Override
	public AlgorithmQuestionListVO getAllAlgorithmQuestion(SearchAlgorithmQuestionVO searchAlgorithmQuestionVO) {
		
		AlgorithmQuestionListVO algorithmQuestionListVO = new AlgorithmQuestionListVO();
		algorithmQuestionListVO.setAlgorithmQuestionCnt(algorithmQuestionDAO.getAlgorithmQuestionAllCount(searchAlgorithmQuestionVO));
		algorithmQuestionListVO.setAlgorithmQuestionList(algorithmQuestionDAO.searchAllAlgorithmQuestion(searchAlgorithmQuestionVO));
		
		return algorithmQuestionListVO;
	}

	@Override
	public boolean createNewAlgorithmQuestion(AlgorithmQuestionVO algorithmQuestionVO) {
		
		int createCount = algorithmQuestionDAO.createNewAlgorithmQuestion(algorithmQuestionVO);
	
		return createCount > 0;
	}


	@Override
	public boolean createNewMyAlgorithm(MyAlgorithmVO myAlgorithmVO) {
		int createMyAlgorithmCount = algorithmQuestionDAO.createNewMyAlgorithm(myAlgorithmVO);
		return createMyAlgorithmCount > 0;
	}
	
	@Override
	public AlgorithmQuestionVO getOneAlgorithmQuestion(String companyAlgorithmQuestionId, boolean isIncrease) {
		if(isIncrease) {
			int updateCount = algorithmQuestionDAO.increaseViewCount(companyAlgorithmQuestionId);
			if(updateCount == 0) {
				throw new PageNotFoundException("잘못된 접근입니다.");
			}
		}
		AlgorithmQuestionVO algorithmQuestionVO = algorithmQuestionDAO.getOneAlgorithmQuestion(companyAlgorithmQuestionId);
		if(algorithmQuestionVO == null) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		return algorithmQuestionVO;
	}

	@Override
	public boolean updateOneAlgorithmQuestion(AlgorithmQuestionVO algorithmQuestionVO) {
		int updateCount = algorithmQuestionDAO.updateOneAlgorithmQuestion(algorithmQuestionVO);
		return updateCount > 0;
	}

	@Override
	public boolean deleteOneAlgorithmQuestion(String companyAlgorithmQuestionId) {
		int deleteCount = algorithmQuestionDAO.deleteOneAlgorithmQuestion(companyAlgorithmQuestionId);
		return deleteCount > 0;
	}

}
