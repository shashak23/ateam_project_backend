/**
 * 작성자: 김태현
 * 수정자: 장보늬(2023-10-28)
 * 작성일자: 2023-10-12
 * 내용: 내가 푼 알고리즘 문제들의 쿼리 수행 결과를 저장하는 클래스입니다.
 */

package com.ktdsuniversity.edu.myalgorithm.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktdsuniversity.edu.algorithmanswer.dao.AlgorithmAnswerDAO;
import com.ktdsuniversity.edu.algorithmanswer.vo.AlgorithmAnswerVO;
import com.ktdsuniversity.edu.coderuntime.CodeRuntime;
import com.ktdsuniversity.edu.myalgorithm.dao.MyAlgorithmDAO;
import com.ktdsuniversity.edu.myalgorithm.vo.AnswerResultVO;
import com.ktdsuniversity.edu.myalgorithm.vo.MyAlgorithmListVO;
import com.ktdsuniversity.edu.myalgorithm.vo.MyAlgorithmVO;
import com.ktdsuniversity.edu.myalgorithm.vo.SearchMyAlgorithmVO;

@Service
public class MyAlgorithmServiceImpl implements MyAlgorithmService{
	
	private Logger logger = LoggerFactory.getLogger(MyAlgorithmServiceImpl.class);
	
	@Autowired
	private MyAlgorithmDAO myAlgorithmDAO;
	
	@Autowired
	private CodeRuntime codeRuntime;
	
	@Autowired
	private AlgorithmAnswerDAO algorithmAnswerDAO;
	
	@Override
	public MyAlgorithmListVO getAllMyAlgorithm(SearchMyAlgorithmVO searchMyAlgorithmVO) {
		MyAlgorithmListVO myList = new MyAlgorithmListVO();
		myList.setMyAlgotirhmListCnt(myAlgorithmDAO.getAllNumber(searchMyAlgorithmVO));
		
		if (searchMyAlgorithmVO == null) {
			myList.setMyAlgorithmList(myAlgorithmDAO.getAllMyAlgorithmList(searchMyAlgorithmVO));			
		}
		else {
			myList.setMyAlgorithmList(myAlgorithmDAO.searchAllMyAlgorithm(searchMyAlgorithmVO));			
		}
		return myList;
	}

	@Transactional
	@Override
	public AnswerResultVO createNewMyAlgorithm(MyAlgorithmVO myAlgorithmVO) {
		
		codeRuntime.setCode(myAlgorithmVO.getMyAnswer());
		
		List<AlgorithmAnswerVO> answerList = algorithmAnswerDAO.getAlgorithmAnswer(myAlgorithmVO.getCompanyAlgorithmQuestionId());
		List<String> processResult = new ArrayList<>();
		AnswerResultVO arVO = new AnswerResultVO();
		List<String> message = new ArrayList<>();
		
		if (answerList != null) {
			for (AlgorithmAnswerVO answer : answerList) {
				String content = answer.getContent();
				logger.debug("content: " + content);
				
				// 테스트 데이터에 작성된 결과 값
				int result = answer.getResult();
				logger.debug("result: " + result);
				
				List<String> runResult = codeRuntime.run(content);
				logger.debug("codeRuntime.run 결과: " + runResult);
				
				// 회원이 입력한 결과 값
				int memberAnswer = Integer.parseInt(runResult.get(1));
				
				if (memberAnswer == result) {
					arVO.setCorrect(true);
					message.add("정답");
				}
				else {
					arVO.setCorrect(false);
					message.add("오답");
				}
				processResult.addAll(runResult);
				logger.debug("정답여부: " + message);
				
			}
			codeRuntime.teardown();

			// "오답"이 포함되어 있는지 확인
			boolean containsWrongAnswer = false;
			if (message != null) {
				for (String msg : message) {
					if (msg != null && msg.contains("오답")) {
						containsWrongAnswer = true;
						break;
					}
				}
			}
			
			// "CORRECT_ANSWER_YN" 값을 설정
			myAlgorithmVO.setCorrectAnswerYn(containsWrongAnswer ? "N" : "Y");
			
			// 팝업 메시지 설정
			String popupMessage = containsWrongAnswer ? "오답입니다." : "정답입니다.";
			
			logger.debug("팝업메세지: " + popupMessage);
			arVO.setPopupMessage(popupMessage);
		}
		int createCount = myAlgorithmDAO.createNewMyAlgorithm(myAlgorithmVO);
		
		
		arVO.setInsertResult(createCount > 0);
		arVO.setCodeResultList(processResult);
		arVO.setMessage(message);
		logger.debug("정답여부: " + message);
		logger.debug("실행결과: " + processResult);
		
		return arVO;
	}
	
	@Transactional
	@Override
	public boolean deleteMyAlgorithm(String myAlgorithmQuestionId) {
		int deleteCount = myAlgorithmDAO.deleteMyAlgorithm(myAlgorithmQuestionId);
		return deleteCount > 0;
	}

}
