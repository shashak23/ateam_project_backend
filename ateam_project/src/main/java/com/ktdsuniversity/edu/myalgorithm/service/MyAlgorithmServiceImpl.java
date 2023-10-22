/**
 * 작성자: 김태현
 * 수정자: 장보늬(2023-10-19)
 * 작성일자: 2023-10-12
 * 내용: 내가 푼 알고리즘 문제들의 쿼리 수행 결과를 저장하는 클래스입니다.
 */

package com.ktdsuniversity.edu.myalgorithm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktdsuniversity.edu.myalgorithm.dao.MyAlgorithmDAO;
import com.ktdsuniversity.edu.myalgorithm.vo.MyAlgorithmListVO;
import com.ktdsuniversity.edu.myalgorithm.vo.MyAlgorithmVO;
import com.ktdsuniversity.edu.myalgorithm.vo.SearchMyAlgorithmVO;

@Service
public class MyAlgorithmServiceImpl implements MyAlgorithmService{
	@Autowired
	private MyAlgorithmDAO myAlgorithmDAO;
	
	@Override
	public MyAlgorithmListVO getAllMyAlgorithm(SearchMyAlgorithmVO searchMyAlgorithmVO) {
		MyAlgorithmListVO myList = new MyAlgorithmListVO();
		myList.setMyAlgotirhmListCnt(myAlgorithmDAO.getAllNumber(searchMyAlgorithmVO));
		myList.setMyAlgorithmList(myAlgorithmDAO.getAllMyAlgorithmList(searchMyAlgorithmVO));
		return myList;
	}

	@Transactional
	@Override
	public boolean createNewMyAlgorithm(MyAlgorithmVO myAlgorithmVO) {
		int createCount = myAlgorithmDAO.createNewMyAlgorithm(myAlgorithmVO);
		
		return createCount > 0;
	}
	
	@Transactional
	@Override
	public boolean deleteMyAlgorithm(String myAlgorithmQuestionId) {
		int deleteCount = myAlgorithmDAO.deleteMyAlgorithm(myAlgorithmQuestionId);
		return deleteCount > 0;
	}

}
