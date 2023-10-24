/**
 * 작성자: 김태현
 * 수정자: 장보늬(2023-10-19)
 * 작성일자: 2023-10-12
 * 내용: 내가 푼 알고리즘 문제들의 쿼리 수행 결과를 저장하는 클래스입니다.
 */

package com.ktdsuniversity.edu.myalgorithm.service;

import com.ktdsuniversity.edu.myalgorithm.vo.AnswerResultVO;
import com.ktdsuniversity.edu.myalgorithm.vo.MyAlgorithmListVO;
import com.ktdsuniversity.edu.myalgorithm.vo.MyAlgorithmVO;
import com.ktdsuniversity.edu.myalgorithm.vo.SearchMyAlgorithmVO;

public interface MyAlgorithmService {
	public MyAlgorithmListVO getAllMyAlgorithm(SearchMyAlgorithmVO searchMyAlgorithmVO);
	
	public AnswerResultVO createNewMyAlgorithm(MyAlgorithmVO myAlgorithmVO);
	
	public boolean deleteMyAlgorithm(String myAlgorithmQuestionId);
}
