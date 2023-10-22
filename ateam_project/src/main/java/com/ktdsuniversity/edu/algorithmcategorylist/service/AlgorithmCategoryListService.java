/**
 * 작성자: 장보늬
 * 작성날짜: 2023-10-19
 * 내용: 알고리즘문제가 가지는 카테고리 목록 Service
 * **/
package com.ktdsuniversity.edu.algorithmcategorylist.service;

import java.util.List;

import com.ktdsuniversity.edu.algorithmcategorylist.vo.AlgorithmCategoryListVO;

public interface AlgorithmCategoryListService {
	
	public List<AlgorithmCategoryListVO> categorySearch(String postId);

}
