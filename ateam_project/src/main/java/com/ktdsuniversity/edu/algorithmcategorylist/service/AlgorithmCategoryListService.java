package com.ktdsuniversity.edu.algorithmcategorylist.service;

import java.util.List;

import com.ktdsuniversity.edu.algorithmcategorylist.vo.AlgorithmCategoryListVO;

public interface AlgorithmCategoryListService {
	
	public List<AlgorithmCategoryListVO> categorySearch(String postId);

}
