/**
 * 작성자: 김태현
 * 수정자: 장보늬(2023-10-19)
 * 작성일자: 2023-10-12
 * 내용: 내가 푼 알고리즘 문제들의 쿼리 수행 결과를 저장하는 클래스입니다.
 */

package com.ktdsuniversity.edu.myalgorithm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktdsuniversity.edu.coderuntime.CodeRuntime;
import com.ktdsuniversity.edu.myalgorithm.dao.MyAlgorithmDAO;
import com.ktdsuniversity.edu.myalgorithm.vo.AnswerResultVO;
import com.ktdsuniversity.edu.myalgorithm.vo.MyAlgorithmListVO;
import com.ktdsuniversity.edu.myalgorithm.vo.MyAlgorithmVO;
import com.ktdsuniversity.edu.myalgorithm.vo.SearchMyAlgorithmVO;

@Service
public class MyAlgorithmServiceImpl implements MyAlgorithmService{
	@Autowired
	private MyAlgorithmDAO myAlgorithmDAO;
	
	@Autowired
	private CodeRuntime codeRuntime;
	
	@Override
	public MyAlgorithmListVO getAllMyAlgorithm(SearchMyAlgorithmVO searchMyAlgorithmVO) {
		MyAlgorithmListVO myList = new MyAlgorithmListVO();
		myList.setMyAlgotirhmListCnt(myAlgorithmDAO.getAllNumber(searchMyAlgorithmVO));
		myList.setMyAlgorithmList(myAlgorithmDAO.getAllMyAlgorithmList(searchMyAlgorithmVO));
		return myList;
	}

	@Transactional
	@Override
	public AnswerResultVO createNewMyAlgorithm(MyAlgorithmVO myAlgorithmVO) {
		
		codeRuntime.setCode(myAlgorithmVO.getMyAnswer());
		
		List<String> processResult = codeRuntime.run(null);
		
		int createCount = myAlgorithmDAO.createNewMyAlgorithm(myAlgorithmVO);
		
		AnswerResultVO arVO = new AnswerResultVO();
		arVO.setInsertResult(createCount > 0);
		arVO.setCodeResultList(processResult);
		
		return arVO;
	}
	
	@Transactional
	@Override
	public boolean deleteMyAlgorithm(String myAlgorithmQuestionId) {
		int deleteCount = myAlgorithmDAO.deleteMyAlgorithm(myAlgorithmQuestionId);
		return deleteCount > 0;
	}

}
