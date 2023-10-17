package com.ktdsuniversity.edu.myalgorithm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktdsuniversity.edu.myalgorithm.dao.MyAlgorithmDAO;
import com.ktdsuniversity.edu.myalgorithm.vo.MyAlgorithmListVO;

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
}
