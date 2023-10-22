/**
 * 작성자: 김태현
 * 수정자: 장보늬(2023-10-19)
 * 작성일자: 2023-10-12
 * 내용: 내가 푼 알고리즘 문제들의 쿼리를 수행하는 클래스입니다.
 */

package com.ktdsuniversity.edu.myalgorithm.dao;

import java.util.List;

import com.ktdsuniversity.edu.myalgorithm.vo.MyAlgorithmVO;
import com.ktdsuniversity.edu.myalgorithm.vo.SearchMyAlgorithmVO;

public interface MyAlgorithmDAO {
	public int getAllNumber(SearchMyAlgorithmVO searchMyAlgorithmVO);
	
	public List<MyAlgorithmVO> getAllMyAlgorithmList(SearchMyAlgorithmVO searchMyAlgorithmVO);
	
	public List<MyAlgorithmVO> searchAllMyAlgorithm(SearchMyAlgorithmVO searchMyAlgorithmVO);
	
	public int createNewMyAlgorithm(MyAlgorithmVO myAlgorithmVO);
	
	public int deleteMyAlgorithm(String myAlgorithmQuestionId);
}
