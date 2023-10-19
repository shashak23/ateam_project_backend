/**
 * 작성자: 김태현
 * 작성일자: 2023-10-12
 * 내용: 내가 푼 알고리즘 문제들의 쿼리 수행 결과를 저장하는 클래스입니다.
 */

package com.ktdsuniversity.edu.myalgorithm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktdsuniversity.edu.myalgorithm.dao.MyAlgorithmDAO;
import com.ktdsuniversity.edu.myalgorithm.vo.MyAlgorithmListVO;
import com.ktdsuniversity.edu.myalgorithm.vo.MyAlgorithmVO;

@Service
public class MyAlgorithmServiceImpl implements MyAlgorithmService{
	@Autowired
	private MyAlgorithmDAO myAlgorithmDAO;
	
	@Override
	public MyAlgorithmListVO getAllMyAlgorithm(String email) {
		MyAlgorithmListVO myList = new MyAlgorithmListVO();
		myList.setMyAlgotirhmListCnt(myAlgorithmDAO.getAllNumber(email));
		myList.setMyAlgorithmList(myAlgorithmDAO.getAllMyAlgorithmList(email));
		return myList;
	}

	@Override
	public boolean createNewMyAlgorithm(MyAlgorithmVO myAlgorithmVO) {
		int createCount = myAlgorithmDAO.createNewMyAlgorithm(myAlgorithmVO);
		
		return createCount > 0;
	}
	
	

}
