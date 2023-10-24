/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 내용: 알고리즘문제 게시판의 CRUD 실행결과를 저장합니다.
 */

package com.ktdsuniversity.edu.algorithmquestion.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.ktdsuniversity.edu.algorithmanswer.dao.AlgorithmAnswerDAO;
import com.ktdsuniversity.edu.algorithmquestion.dao.AlgorithmQuestionDAO;
import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionListVO;
import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionVO;
import com.ktdsuniversity.edu.algorithmquestion.vo.SearchAlgorithmQuestionVO;
import com.ktdsuniversity.edu.common.vo.AbstractSearchVO;
import com.ktdsuniversity.edu.exceptions.PageNotFoundException;
@Service
public class AlgorithmQuestionServiceImpl implements AlgorithmQuestionService {

	private Logger logger = LoggerFactory.getLogger(AlgorithmQuestionServiceImpl.class);
	
	@Autowired
	private AlgorithmQuestionDAO algorithmQuestionDAO;
	
	@Autowired
	private AlgorithmAnswerDAO algorithmAnswerDAO;
	
	@Override
	public AlgorithmQuestionListVO getAllAlgorithmQuestion(SearchAlgorithmQuestionVO searchAlgorithmQuestionVO) {
		
		AlgorithmQuestionListVO algorithmQuestionListVO = new AlgorithmQuestionListVO();
		algorithmQuestionListVO.setAlgorithmQuestionCnt(algorithmQuestionDAO.getAlgorithmQuestionAllCount(searchAlgorithmQuestionVO));
		if(searchAlgorithmQuestionVO == null) {
			algorithmQuestionListVO.setAlgorithmQuestionList(algorithmQuestionDAO.getAllAlgorithmQuestion());
		}
		else {			
			algorithmQuestionListVO.setAlgorithmQuestionList(algorithmQuestionDAO.searchAllAlgorithmQuestion(searchAlgorithmQuestionVO));
		}
		return algorithmQuestionListVO;
	}
	
	@Transactional
	@Override
	public boolean createNewAlgorithmQuestion(AlgorithmQuestionVO algorithmQuestionVO) {
		
		Gson gson = new Gson();
		
		algorithmQuestionVO.setMainAlgorithmCategoryId(algorithmQuestionVO.getAlgorithmCategoryIdList().get(0));
		
		int createCount = algorithmQuestionDAO.createNewAlgorithmQuestion(algorithmQuestionVO);
	
		if (createCount > 0) {
			int createCategoryCount = algorithmQuestionDAO.createNewAlgorithmQuestionCategory(algorithmQuestionVO);
			logger.debug("{}: Insert Category Count: {}", algorithmQuestionVO.getCompanyAlgorithmQuestionId(), createCategoryCount);
			
			int insertCount = 0;
			List<Map<String, Object>> contentMap = gson.fromJson(algorithmQuestionVO.getContent(), List.class);
			for (Map<String, Object> map : contentMap) {
				int result = (int) Double.parseDouble(map.get("result").toString());
				map.remove("result");
				String json = gson.toJson(map);
				
				algorithmQuestionVO.setContent(json);
				algorithmQuestionVO.setResult(result);
				
				insertCount += algorithmAnswerDAO.createAlgorithmAnswer(algorithmQuestionVO);
			}
			
			logger.debug("{}: Insert Answer Count: {}", algorithmQuestionVO.getCompanyAlgorithmQuestionId(), insertCount);
		}
		
		return createCount > 0;
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

	@Transactional
	@Override
	public boolean updateOneAlgorithmQuestion(AlgorithmQuestionVO algorithmQuestionVO) {
		algorithmQuestionVO.setMainAlgorithmCategoryId(algorithmQuestionVO.getAlgorithmCategoryIdList().get(0));
		int updateCount = algorithmQuestionDAO.updateOneAlgorithmQuestion(algorithmQuestionVO);
		
		if(updateCount > 0) {
			int deleteCategoryCount = algorithmQuestionDAO.deleteAlgorithmQuestionCategory(algorithmQuestionVO);
			logger.debug("{}: Delete Category Count: {}", algorithmQuestionVO.getCompanyAlgorithmQuestionId(), deleteCategoryCount);
			int insertCategoryCount = algorithmQuestionDAO.insertAlgorithmQuestionCategory(algorithmQuestionVO);
			logger.debug("{}: Insert Category Count: {}", algorithmQuestionVO.getCompanyAlgorithmQuestionId(), insertCategoryCount);
		}
		return updateCount > 0;
	}
	
	@Transactional
	@Override
	public boolean deleteOneAlgorithmQuestion(String companyAlgorithmQuestionId) {
		int deleteCount = algorithmQuestionDAO.deleteOneAlgorithmQuestion(companyAlgorithmQuestionId);
		return deleteCount > 0;
	}

	@Override
	public AlgorithmQuestionListVO searchAllAlgorithmQuestionByKeyword(AbstractSearchVO abstractSearchVO) {
		
		if ( abstractSearchVO == null || abstractSearchVO.getSearchKeyword() == null || abstractSearchVO.getSearchKeyword().length() == 0) {
			return new AlgorithmQuestionListVO();
		}
		
		AlgorithmQuestionListVO algorithmQuestionListVO = new AlgorithmQuestionListVO();
		algorithmQuestionListVO.setAlgorithmQuestionList(algorithmQuestionDAO.searchAllAlgorithmQuestionByKeyword(abstractSearchVO));
		return algorithmQuestionListVO;
	}
}
