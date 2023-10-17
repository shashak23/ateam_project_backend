/**
 * 작성자: 김태현
 * 작성일자: 2023-10-12
 * 내용: 내가 푼 알고리즘 문제들의 쿼리를 수행하는 클래스입니다.
 */

package com.ktdsuniversity.edu.myalgorithm.dao;

import java.util.List;

import com.ktdsuniversity.edu.myalgorithm.vo.MyAlgorithmVO;

public interface MyAlgorithmDAO {
	public int getAllNumber(String email);
	public List<MyAlgorithmVO> getAllMyAlgorithmList(String email);
	
	
}
